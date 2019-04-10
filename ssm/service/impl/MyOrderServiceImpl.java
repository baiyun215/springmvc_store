package cn.itcast.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.MyorderMapper;
import cn.itcast.ssm.po.Myorder;
import cn.itcast.ssm.service.MyOrderService;

public class MyOrderServiceImpl implements MyOrderService {
	
	@Autowired
	private MyorderMapper myorderMapper;

	@Override
	public int insertSelective(Myorder myorder) throws Exception {
		
		myorderMapper.insertSelective(myorder);
		return 0;
	}

	@Override
	public List<Myorder> selectByUserId(Integer userId) throws Exception {
		
		return myorderMapper.selectByUserId(userId);
	}

	@Override
	public int updateByPrimaryKey(Myorder record) {
		
		myorderMapper.updateByPrimaryKey(record);
		return 0;
	}

	@Override
	public Myorder selectByPrimaryKey(Integer id) {
		
		return myorderMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {

		myorderMapper.deleteByPrimaryKey(id);
		return 0;
	}
	
	
	
}
