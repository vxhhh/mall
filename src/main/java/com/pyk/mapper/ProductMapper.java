package com.pyk.mapper;

import com.pyk.entity.Product;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pyk.vo.PieVO;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author admin
 * @since 2022-03-25
 */
public interface ProductMapper extends BaseMapper<Product> {
    public List<PieVO> bar();
}
