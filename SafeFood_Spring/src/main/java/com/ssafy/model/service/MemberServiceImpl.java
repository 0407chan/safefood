package com.ssafy.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Member;
import com.ssafy.model.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberRepository memberRepo;
	
	@Override
	public int insert(Member member) {
		return memberRepo.insert(member);
	}

	@Override
	public int update(Member member) {
		return memberRepo.update(member);
	}

	@Override
	public int delete(String id) {
		return memberRepo.delete(id);
	}

	@Override
	public Member select(String id) {
		return memberRepo.select(id);
	}

}
