package cn.itcast.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.ItemsCustom;
import cn.itcast.ssm.po.Myorder;
import cn.itcast.ssm.po.OrderQueryVo;
import cn.itcast.ssm.po.User;
import cn.itcast.ssm.service.ItemsService;
import cn.itcast.ssm.service.MyOrderService;


@Controller
public class MyOrderController {

	@Autowired
	private ItemsService itemsService;
	
	@Autowired
	private MyOrderService orderService;
	
	@RequestMapping("/queryOrder")
	public ModelAndView queryOrder(Integer userId)throws Exception{
		List<Myorder> orderList = orderService.selectByUserId(userId);
		List<OrderQueryVo> oqv = new ArrayList<OrderQueryVo>();
		for(Myorder order : orderList){
			ItemsCustom itemsCustom = itemsService.findItemsById(order.getItemId());
			OrderQueryVo orderQueryVo = new OrderQueryVo();
			orderQueryVo.setItems(itemsCustom);
			orderQueryVo.setMyorder(order);
			oqv.add(orderQueryVo);
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("oqv", oqv);
		modelAndView.setViewName("/WEB-INF/jsp/items/myOrder.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/finishOrder")
	public String finishOrder(Integer id)throws Exception{
		Myorder order = orderService.selectByPrimaryKey(id);
		order.setStatus("已完成");
		orderService.updateByPrimaryKey(order);
		
		return "/WEB-INF/jsp/items/myOrder.jsp";
		
		}
	
	@RequestMapping("delOrder")
	public ModelAndView delOrder(Integer id,HttpSession session)throws Exception{
		
		orderService.deleteByPrimaryKey(id);
		User user = (User) session.getAttribute("user");
		return queryOrder(user.getId());
		
	}
}
