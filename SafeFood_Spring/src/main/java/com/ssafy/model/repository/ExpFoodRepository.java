package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.ExpFood;

public interface ExpFoodRepository {
	public int insert(ExpFood atefood);
	public int update(ExpFood atefood);
	public int delete(int code);
	public ExpFood select(int code);
	public List<ExpFood> selectAll(String id);
}
