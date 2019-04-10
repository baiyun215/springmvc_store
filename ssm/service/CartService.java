package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.Cart;
import cn.itcast.ssm.po.CartQueryVo;

public interface CartService {
	public int addCart(Cart cart)throws Exception;
	
	public List<Cart> selectByUserId(Integer userId)throws Exception;
	
	int deleteByPrimaryKey(Integer id)throws Exception;
	
	Cart selectByPrimaryKey(Integer id);
}
