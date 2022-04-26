package com.pyk.vo;

import lombok.Data;

import java.util.List;

@Data
public class PageVO {
    private List<ProductVO> data;
    private Long total;
}
