package com.ssafy.model.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Member;

@Repository
public class MemberRepositoryImpl implements MemberRepository {
	private static final String ns = "com.ssafy.model.mapper.Member.";
	
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public int insert(Member member) {
		return template.insert(ns+"insert",member);
	}

	@Override
	public int update(Member member) {
		return template.update(ns+"update",member);
	}

	@Override
	public int delete(String id) {
		return template.delete(ns+"delete",id);
	}

	@Override
	public Member select(String id) {
		return template.selectOne(ns+"select",id);
	}

}
