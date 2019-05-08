package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.model.dto.aBoard;
import com.ssafy.model.dto.qBoard;
import com.ssafy.model.repository.qBoardRepository;

public class qBoardServiceImpl implements qBoardService {

	@Autowired
	qBoardRepository boardRepo;
	
	@Override
	public List<qBoard> selectAll() {
		return boardRepo.selectAll();
	}

	@Override
	public qBoard select(int idx) {
		return boardRepo.select(idx);
	}

	@Override
	public int update(qBoard board) {
		return boardRepo.update(board);
	}

	@Override
	public int delete(int idx) {
		return boardRepo.delete(idx);
	}

	@Override
	public int insert(qBoard board) {
		return boardRepo.insert(board);
	}

}
