package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.aBoard;

public interface aBoardRepository {
	public List<aBoard> selectAll();
	public aBoard select(int idx);
	public int update(aBoard board);
	public int delete(int idx);
	public int insert(aBoard board);
}
