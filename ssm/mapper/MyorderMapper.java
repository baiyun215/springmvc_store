package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.ItemsCustom;
import cn.itcast.ssm.po.Myorder;

public interface MyorderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Myorder record);

    int insertSelective(Myorder record);

    Myorder selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Myorder record);

    int updateByPrimaryKey(Myorder record);
    
    List<Myorder> selectByUserId(Integer userId);
    
}