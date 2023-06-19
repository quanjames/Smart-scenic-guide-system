package com.quan.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quan.common.Constants;
import com.quan.controller.dto.AdminDTO;
import com.quan.controller.dto.UserDTO;
import com.quan.entity.Admin;
import com.quan.entity.User;
import com.quan.exception.ServiceException;
import com.quan.mapper.AdminMapper;
import com.quan.utils.TokenUtils;
import org.springframework.stereotype.Service;

import java.util.Collection;

/**
 * @CreateTime: 2023-05-06  20:09
 * 博学笃志，砺剑图强
 */
@Service
public class AdminService extends ServiceImpl<AdminMapper,Admin> {
    private static final Log LOG = Log.get();

    public Boolean saveAdmin(Admin admin){
        return saveOrUpdate(admin);
    }

    public AdminDTO login(AdminDTO adminDTO){

        Admin one = getUserInfo(adminDTO);
        if (one != null) {
            BeanUtil.copyProperties(one, adminDTO, true);
            String token = TokenUtils.genToken(one.getId().toString(), one.getAdminPassword());
            adminDTO.setToken(token);

            return adminDTO;
        } else {
            throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
        }
    }
    public Admin getUserInfo(AdminDTO adminDTO){
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("admin_name",adminDTO.getName());
        queryWrapper.eq("admin_password",adminDTO.getPassword());
//        queryWrapper.eq("admin_nickname",adminDTO.getNickname());
        Admin one;
        try {
            one = getOne(queryWrapper);
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return one;
    }




}


