package com.pyk.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author admin
 * @since 2022-03-28
 */
@Data
  @EqualsAndHashCode(callSuper = false)
    public class MUser implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Long id;

    private String username;

    private String avatar;

    private String email;

    private String password;

    private Integer status;

    private LocalDateTime created;

    private LocalDateTime lastLogin;


}
