package com.pyk.vo;

import com.pyk.entity.ProductCategory;
import lombok.Data;

import java.util.List;

@Data
public class ProductVO {
    private Integer id;
    private String name;
    private String description;
    private Float price;
    private Integer stock;
    private Integer categoryleveloneId;
    private Integer categoryleveltwoId;
    private Integer categorylevelthreeId;
    private String categoryOneName;
    private String categoryTwoName;
    private String categoryThreeName;
    private List<ProductCategory> levelOne;
    private List<ProductCategory> levelTwo;
    private List<ProductCategory> levelThree;
}
