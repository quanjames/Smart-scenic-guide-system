package com.quan.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quan.entity.Spot;
import com.quan.mapper.SpotMapper;
import com.quan.service.SpotService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @CreateTime: 2023-04-28  11:06
 * 博学笃志，砺剑图强
 */
@RestController
@RequestMapping("/spot")
public class SpotController {
    @Autowired
    private SpotService spotService;
    @Autowired
    private SpotMapper spotMapper;

    /**
     * 增
     * @param spot
     * @return
     */
    @PostMapping
    public Boolean save(@RequestBody Spot spot){
        return spotService.saveSpot(spot);
    }

    /**
     * 查
     * @return
     */
    @GetMapping
    public List<Spot> index(){
        return spotService.list();
    }

    /**
     * 用id删除一条记录
     * @param id
     * @return
     */
    @DeleteMapping("{id}")
    public Boolean delete(@PathVariable Integer id){
        return spotService.removeById(id);
    }
    @PostMapping("/del/batch")
    public boolean deleteBatch(@RequestBody List<Integer> ids){
        return spotService.removeBatchByIds(ids);
    }

    @GetMapping("/page")
    public IPage<Spot> findpage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String touristname){
        Page<Spot> page = new Page<Spot>(pageNum,pageSize);
        QueryWrapper<Spot> queryWrapper = new QueryWrapper<>();
        if(!"".equals(touristname)){
            queryWrapper.like("touristname",touristname);
        }
        queryWrapper.orderByDesc("id");
        return spotService.page(page,queryWrapper);
    }
}


