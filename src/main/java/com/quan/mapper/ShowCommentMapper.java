package com.quan.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quan.entity.ShowComment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ShowCommentMapper extends BaseMapper<ShowComment> {
    @Select("select c.*,u.nickname,u.avata_url from t_show_comment c left join sys_user u on c.user_id = u.id " +
            "where c.show_id = #{showId} order by id desc")
    List<ShowComment> findCommentDetail(@Param("showId") Integer showId);
}
