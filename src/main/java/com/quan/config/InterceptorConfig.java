package com.quan.config;

import com.quan.common.JwtInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @CreateTime: 2023-04-01  19:53
 * 博学笃志，砺剑图强
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(jwtInterceptor())
                .addPathPatterns("/**")  // 拦截所有请求，通过判断token是否合法来决定是否需要登录
                .excludePathPatterns("/user/login", "/user/register", "/**/export", "/**/import","/**/upload","/file/**/","/**");
    }

    @Bean
    public JwtInterceptor jwtInterceptor() {
        return new JwtInterceptor();
    }
}


