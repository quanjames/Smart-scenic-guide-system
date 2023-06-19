package com.quan.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quan.entity.Show;
import com.quan.mapper.ShowMapper;
import org.springframework.stereotype.Service;

/**
 * @CreateTime: 2023-05-14  20:00
 * 博学笃志，砺剑图强
 */

@Service
public class ShowService extends ServiceImpl<ShowMapper, Show> {

    public Boolean saveShow(Show show){
        return saveOrUpdate(show);
    }

}


