package com.quan.utils;

/**
 * @CreateTime: 2023-04-01  18:49
 * 博学笃志，砺剑图强
 */
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.quan.entity.Admin;
import com.quan.entity.User;
import com.quan.service.AdminService;
import com.quan.service.UserService;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Component
public class TokenUtils {

    private static UserService staticUserService;

    private static AdminService staticAdminService;

    @Resource
    private UserService userService;

    @Resource
    private AdminService adminService;

    @PostConstruct
    public void setUserService() {
        staticUserService = userService;
    }

    @PostConstruct
    public void setAdminService() {
        staticAdminService = adminService;
    }

    /**
     * 生成token
     *
     * @return
     */
    public static String genToken(String userId, String sign) {
        return JWT.create().withAudience(userId) // 将 user id 保存到 token 里面,作为载荷
                .withExpiresAt(DateUtil.offsetHour(new Date(), 2)) // 2小时后token过期
                .sign(Algorithm.HMAC256(sign)); // 以 password 作为 token 的密钥
    }
    /**
     * 生成token
     *
     * @return
     */
    public static String genToken1(String adminId, String signa) {
        return JWT.create().withAudience(adminId) // 将 user id 保存到 token 里面,作为载荷
                .withExpiresAt(DateUtil.offsetHour(new Date(), 2)) // 2小时后token过期
                .sign(Algorithm.HMAC256(signa)); // 以 password 作为 token 的密钥
    }

    /**
     * 获取当前登录的用户信息
     *j静态方法，获取静态对象
     * @return user对象
     */
    public static User getCurrentUser() {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String token = request.getHeader("token");
            if (StrUtil.isNotBlank(token)) {
                String userId = JWT.decode(token).getAudience().get(0);
                return staticUserService.getById(Integer.valueOf(userId));
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }

    public static Admin getCurrentAdmin() {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String token = request.getHeader("token");
            if (StrUtil.isNotBlank(token)) {
                String adminId = JWT.decode(token).getAudience().get(0);
                return staticAdminService.getById(Integer.valueOf(adminId));
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
}

