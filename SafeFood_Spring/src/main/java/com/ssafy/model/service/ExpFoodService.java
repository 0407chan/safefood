package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.ExpFood;

public interface ExpFoodService {
	public int insert(ExpFood atefood);
	public int update(ExpFood atefood);
	public int delete(int atekey);
	public ExpFood select(int atekey);
	public List<ExpFood> selectAll(String id);
}
