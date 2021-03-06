package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.Food;

@Repository
public class AteFoodRepositoryImpl implements AteFoodRepository {
	
	private static final String ns = "com.ssafy.model.dto.atefood.";
	
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(AteFood atefood) {
		return template.insert(ns+"insert",atefood);
	}

	@Override
	public int update(AteFood atefood) {
		return template.update(ns+"update",atefood);
	}

	@Override
	public int delete(int atekey) {
		return template.delete(ns+"delete",atekey);
	}

	@Override
	public List<AteFood> selectAll(String id) {
		return template.selectList(ns+"selectAll",id);
	}

	@Override
	public List<AteFood> searchByToday(String today) {
		return template.selectList(ns+"searchByToday",today);
	}
	
	@Override
	public List<AteFood> searchByIdGetToday(String id) {
		return template.selectList(ns+"searchByIdGetToday",id);
	}

	@Override
	public List<AteFood> searchByDay(String day) {
		return template.selectList(ns+"searchByDay",day);
	}

	@Override
	public List<AteFood> searchByMonth(String month) {
		return template.selectList(ns+"searchByMonth",month);
	}

	@Override
	public List<AteFood> searchByYear(String year) {
		return template.selectList(ns+"searchByYear",year);
	}

	@Override
	public Food getTodayAteFood(String id) {
		return template.selectOne(ns+"getTodayAteFood",id);
	}

	@Override
	public Food getAteFoodNutrbyDate(AteFood af) {
		return template.selectOne(ns+"getAteFoodNutrbyDate",af);
	}
	
	@Override
	public AteFood select(int atekey) {
		return template.selectOne(ns+"select",atekey);
	}
	
	
}
