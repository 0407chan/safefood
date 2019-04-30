package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Board;

public interface BoardRepository {
	public List<Board> selectAll();
	public Board select(int idx);
	public int update(Board board);
	public int delete(int idx);
}
