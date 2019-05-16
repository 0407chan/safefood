package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.ExpFood;
import com.ssafy.model.dto.Food;

@Repository
public class ExpFoodRepositoryImpl implements ExpFoodRepository {
	
	private static final String ns = "com.ssafy.model.dto.expfood.";
	
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(ExpFood expfood) {
		return template.insert(ns+"insert",expfood);
	}

	@Override
	public int update(ExpFood expfood) {
		return template.update(ns+"update",expfood);
	}

	@Override
	public int delete(int code) {
		return template.delete(ns+"delete",code);
	}

	@Override
	public List<ExpFood> selectAll(String id) {
		return template.selectList(ns+"selectAll",id);
	}
	
	@Override
	public ExpFood select(int code) {
		return template.selectOne(ns+"select",code);
	}
	
	
}
