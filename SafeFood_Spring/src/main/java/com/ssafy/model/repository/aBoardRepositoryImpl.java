package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.aBoard;

@Repository
public class aBoardRepositoryImpl implements aBoardRepository {

	private static final String ns = "com.ssafy.model.dto.aboard.";

	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<aBoard> selectAll() {
		return template.selectList(ns+"selectAll");
	}

	@Override
	public aBoard select(int idx) {
		return template.selectOne(ns+"select",idx);
	}

	@Override
	public int update(aBoard aboard) {
		return  template.update(ns+"update",aboard);
	}

	@Override
	public int delete(int idx) {
		return  template.delete(ns+"delete",idx);
	}

	@Override
	public int insert(aBoard aboard) {
		return  template.insert(ns+"insert",aboard);
	}
	
	
}
