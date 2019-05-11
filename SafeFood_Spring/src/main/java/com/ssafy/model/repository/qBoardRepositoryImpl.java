package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.qBoard;

@Repository
public class qBoardRepositoryImpl implements qBoardRepository {

	private static final String ns = "com.ssafy.model.dto.qboard.";

	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<qBoard> selectAll() {
		return template.selectList(ns+"selectAll");
	}

	@Override
	public qBoard select(int idx) {
		return template.selectOne(ns+"select",idx);
	}

	@Override
	public int update(qBoard qBoard) {
		return  template.update(ns+"update",qBoard);
	}

	@Override
	public int delete(int idx) {
		return  template.delete(ns+"delete",idx);
	}

	@Override
	public int insert(qBoard qBoard) {
		return  template.insert(ns+"insert",qBoard);
	}
	
	
}
