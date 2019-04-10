package cn.itcast.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.Cart;
import cn.itcast.ssm.po.CartQueryVo;
import cn.itcast.ssm.po.ItemsCustom;
import cn.itcast.ssm.po.Myorder;
import cn.itcast.ssm.service.CartService;
import cn.itcast.ssm.service.ItemsService;
import cn.itcast.ssm.service.MyOrderService;

@Controller

public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ItemsService itemsService;
	
	@Autowired
	private MyOrderService orderService;
	
	@RequestMapping("/addCart")
	public String addCart(Cart cart)throws Exception{
		cartService.addCart(cart);
		return "forward:/index.jsp";
	}
	
	//查询购物车
	@RequestMapping("/queryCart")
	public ModelAndView findCartList(Integer userId)throws Exception{
		List<Cart> cartList = cartService.selectByUserId(userId);
		List<CartQueryVo> cqv = new ArrayList<CartQueryVo>();
		for(Cart cart : cartList){
			ItemsCustom itemsCustom = itemsService.findNameById(cart.getItemId());
			CartQueryVo cartQueryVo = new CartQueryVo();
			cartQueryVo.setCart(cart);
			cartQueryVo.setItems(itemsCustom);
			cqv.add(cartQueryVo);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("cartList", cartList);
		modelAndView.addObject("cqv", cqv);
		modelAndView.setViewName("/WEB-INF/jsp/items/cart.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/payCart")
	public String payCart(Integer id)throws Exception{
		Cart cart = cartService.selectByPrimaryKey(id);
		Myorder order = new Myorder();
		order.setItemId(cart.getItemId());
		order.setUserId(cart.getUserId());
		order.setNum(cart.getNum());
		order.setStatus("未完成");
		orderService.insertSelective(order);
		cartService.deleteByPrimaryKey(cart.getId());
		return "/index.jsp";
	}
	
	@RequestMapping("/delCart")
	public String delCart(Integer id)throws Exception{
		cartService.deleteByPrimaryKey(id);
		return "";
	}
}
