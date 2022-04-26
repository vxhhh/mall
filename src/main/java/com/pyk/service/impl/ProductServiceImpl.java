package com.pyk.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pyk.entity.Product;
import com.pyk.entity.ProductCategory;
import com.pyk.mapper.ProductCategoryMapper;
import com.pyk.mapper.ProductMapper;
import com.pyk.service.ProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pyk.vo.PageVO;
import com.pyk.vo.ProductVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author admin
 * @since 2022-03-25
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductCategoryMapper productCategoryMapper;

    @Override
    public PageVO voList(Integer page, Integer size) {
        Page<Product> productPage = new Page<>(page,size);
        Page<Product> resultPage = this.productMapper.selectPage(productPage, null);
        List<Product> productList = resultPage.getRecords();
        ProductVO  productVO = null;
        List<ProductVO> result = new ArrayList<>();
        for (Product product : productList) {
            productVO = new ProductVO();
            BeanUtils.copyProperties(product, productVO);
            if( product.getCategoryleveloneId()!=null) {
                QueryWrapper<ProductCategory> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("id", product.getCategoryleveloneId());
                ProductCategory productCategory = this.productCategoryMapper.selectOne(queryWrapper);
                productVO.setCategoryOneName(productCategory.getName());
                queryWrapper = new QueryWrapper<>();
                if (product.getCategoryleveltwoId() != null) {
                    queryWrapper.eq("id", product.getCategoryleveltwoId());
                    productCategory = this.productCategoryMapper.selectOne(queryWrapper);
                    productVO.setCategoryTwoName(productCategory.getName());
                    queryWrapper = new QueryWrapper<>();
                    if (product.getCategorylevelthreeId() != null) {
                        queryWrapper.eq("id", product.getCategorylevelthreeId());
                        productCategory = this.productCategoryMapper.selectOne(queryWrapper);
                        productVO.setCategoryThreeName(productCategory.getName());
                    }
                }
            }
            result.add(productVO);
        }
        PageVO pageVO = new PageVO();
        pageVO.setData(result);
        pageVO.setTotal(resultPage.getTotal());
        return pageVO;
    }

    @Override
    public ProductVO findVOById(Integer id) {
        Product product = this.productMapper.selectById(id);
        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product, productVO);
        //一级分类
        QueryWrapper<ProductCategory> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type",1);
        List<ProductCategory> productCategoryList = this.productCategoryMapper.selectList(queryWrapper);
        productVO.setLevelOne(productCategoryList);
        //二级分类
        queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type",2);
        queryWrapper.eq("parent_id",product.getCategoryleveloneId());
        productVO.setLevelTwo(this.productCategoryMapper.selectList(queryWrapper));
        //三级分类
        queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type",3);
        queryWrapper.eq("parent_id",product.getCategoryleveltwoId());
        productVO.setLevelThree(this.productCategoryMapper.selectList(queryWrapper));
        return productVO;
    }
}
