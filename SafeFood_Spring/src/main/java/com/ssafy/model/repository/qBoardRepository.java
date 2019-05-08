package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.qBoard;

public interface qBoardRepository {
	public List<qBoard> selectAll();
	public qBoard select(int idx);
	public int update(qBoard board);
	public int delete(int idx);
	public int insert(qBoard board);
}
