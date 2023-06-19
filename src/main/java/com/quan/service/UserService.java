package com.quan.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quan.common.Constants;
import com.quan.controller.dto.UserDTO;
import com.quan.controller.dto.UserPasswordDTO;
import com.quan.entity.User;
import com.quan.exception.ServiceException;
import com.quan.mapper.UserMapper;


import com.quan.utils.TokenUtils;
import net.sf.jsqlparser.util.validation.metadata.NamedObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

import static org.springframework.boot.Banner.Mode.LOG;

/**
 * @CreateTime: 2023-03-25  15:11
 * 博学笃志，砺剑图强
 */
@Service
public class UserService extends ServiceImpl<UserMapper,User> {

    private static final Log LOG = Log.get();
    @Resource
    private UserMapper userMapper;


    public Boolean saveUser(User user) {
//        if(user.getId() == null) {
//            boolean save = save(user);
//        }else{
//            return updateById(user);
//        }
        return saveOrUpdate(user);
    }

    /*public boolean login(UserDTO userDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",userDTO.getUsername());
        queryWrapper.eq("password",userDTO.getPassword());
//        List<User> list = list(queryWrapper);
//        return list.size()!=0;   假设数据库中有两条用户名和密码相同的数据的 处理方式
        User one = null;
        try {
            one = getOne(queryWrapper);
            return one != null;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
    }*/
    public UserDTO login(UserDTO userDTO) {
        User one = getUserInfo(userDTO);
        if (one != null) {
            BeanUtil.copyProperties(one, userDTO, true);
            String token = TokenUtils.genToken(one.getId().toString(), one.getPassword());
            userDTO.setToken(token);

            return userDTO;
        } else {
            throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
        }
    }
    public User register(UserDTO userDTO) {
        User one = getUserInfo(userDTO);
        if (one == null) {
            one = new User();
            BeanUtil.copyProperties(userDTO, one, true);
            save(one);  // 把 copy完之后的用户对象存储到数据库
        } else {
            throw new ServiceException(Constants.CODE_600, "用户已存在");
        }
        return one;
    }


    public User getUserInfo(UserDTO userDTO){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",userDTO.getUsername());
        queryWrapper.eq("password",userDTO.getPassword());
        User one;
        try {
            one = getOne(queryWrapper);
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return one;
    }
    public void updatePassword(UserPasswordDTO userPasswordDTO) {
        int update = userMapper.updatePassword(userPasswordDTO);
        if (update < 1) {
            throw new ServiceException(Constants.CODE_600, "密码错误");
        }
    }

//    @Autowired
//    private UserMapper userMapper;
//
//    public int save(User user){
//        if (user.getId() == null) {  // user没有id，则表示是新增
//            return userMapper.insert(user);
//        } else { // 否则为更新
//            return userMapper.update(user);
//        }
//    }
    
}


