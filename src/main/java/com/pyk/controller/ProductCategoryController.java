package com.pyk.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pyk.entity.ProductCategory;
import com.pyk.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author admin
 * @since 2022-03-25
 */
@RestController
@RequestMapping("/productCategory")
public class ProductCategoryController {

    @Autowired
    private ProductCategoryService productCategoryService;

    @GetMapping("/init")
    public List<ProductCategory> init(){
        QueryWrapper<ProductCategory> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type",1);
        return this.productCategoryService.list(queryWrapper);
    }

    @GetMapping("/children/{level}/{parentId}")
    public List<ProductCategory> children(
            @PathVariable ("level") Integer level,
            @PathVariable("parentId") Integer parentId
    ){
        QueryWrapper<ProductCategory> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type",level);
        queryWrapper.eq("parent_id",parentId);
        return this.productCategoryService.list(queryWrapper);
    }
}

