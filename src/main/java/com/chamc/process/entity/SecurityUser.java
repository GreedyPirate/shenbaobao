//package com.chamc.process.entity;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.Setter;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import java.util.Collection;
//
///**
// * Created by Jaynnay on 2018/4/28
// **/
//public class SecurityUser extends User implements UserDetails {
//    private static final long serialVersionUID = -7213446378149812109L;
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        return null;
//    }
//
//    /**
//     * 账号是否 未过期
//     * @return
//     */
//    @Override
//    public boolean isAccountNonExpired() {
//        return false;
//    }
//
//    /**
//     * 账号是否 未被锁定
//     * @return
//     */
//    @Override
//    public boolean isAccountNonLocked() {
//        return false;
//    }
//
//    /**
//     * 密码是否 未过期
//     * @return
//     */
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return false;
//    }
//
//    /**
//     * 账号是否激活
//     * @return
//     */
//    @Override
//    public boolean isEnabled() {
//        return false;
//    }
//
//    @AllArgsConstructor
//    enum BooleanEnum{
//        YES(1,'Y'),NO(0,'N');
//        @Setter
//        @Getter
//        private Integer code;
//        @Setter
//        @Getter
//        private char value;
//
//        public BooleanEnum getByCode(Integer code){
//            BooleanEnum[] enumConstants = BooleanEnum.class.getEnumConstants();
//            for (BooleanEnum obj : enumConstants){
//                if (obj.getCode() == code){
//                    return obj;
//                }
//            }
//            return null;
//        }
//    }
//}
