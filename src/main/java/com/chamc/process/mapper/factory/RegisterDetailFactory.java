package com.chamc.process.mapper.factory;

import com.chamc.process.mapper.bo.Location;
import com.chamc.process.mapper.bo.RegisterDetail;

/**
 * Created by Jaynnay on 2018/5/29
 **/
public class RegisterDetailFactory {
    public static RegisterDetail build(RegisterDetail registerDetail,Location location){
        registerDetail.setProvice(location.getProvice());
        registerDetail.setCity(location.getCity());
        registerDetail.setTown(location.getTown());
        return registerDetail;
    }
}
