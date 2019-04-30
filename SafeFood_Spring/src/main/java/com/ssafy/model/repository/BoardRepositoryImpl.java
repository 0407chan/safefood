package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Board;

@Repository
public class BoardRepositoryImpl implements BoardRepository{
	private static final String ns = "com.ssafy.model.dto.board.";

	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<Board> selectAll() {
		return template.selectList(ns+"selectAll");
	}

	@Override
	public Board select(int idx) {
		return template.selectOne(ns+"select",idx);
	}

	@Override
	public int update(Board board) {
		return  template.update(ns+"update",board);
	}

	@Override
	public int delete(int idx) {
		return  template.delete(ns+"delete",idx);
	}

	@Override
	public int insert(Board board) {
		return  template.insert(ns+"insert",board);
	}
	
}
