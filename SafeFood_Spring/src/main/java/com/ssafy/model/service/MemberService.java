package com.ssafy.model.service;

import com.ssafy.model.dto.Member;
import com.ssafy.model.repository.memberExecption;

public interface MemberService {
	public int insert(Member member) throws memberExecption ;
	public int update(Member member);
	public int delete(String id);
	public Member select(String id);
}
