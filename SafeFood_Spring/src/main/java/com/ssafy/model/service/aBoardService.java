package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.aBoard;

public interface aBoardService {
	public List<aBoard> selectAll();
	public aBoard select(int idx);
	public int update(aBoard aboard);
	public int delete(int idx);
	public int insert(aBoard aboard);
}
