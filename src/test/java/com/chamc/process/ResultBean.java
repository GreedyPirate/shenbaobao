package com.chamc.process;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * Created by Jaynnay on 2018/2/26
 **/
@Data
@AllArgsConstructor
public class ResultBean {
    private String value;
    private String label;
    private List<ResultBean> children;
}
