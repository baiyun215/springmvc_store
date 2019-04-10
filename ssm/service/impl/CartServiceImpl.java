package cn.itcast.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.CartMapper;
import cn.itcast.ssm.po.Cart;
import cn.itcast.ssm.po.CartQueryVo;
import cn.itcast.ssm.service.CartService;

public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int addCart(Cart cart) throws Exception {
		
		cartMapper.insertSelective(cart);
		return 0;
	}

	@Override
	public List<Cart> selectByUserId(Integer userId) throws Exception {
		
		return cartMapper.selectByUserId(userId);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) throws Exception {
		
		cartMapper.deleteByPrimaryKey(id);
		return 0;
	}

	@Override
	public Cart selectByPrimaryKey(Integer id) {
		
		return cartMapper.selectByPrimaryKey(id);
	}

}
