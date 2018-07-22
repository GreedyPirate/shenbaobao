package com.chamc.process.mapper;

import com.chamc.process.entity.Attachment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Jaynnay on 2018/2/28
 **/
public interface AttachmentMapper {

    /**
     * 保存附件信息
     *
     * @param attachment
     */
    void save(Attachment attachment);

    /**
     * 获取用户的所有附件信息
     *
     * @param userid
     * @return
     */
    List<Attachment> getUserAttach(@Param("userid") Long userid);

    /**
     * 通过id查询附件
     *
     * @param id
     * @return
     */
    Attachment getById(@Param("id") Long id);

    /**
     * 通过id数组，查询url
     *
     * @param ids
     * @return
     */
    List<Attachment> getUrlByIds(@Param("ids") Long[] ids);

    /**
     * 通过id数组删除数据
     *
     * @param ids
     * @return
     */
    Integer deleteByIds(@Param("ids") Long[] ids);
}
