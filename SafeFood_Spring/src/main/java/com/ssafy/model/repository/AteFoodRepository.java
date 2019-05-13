package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.dto.Food;

public interface AteFoodRepository {
	public int insert(AteFood atefood);
	public int update(AteFood atefood);
	public int delete(String id);
	public List<AteFood> selectAll(String id);
	public List<AteFood> searchByToday(String today);
	public List<AteFood> searchByDay(String day);
	public List<AteFood> searchByMonth(String month);
	public List<AteFood> searchByYear(String year);
	public Food getTodayAteFood(String id);
}
