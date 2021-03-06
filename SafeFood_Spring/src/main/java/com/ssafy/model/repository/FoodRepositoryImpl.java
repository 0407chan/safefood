package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Food;
import com.ssafy.util.FoodSaxParser;

@Repository
public class FoodRepositoryImpl implements FoodRepository{
	
	private static final String ns = "com.ssafy.model.dto.food.";
	
	/**
	 * 식품 영양학 정보와 식품 정보를  xml 파일에서 읽어온다.
	 */
	
	public void loadData() {
		FoodSaxParser fsp=new FoodSaxParser();
		saveToDB(fsp.getFoods());
	}
	
	private void saveToDB(List<Food> foods){
		for(int i=0; i<foods.size(); i++) {
			if(select(foods.get(i).getCode()) == null)
				insert(foods.get(i));
		}
	}
	
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public int insert(Food food) {
		return template.insert(ns+"insert", food);
	}

	@Override
	public int update(Food food) {
		return template.update(ns+"update", food);
	}

	@Override
	public int delete(int code) {
		return template.delete(ns+"delete", code);
	}

	@Override
	public Food select(int code) {
		return template.selectOne(ns+"select", code);
	}

	@Override
	public List<Food> selectAll() {
		return template.selectList(ns+"selectAll");
	}

	@Override
	public List<Food> searchByName(String name) {
		return template.selectList(ns+"searchByName",name);
	}

	@Override
	public List<Food> searchByMaker(String maker) {
		return template.selectList(ns+"searchByMaker",maker);
	}

	@Override
	public List<Food> searchByMaterial(String material) {
		return template.selectList(ns+"searchByMaterial",material);
	}

	public List<Food> searchBest() {
		return null;
	}
	
	public List<Food> searchBestIndex() {
		return null;
	}

	@Override
	public List<Food> searchAll(String input) {
		return template.selectList(ns+"searchAll",input);
	}

	@Override
	public List<Food> bestFoodAll() {
		return template.selectList(ns+"bestFoodAll");
	}

	@Override
	public int updateAteCount(Food food) {
		return template.update(ns+"updateAteCount", food);
	}

	@Override
	public List<Food> bestAteFoodAll() {
		return template.selectList(ns+"bestAteFoodAll");
	}
}
