package com.ssafy.model.repository;

import com.ssafy.model.dto.Member;

public interface MemberRepository {
	public int insert(Member member);
	public int update(Member member);
	public int delete(String id);
	public Member select(String id);
}
