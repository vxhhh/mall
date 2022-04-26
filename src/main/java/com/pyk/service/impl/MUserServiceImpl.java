package com.pyk.service.impl;

import com.pyk.entity.MUser;
import com.pyk.mapper.MUserMapper;
import com.pyk.service.MUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author admin
 * @since 2022-03-28
 */
@Service
public class MUserServiceImpl extends ServiceImpl<MUserMapper, MUser> implements MUserService {

}
