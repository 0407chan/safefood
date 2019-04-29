package com.ssafy.model.repository;

import com.ssafy.model.dto.Member;

public interface MemberRepository {
	public int insert(Member member) throws memberExecption;
	public int update(Member member);
	public int delete(String id);
	public Member select(String id);
}
