package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.Items;
import cn.itcast.ssm.po.ItemsCustom;
import cn.itcast.ssm.po.ItemsQueryVo;

public interface ItemsMapperCustom {

	List<ItemsCustom> findItemsList(ItemsQueryVo itemsQueryVo)throws Exception;
	
	List<ItemsCustom> findItemsByType(String type)throws Exception;
	
	ItemsCustom findNameById(Integer id)throws Exception;
}