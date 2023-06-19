package com.quan.controller;

import cn.hutool.core.stream.StreamUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quan.common.Constants;
import com.quan.common.Result;
import com.quan.controller.dto.AdminDTO;
import com.quan.entity.Admin;
import com.quan.entity.User;
import com.quan.mapper.AdminMapper;
import com.quan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @CreateTime: 2023-05-06  20:08
 * 博学笃志，砺剑图强
 */
@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @PostMapping("/login")
    public Result login(@RequestBody AdminDTO adminDTO){
        String name =  adminDTO.getName();
        String password = adminDTO.getPassword();
        if(StrUtil.isBlank(name) || StrUtil.isBlank(password)){
            return Result.error(Constants.CODE_400,"参数错误");
        }
        AdminDTO ad = adminService.login(adminDTO);
        return  Result.success(ad);
    }

    @PostMapping
    public Boolean save(@RequestBody Admin admin){
        return  adminService.saveAdmin(admin);
    }
    @GetMapping
    public List<Admin> index(){
        return adminService.list();
    }

    @GetMapping("/adminname/{adminname}")
    public  Result findOne(@PathVariable String adminname){
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("admin_name",adminname);
        return  Result.success(adminService.getOne(queryWrapper));
    }
}


