package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Board;

public interface BoardService {
	public List<Board> selectAll();
	public Board select(int idx);
	public int update(Board board);
	public int delete(int idx);
	public int insert(Board board);
}
