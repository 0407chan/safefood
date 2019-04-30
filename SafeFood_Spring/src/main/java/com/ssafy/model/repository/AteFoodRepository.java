package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Food;

public interface AteFoodRepository {
	public int insert(int code, String id, int num);
	public int update(int code, String id, int num);
	public int delete(String id);
	public List<Food> selectAll(String id) ;
}
