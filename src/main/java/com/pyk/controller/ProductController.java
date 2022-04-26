package com.pyk.controller;


import com.pyk.entity.Product;
import com.pyk.mapper.ProductMapper;
import com.pyk.service.ProductService;
import com.pyk.vo.BarVO;
import com.pyk.vo.PageVO;
import com.pyk.vo.PieVO;
import com.pyk.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductService productService;


    @GetMapping("/list/{page}/{size}")
    public PageVO list(
            @PathVariable("page") Integer page,
            @PathVariable("size") Integer size
    ){
        return this.productService.voList(page, size);
    }

    @PostMapping("/save")
    public boolean save(@RequestBody Product product){
        return this.productService.save(product);
    }

    @GetMapping("/findById/{id}")
    public ProductVO findById(@PathVariable("id") Integer id){
        return this.productService.findVOById(id);
    }

    @PutMapping("/update")
    public boolean update(@RequestBody Product product){
        return this.productService.updateById(product);
    }

    @DeleteMapping("delete/{id}")
    public boolean delete(@PathVariable("id")Integer id){
        return this.productService.removeById(id);
    }

    @GetMapping("/bar")
    public BarVO bar() {
        List<PieVO> list = this.productMapper.bar();
        BarVO barVO = new BarVO();
        List<String> names = new ArrayList<>();
        List<Integer> values = new ArrayList<>();
        for (PieVO pieVO : list){
            names.add(pieVO.getName());
            values.add(pieVO.getValue());
        }
        barVO.setName(names);
        barVO.setValues(values);
        return barVO;
    }


}

