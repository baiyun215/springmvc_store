package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.Cart;
import cn.itcast.ssm.po.CartQueryVo;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
    
    List<Cart> selectByUserId(Integer userId);
}