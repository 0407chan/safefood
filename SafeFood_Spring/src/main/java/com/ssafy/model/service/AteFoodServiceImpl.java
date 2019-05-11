package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.AteFood;
import com.ssafy.model.repository.AteFoodRepository;

@Service
public class AteFoodServiceImpl implements AteFoodService {

	@Autowired
	AteFoodRepository repo;
	
	@Override
	public int insert(AteFood atefood) {
		return repo.insert(atefood);
	}

	@Override
	public int update(AteFood atefood) {
		return repo.update(atefood);
	}

	@Override
	public int delete(String id) {
		return repo.delete(id);
	}

	@Override
	public List<AteFood> selectAll(String id) {
		return repo.selectAll(id);
	}

	@Override
	public List<AteFood> searchByToday(String today) {
		return repo.searchByToday(today);
	}

	@Override
	public List<AteFood> searchByDay(String day) {
		return repo.searchByDay(day);
	}

	@Override
	public List<AteFood> searchByMonth(String month) {
		return repo.searchByMonth(month);
	}

	@Override
	public List<AteFood> searchByYear(String year) {
		return repo.searchByYear(year);
	}

}