package com.chamc.process.controller;

import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.service.RegistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Jaynnay on 2018/5/6
 **/
@RestController
@RequestMapping("busi")
public class BusinessController {

    @Autowired
    RegistService registerService;

    @GetMapping("preview")
    public List<PreviewForm> preview(Long id){
        return this.registerService.getPreview(id);
    }
}
