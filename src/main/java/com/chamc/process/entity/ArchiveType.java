package com.chamc.process.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jaynnay on 2018/5/6
 **/
@Data
public class ArchiveType {
    private Long id;
    private String name;
    private String code;

    private List<ArchiveDetail> archiveDetails = new ArrayList<>();

}
