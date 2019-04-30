package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Board;
import com.ssafy.model.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardRepository boardRepo;
 	
	@Override
	public List<Board> selectAll() {
		return boardRepo.selectAll();
	}

	@Override
	public Board select(int idx) {
		return boardRepo.select(idx);
	}

	@Override
	public int update(Board board) {
		return boardRepo.update(board);
	}

	@Override
	public int delete(int idx) {
		return boardRepo.delete(idx);
	}

}
