package cn.itcast.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.UserMapper;
import cn.itcast.ssm.po.ItemsQueryVo;
import cn.itcast.ssm.po.User;
import cn.itcast.ssm.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public User userLogin(String username) throws Exception {
		
		return userMapper.userLogin(username);
	}

	@Override
	public User selectByPrimaryKey(Integer id) throws Exception {
		
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public int insertSelective(User record) throws Exception {
		
		userMapper.insertSelective(record);
		return 0;
	}

}
