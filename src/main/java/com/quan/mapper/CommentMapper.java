package com.quan.mapper;



import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quan.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CommentMapper extends BaseMapper<Comment> {
    @Select("select c.*,u.nickname,u.avata_url from t_comment c left join sys_user u on c.user_id = u.id " +
            "where c.article_id = #{articleId} order by id desc")
    List<Comment> findCommentDetail(@Param("articleId") Integer articleId);
}
