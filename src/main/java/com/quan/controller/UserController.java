package com.quan.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quan.common.Constants;
import com.quan.common.Result;
import com.quan.controller.dto.UserDTO;
import com.quan.controller.dto.UserPasswordDTO;
import com.quan.entity.User;
import com.quan.mapper.UserMapper;
import com.quan.service.UserService;

import com.quan.utils.TokenUtils;
import org.apache.logging.log4j.util.PerformanceSensitive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static net.sf.jsqlparser.util.validation.metadata.NamedObject.user;

/**
 * @CreateTime: 2023-03-25  11:31
 * 博学笃志，砺剑图强
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;

    //登录 @RequestBody :前端传来的JSON 转换为java对象
    @PostMapping("/login")
    public Result login(@RequestBody UserDTO userDTO){
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();
        if(StrUtil.isBlank(username) || StrUtil.isBlank(password)){
            return Result.error(Constants.CODE_400,"参数错误");
        }

        UserDTO dto = userService.login(userDTO);


        return Result.success(dto);
    }

    @PostMapping("/register")
    public Result register(@RequestBody UserDTO userDTO){
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();
        if(StrUtil.isBlank(username) || StrUtil.isBlank(password)){
            return Result.error(Constants.CODE_400,"参数错误");
        }
        User user = userService.register(userDTO);
        return  Result.success(user);
    }
    @PostMapping("/password")
    public Result password(@RequestBody UserPasswordDTO userPasswordDTO){
        userPasswordDTO.setPassword(userPasswordDTO.getPassword());
        userPasswordDTO.setNewPassword(userPasswordDTO.getNewPassword());
        userService.updatePassword(userPasswordDTO);
        return Result.success();
    }

    @GetMapping("/username/{username}")
    public Result findone(@PathVariable String username){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        return Result.success(userService.getOne(queryWrapper));

    }


    //新增和修改
    @PostMapping
    public Result save(@RequestBody User user){
        return Result.success(userService.saveUser(user));
    }
    @GetMapping
    public List<User> index(){
        return userService.list();
    }


    @DeleteMapping("{id}")
    public Boolean delete(@PathVariable Integer id){
        return userService.removeById(id);
    }


    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return userService.removeBatchByIds(ids);
    }


    @GetMapping("/page")
    public IPage<User> findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String username,
                                @RequestParam(defaultValue = "") String email,
                                @RequestParam(defaultValue = "") String address) {

        Page<User> page = new Page<>(pageNum, pageSize);
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if (!"".equals(username)) {
            queryWrapper.like("username", username);
        }
        if (!"".equals(email)) {
            queryWrapper.like("email", email);
        }
        if (!"".equals(address)) {
            queryWrapper.like("address", address);
        }
        queryWrapper.orderByDesc("id");
        //User currentUser = TokenUtils.getCurrentUser();
        //System.out.println("======================="+currentUser.getUsername());
        return userService.page(page, queryWrapper);

    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<User> list = userService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("username", "用户名");
        writer.addHeaderAlias("password", "密码");
        writer.addHeaderAlias("nickname", "昵称");
        writer.addHeaderAlias("email", "邮箱");
        writer.addHeaderAlias("phone", "电话");
        writer.addHeaderAlias("address", "地址");
        writer.addHeaderAlias("createTime", "创建时间");
        writer.addHeaderAlias("avatarUrl", "头像");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("用户信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    @PostMapping("/import")
    public Boolean imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 方式1：(推荐) 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
//        List<User> list = reader.readAll(User.class);
//        System.out.println(list);
//        userService.saveBatch(list);
//        return true;
        // 方式2：忽略表头的中文，直接读取表的内容
        List<List<Object>> list = reader.read(1);
        List<User> users = CollUtil.newArrayList();
        for (List<Object> row : list) {
            User user = new User();
            user.setUsername(row.get(0).toString());
            user.setPassword(row.get(1).toString());
            user.setNickname(row.get(2).toString());
            user.setEmail(row.get(3).toString());
            user.setPhone(row.get(4).toString());
            user.setAddress(row.get(5).toString());
            user.setAvatarUrl(row.get(6).toString());
            users.add(user);
        }

        userService.saveBatch(users);
        return true;
    }
}


