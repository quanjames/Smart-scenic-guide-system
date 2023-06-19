package com.quan.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quan.controller.dto.UserPasswordDTO;
import com.quan.entity.User;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {
//    @Select("SELECT * from sys_user")
//    List<User> findAll();
//
//    @Insert("INSERT into sys_user(username, password,nickname,email,phone,address) VALUES (#{username}, #{password}," +
//            " #{nickname}, #{email},#{phone}, #{address})")
//    int insert(User user);
//
//    int update(User user);
//
//    @Delete("delete from sys_user where id = #{id}")
//    Integer deleteById(@Param("id") Integer id);
//
//    @Select("select * from sys_user where username like #{username} limit #{pageNum}, #{pageSize}")
//    public List<User> selectPage(@Param("pageNum") Integer pageNum,
//                                 @Param("pageSize") Integer pageSize,
//                                 @Param("username") String username);
//
//    @Select("select count(*) from sys_user where username like concat('%', #{username}, '%') ")
//    public Integer selectTotal(@Param("username") String username);
    @Update("update sys_user set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(UserPasswordDTO userPasswordDTO);
}