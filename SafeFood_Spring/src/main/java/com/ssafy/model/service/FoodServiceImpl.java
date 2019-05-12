package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Food;
import com.ssafy.model.repository.FoodRepository;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodRepository repo;
	
	@Override
	public int insert(Food p) {
		return repo.insert(p);
	}

	@Override
	public int update(Food p) {
		return repo.update(p);
	}

	@Override
	public int delete(int num) {
		return repo.delete(num);
	}

	@Override
	public Food select(int num) {
		return repo.select(num);
	}

	@Override
	public List<Food> selectAll() {
		return repo.selectAll();
	}

	@Override
	public List<Food> searchByName(String name) {
		return repo.searchByName(name);
	}

	@Override
	public List<Food> searchByMaker(String maker) {
		return repo.searchByMaker(maker);
	}

	@Override
	public List<Food> searchByMaterial(String material) {
		return repo.searchByMaterial(material);
	}

	@Override
	public void loadData() {
		repo.loadData();
	}

	@Override
	public List<Food> searchAll(String input) {
		return repo.searchAll(input);
	}
}
