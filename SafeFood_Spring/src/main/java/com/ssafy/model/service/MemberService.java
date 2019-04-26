package com.ssafy.model.service;

import com.ssafy.model.dto.Member;

public interface MemberService {
	public int insert(Member member);
	public int update(Member member);
	public int delete(String id);
	public Member select(String id);
}
