package cn.itcast.ssm.service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.ItemsMapper;
import cn.itcast.ssm.mapper.ItemsMapperCustom;
import cn.itcast.ssm.po.Items;
import cn.itcast.ssm.po.ItemsCustom;
import cn.itcast.ssm.po.ItemsQueryVo;
import cn.itcast.ssm.service.ItemsService;

public class ItemsServiceImpl implements ItemsService{

	@Autowired
	private ItemsMapperCustom itemsMapperCustom;
	
	@Autowired
	private ItemsMapper itemsMapper;
	
	@Override
	public List<ItemsCustom> findItemsList(ItemsQueryVo itemsQueryVo)
			throws Exception {

		//通过ItemsMapperCustom查询数据库
		return itemsMapperCustom.findItemsList(itemsQueryVo);
	}

	@Override
	public ItemsCustom findItemsById(Integer id) throws Exception {

		Items items = itemsMapper.selectByPrimaryKey(id);
		//中间对商品信息进行业务处理
		//.....
		//返回ItemsCustom
		ItemsCustom itemsCustom = new ItemsCustom();
		//将items的属性值拷贝到itemsCustom
		BeanUtils.copyProperties(items, itemsCustom);
		
		return itemsCustom;
	}

	@Override
	public void updateItems(Integer id, ItemsCustom itemsCustom) throws Exception {
		//添加业务校验，通常在service接口对关键参数进行校验
		//校验id是否为空，如果为空抛出异常
		
		//更新商品信息
		itemsCustom.setId(id);
		itemsMapper.updateByPrimaryKey(itemsCustom);
	}

	@Override
	public void deleteItems(Integer id) throws Exception {
		//删除商品
		itemsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int addItems(Items items) throws Exception {
		//添加商品
		itemsMapper.insertSelective(items);
		return 0;
	}

	@Override
	public List<ItemsCustom> findItemsByType(String type) throws Exception {
		//根据type查询商品
		return itemsMapperCustom.findItemsByType(type);
	}

	@Override
	public ItemsCustom findNameById(Integer id) throws Exception {
		return itemsMapperCustom.findNameById(id);
	}
	
}
