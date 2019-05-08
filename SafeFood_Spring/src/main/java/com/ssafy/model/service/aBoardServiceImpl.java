package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.model.dto.aBoard;
import com.ssafy.model.repository.aBoardRepository;

public class aBoardServiceImpl implements aBoardService {

	@Autowired
	aBoardRepository boardRepo;
	
	@Override
	public List<aBoard> selectAll() {
		return boardRepo.selectAll();
	}

	@Override
	public aBoard select(int idx) {
		return boardRepo.select(idx);
	}

	@Override
	public int update(aBoard aboard) {
		return boardRepo.update(aboard);
	}

	@Override
	public int delete(int idx) {
		return boardRepo.delete(idx);
	}

	@Override
	public int insert(aBoard aboard) {
		return boardRepo.insert(aboard);
	}

}
