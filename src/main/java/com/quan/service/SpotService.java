package com.quan.service;

import cn.hutool.log.Log;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quan.entity.Spot;
import com.quan.mapper.SpotMapper;
import org.springframework.stereotype.Service;

/**
 * @CreateTime: 2023-04-28  11:07
 * 博学笃志，砺剑图强
 */
@Service
public class SpotService extends ServiceImpl<SpotMapper,Spot> {
    private static final Log LOG = Log.get();

    public Boolean saveSpot(Spot spot){
        return saveOrUpdate(spot);
    }


}


