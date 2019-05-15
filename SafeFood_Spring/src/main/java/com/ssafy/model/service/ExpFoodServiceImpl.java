package com.ssafy.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.ExpFood;
import com.ssafy.model.dto.Food;
import com.ssafy.model.repository.AteFoodRepository;
import com.ssafy.model.repository.ExpFoodRepository;

@Repository
public class ExpFoodServiceImpl implements ExpFoodService {
	
	private static final String ns = "com.ssafy.model.dto.expfood.";
	
	@Autowired
	ExpFoodRepository repo;

	@Override
	public int insert(ExpFood expfood) {
		return repo.insert(expfood);
	}

	@Override
	public int update(ExpFood expfood) {
		return repo.update(expfood);
	}

	@Override
	public int delete(int code) {
		return repo.delete(code);
	}

	@Override
	public List<ExpFood> selectAll(String id) {
		return repo.selectAll(id);
	}
	
	@Override
	public ExpFood select(int code) {
		return repo.select(code);
	}
	
	
}
