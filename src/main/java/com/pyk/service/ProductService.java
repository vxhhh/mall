package com.pyk.service;

import com.pyk.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pyk.vo.PageVO;
import com.pyk.vo.ProductVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2022-03-25
 */
public interface ProductService extends IService<Product> {
    public PageVO voList(Integer page, Integer size);
    public ProductVO findVOById(Integer id);
}
