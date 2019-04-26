package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Food;

public interface FoodService {
	public void loadData();
	
	public int insert(Food food);
	public int update(Food food);
	public int delete(int code);
	public Food select(int code);
	public List<Food> selectAll();
	public List<Food> searchByName(String name);
	public List<Food> searchByMaker(String maker);
	public List<Food> searchByMaterial(String material);
}
