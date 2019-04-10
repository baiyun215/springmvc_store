package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.ItemsCustom;
import cn.itcast.ssm.po.Myorder;

public interface MyOrderService {
	int insertSelective(Myorder myorder)throws Exception;
	
	public List<Myorder> selectByUserId(Integer userId)throws Exception;
	
	int updateByPrimaryKey(Myorder record);
	
	Myorder selectByPrimaryKey(Integer id);
	
	int deleteByPrimaryKey(Integer id);
}
