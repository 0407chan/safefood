package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Food;

public interface FoodRepository {
	public void loadData();
	
	public int insert(Food food);
	public int update(Food food);
	public int updateAteCount(Food food);
	public int delete(int code);
	public Food select(int code);
	public List<Food> bestFoodAll();
	public List<Food> bestAteFoodAll();
	public List<Food> selectAll();
	public List<Food> searchAll(String input);
	public List<Food> searchByName(String name);
	public List<Food> searchByMaker(String maker);
	public List<Food> searchByMaterial(String material);
	
	//보류
	/*
	public List<Food> searchBest();
	public List<Food> searchBestIndex();
	*/
}
