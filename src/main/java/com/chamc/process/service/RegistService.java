package com.chamc.process.service;

import com.chamc.process.constants.FileSubfix;
import com.chamc.process.controller.request.ApproveParam;
import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.entity.Register;
import com.chamc.process.entity.User;
import com.chamc.process.mapper.RegisterMapper;
import com.chamc.process.mapper.bo.EmailInfo;
import com.chamc.process.mapper.bo.Location;
import com.chamc.process.mapper.bo.RegisterDetail;
import com.chamc.process.mapper.factory.RegisterDetailFactory;
import com.chamc.process.error.ErrorCode;
import com.chamc.process.error.ProcessException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jaynnay on 2018/5/1
 **/
@Service
public class RegistService {

    private Logger logger = LoggerFactory.getLogger(RegistService.class);

    private final static Integer IS_EMAIL = 34;

    @Autowired
    RegisterMapper registerMapper;

    @Autowired
    HttpServletRequest request;

    @Autowired
    MailService mailService;

    @Transactional
    public Boolean regist(Register register){
        User user = (User) request.getSession().getAttribute("user");
        Integer count = this.getCount(user.getId());
        if(count != null && count > 0){
            throw new ProcessException(ErrorCode.YOU_HAVE_ALREADY_REGISTED);
        }
        register.setUserid(user.getId());
        register.setStatus(1);
        int save = this.registerMapper.save(register);
        return new Boolean(save == 1);
    }

    public RegisterDetail getById(Long id){
        RegisterDetail registerDetail = this.registerMapper.queryDetail(id);
        String[] adminarea = registerDetail.getAdminarea();
        Integer provice = Integer.parseInt(adminarea[0]);
        Integer city = Integer.parseInt(adminarea[1]);
        Integer town = Integer.parseInt(adminarea[2]);
        Location location = this.registerMapper.queryLocation(provice, city, town);
        return RegisterDetailFactory.build(registerDetail,location);
    }

    public List<PreviewForm> getPreview(Long userId){
        // 一个人只能注册一次
        Integer count = this.getCount(userId);
        if(count != null && count > 1){
            throw new ProcessException(ErrorCode.TOO_MUSH_REGISTER);
        }
        return this.registerMapper.getPreview(userId);
    }


    public Register getByUserId(Long userId){
        List<Register> userRegisters = this.registerMapper.getByUserId(userId);
        if(userRegisters.size() > 1){
            throw new ProcessException(ErrorCode.TOO_MUSH_REGISTER);
        }
        return userRegisters.get(0);
    }

    public Register getExcelData(Long userId){
        Register excelDetial = this.registerMapper.getExcelDetial(userId);
        if(null == excelDetial) {
            throw new ProcessException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
        return excelDetial;
    }

    public Boolean delete(Long id){
        return new Boolean(this.registerMapper.deleteById(id) == 1);
    }

    /**
     * 生成pdf，写入到response
     * @param response
     * @param userId
     * @throws Exception
     */
    public void buildPDF(HttpServletResponse response,Long userId) {
        Document document = null;
        try {
            Register excelDetial = this.registerMapper.getExcelDetial(userId);
            String content = buildHTML(excelDetial);
            if(content == null) throw new ProcessException(ErrorCode.BUILD_PDF_FAIL);

            document = new Document(PageSize.A4);

            response.setCharacterEncoding("utf-8");
            response.setContentType("application/octet-stream");
            String fileName = new String("注册申请表".getBytes(),"ISO-8859-1");
            response.setHeader("Content-Disposition", "attachment;fileName=" + fileName + FileSubfix.PDF );
            PdfWriter pdfWriter = PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            XMLWorkerHelper.getInstance().parseXHtml(pdfWriter, document,
                    new ByteArrayInputStream(content.getBytes("Utf-8")),
                    Charset.forName("UTF-8"));

        } catch (IOException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            logger.error("生成pdf出错",e);
            e.printStackTrace();
        } finally {
            if (document != null){
                document.close();
            }
        }
    }

    /**
     * 用freemarker生成HTML模板
     * @param excelDetial
     * @return
     * @throws IOException
     * @throws TemplateException
     */
    private String buildHTML(Register excelDetial)  {
        StringWriter writer = null;
        try {
            Configuration config = new Configuration(Configuration.VERSION_2_3_23);
            config.setDefaultEncoding("UTF-8");
            URL url = this.getClass().getClassLoader().getResource("templates/registPDF.html");
            config.setDirectoryForTemplateLoading(new File(url.getFile()).getParentFile());
            config.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            config.setLogTemplateExceptions(false);
            Template template = config.getTemplate("registPDF.html");
            writer = new StringWriter();
            Map<String, Register> data = new HashMap<>();
            data.put("data",excelDetial);
            template.process(data, writer);//模板和数据的匹配
            writer.flush();
            return writer.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            logger.error("解析freemarker模板出错",e);
            e.printStackTrace();
        } finally {
            if(writer != null){
                try {
                    writer.close();
                } catch (IOException e) {
                    logger.error("关闭freemarker写入流出错",e);
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public List<PreviewForm> getAppList(){
        return this.registerMapper.getAppList();
    }

    private Integer getCount(Long userId){
        return this.registerMapper.getAll(userId);
    }

    @Async("taskExecutor")
    public void sendEmail(Long id){
        EmailInfo email = this.registerMapper.isEmail(id);
        if(email !=null && !StringUtils.isEmpty(email.getEmail()) && email.getReceive().equals(IS_EMAIL)){
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email.getEmail());
            message.setSubject("企业注册申请办理进度通知");
            message.setText("您的申请已审批通过");
            mailService.send(message);
        }
    }

    public Boolean approve(ApproveParam approveParam){
        return new Boolean(this.registerMapper.updateStatus(approveParam.getPass(),approveParam.getMemo(),approveParam.getId()) == 1);
    }
}
