package cn.itcast.ssm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.mapper.UserMapper;
import cn.itcast.ssm.po.Items;
import cn.itcast.ssm.po.ItemsCustom;
import cn.itcast.ssm.po.ItemsQueryVo;
import cn.itcast.ssm.po.User;
import cn.itcast.ssm.service.ItemsService;
import cn.itcast.ssm.service.UserService;
import cn.itcast.ssm.service.impl.ItemsServiceImpl;


@Controller
//为了对url进行分类管理，可以在这里定义根路径，最终访问url是根路径+子路径
public class ItemsController {

	@Autowired
	private ItemsService itemsService;
	
	@Autowired
	private UserService userService;
	
	//跳转到添加商品页面
	@RequestMapping("/toAddItems")
	public String toAddItems()throws Exception{
		return "/WEB-INF/jsp/items/addItems.jsp";
	}
	
	//添加商品
	@RequestMapping("/addItems")
	public String addItems(Items items,MultipartFile items_pic)throws Exception{
		String originalFilename = items_pic.getOriginalFilename();
		//上传图片
		if(items_pic!=null && originalFilename!=null && originalFilename.length()>0){
			
			//存储图片的物理路径
			String pic_path = "D:\\ssm\\pic\\";
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			File newFile = new File(pic_path+newFileName);
			items_pic.transferTo(newFile);
			
			items.setPic(newFileName);
		}
		itemsService.addItems(items);
		
		return "redirect:/adminItemsList.action";
	}
	
	
	//商品查询
	@RequestMapping("/queryItems")
	public ModelAndView queryItems(ItemsQueryVo itemsQueryVo) throws Exception{
		List<ItemsCustom> itemsList = itemsService.findItemsList(itemsQueryVo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemsList", itemsList);
		modelAndView.setViewName("/WEB-INF/jsp/items/indexlist.jsp");
		
		return modelAndView;
	
	}
	
	@RequestMapping("/adminItemsList")
	public ModelAndView adminItemsList(ItemsQueryVo itemsQueryVo) throws Exception{
		List<ItemsCustom> itemsList = itemsService.findItemsList(itemsQueryVo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemsList", itemsList);
		modelAndView.setViewName("/admin.jsp");
		
		return modelAndView;
	
	}
	
	//商品查询Json
	@RequestMapping("/requestJson")
	public @ResponseBody List<ItemsCustom> requestJson(ItemsQueryVo itemsQueryVo) throws Exception{
		List<ItemsCustom> itemsList = itemsService.findItemsList(itemsQueryVo);
		return itemsList;
	}
	
	//商品信息修改页面显示
	@RequestMapping("/editItems")
	public ModelAndView editItems(Integer id) throws Exception{
		
		//调用service根据商品id查询商品信息
		ItemsCustom itemsCustom = itemsService.findItemsById(id);
		
		ModelAndView modelAndView = new ModelAndView();
		
		//将商品信息放到model
		modelAndView.addObject("itemsCustom", itemsCustom);
		
		modelAndView.setViewName("/WEB-INF/jsp/items/editItems.jsp");
		
		return modelAndView;
		
	}
	
	//商品信息修改提交
	@RequestMapping("/editItemsSubmit")
	public String editItemsSubmit(Integer id,ItemsCustom itemsCustom,MultipartFile items_pic) throws Exception{

		String originalFilename = items_pic.getOriginalFilename();
		//上传图片
		if(items_pic!=null && originalFilename!=null && originalFilename.length()>0){
			
			//存储图片的物理路径
			String pic_path = "D:\\ssm\\pic\\";
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			File newFile = new File(pic_path+newFileName);
			items_pic.transferTo(newFile);
			
			itemsCustom.setPic(newFileName);
		}
		
		//调用service更新商品信息，页面需要将商品信息传到此方法
				
		itemsService.updateItems(id, itemsCustom);
				
		return "redirect:/adminItemsList.action";
		
	}
	
	//删除商品
	@RequestMapping("/deleteItems")
	public String deleteItems(Integer id) throws Exception{
		itemsService.deleteItems(id);
		
		return "forward:/adminItemsList.action";
	}
	
	//查询商品以type
	@RequestMapping("typeList")
	public ModelAndView typeList(String type,Integer userId)throws Exception{
		List<ItemsCustom> itemsList = itemsService.findItemsByType(type);
		User user = userService.selectByPrimaryKey(userId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemsList", itemsList);
		modelAndView.addObject("user", user);
		modelAndView.setViewName("forward:/WEB-INF/jsp/items/typeList.jsp");
		
		return modelAndView;
	}
}
