package cn.itcast.ssm.service;

import cn.itcast.ssm.po.ItemsQueryVo;
import cn.itcast.ssm.po.User;

public interface UserService {
	
	//用户登陆
	User userLogin(String username)throws Exception;
	
	//查询用户
	User selectByPrimaryKey(Integer id)throws Exception;
	
	int insertSelective(User record)throws Exception;
}
