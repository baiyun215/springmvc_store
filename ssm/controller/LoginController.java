package cn.itcast.ssm.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.ssm.po.ItemsQueryVo;
import cn.itcast.ssm.po.User;
import cn.itcast.ssm.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	//跳转到登陆页面
	@RequestMapping("/pleaseLogin")
	public String pleaseLogin(HttpSession session)throws Exception{
		session.setAttribute("message", "您好!请登录");
		return "/WEB-INF/jsp/login.jsp";
	}
	
	@RequestMapping("/pleaseRegister")
	public String pleaseRegister()throws Exception{
		
		return "WEB-INF/jsp/register.jsp";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session,User user,HttpServletResponse response)throws Exception{
		
		//调用service获取密码
		User new_user = userService.userLogin(user.getUsername());
		if(new_user != null){
		String new_password = new_user.getPassword();
			if(new_password.equals(user.getPassword())){
				session.setAttribute("user", new_user);
				return "redirect:/index.jsp";
			}
			else{
				session.setAttribute("message", "密码错误,请重新尝试");
				return "/WEB-INF/jsp/login.jsp";
			}
		}
		else{
			session.setAttribute("message", "用户名不存在,请重新尝试");
			return "/WEB-INF/jsp/login.jsp";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
	
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/register")
	public String register(User user)throws Exception{
		userService.insertSelective(user);
		return "/pleaseLogin.action";
	}
}
