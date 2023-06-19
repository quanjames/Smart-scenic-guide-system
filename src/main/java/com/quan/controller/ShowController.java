package com.quan.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quan.common.Result;
import com.quan.entity.Show;

import com.quan.mapper.ShowMapper;
import com.quan.service.ShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @CreateTime: 2023-05-14  20:24
 * 博学笃志，砺剑图强
 */
@RestController
@RequestMapping("/show")
public class ShowController {

    @Autowired
    private ShowService showService;
    @Autowired
    private ShowMapper showMapper;

    /**
     * 增
     * @return
     */
    @PostMapping
    public Result save(@RequestBody Show show){
         showService.saveShow(show);
         return  Result.success();
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(showService.getById(id));
    }
    /**
     * 查
     * @return
     */
    @GetMapping
    public List<Show> index(){
       return showService.list();
    }

    /**
     * 用id删除一条记录
     * @param id
     * @return
     */
    @DeleteMapping("{id}")
    public Result delete(@PathVariable Integer id){
         showService.removeById(id);
         return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids){
         showService.removeBatchByIds(ids);
         return Result.success();
    }

    @GetMapping("/page")
    public IPage<Show> findpage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String name){
        Page<Show> page = new Page<Show>(pageNum,pageSize);
        QueryWrapper<Show> queryWrapper = new QueryWrapper<>();
        if(!"".equals(name)){
            queryWrapper.like("name",name);
        }
        queryWrapper.orderByDesc("id");
        return showService.page(page,queryWrapper);
    }
}


