package com.pyk.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pyk.configuration.Result;
import com.pyk.entity.MBlog;
import com.pyk.service.MBlogService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 关注公众号：MarkerHub
 * @since 2022-03-21
 */
@RestController
@RequestMapping
public class MBlogController{
    @Autowired
    MBlogService mBlogService;
    @GetMapping("/blogs")
    public Result blogs(Integer currentPage) {
        if(currentPage == null || currentPage < 1) currentPage = 1;
        Page page = new Page(currentPage, 5);
        IPage pageData = mBlogService.page(page, new QueryWrapper<MBlog>().orderByDesc("created"));
        return Result.succ(pageData);
    }
    @GetMapping("/blog/{id}")
    public Result detail(@PathVariable(name = "id") Long id) {
        MBlog mBlog = mBlogService.getById(id);
        Assert.notNull(mBlog, "该博客已删除！");
        return Result.succ(mBlog);
    }

    @PostMapping("/blog/edit")
    public Result edit(@RequestBody @Valid MBlog mBlog) {
        System.out.println(mBlog.toString());
        MBlog temp = null;
        if(mBlog.getId() != null) {
            temp = mBlogService.getById(mBlog.getId());
            temp.setUserId(1L);
//            Assert.isTrue(temp.getUserId().longValue() == ShiroUtil.getProfile().getId().longValue(), "没有权限编辑");
        } else {
            // 添加
            temp = new MBlog();
            temp.setUserId(1L);
            temp.setCreated(LocalDateTime.now());
            temp.setStatus(0);
        }
        BeanUtils.copyProperties(mBlog, temp, "id", "userId", "created", "status");
        mBlogService.saveOrUpdate(temp);
        return Result.succ(null);
    }

    @PostMapping("/blogdel/{id}")
    public Result del(@PathVariable Long id){
        boolean b = mBlogService.removeById(id);
        //判断是否为空 为空则断言异常
        if(b==true){

            return Result.succ("信息删除成功");
        }else{
            return Result.fail("信息删除失败");
        }
    }
}