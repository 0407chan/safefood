/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.UserInfo;
import com.ssafy.model.repository.UserRepository;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	private UserRepository userRepo;

	public UserServiceImpl(UserRepository repo) {
		userRepo = repo;
	}

	@Override
	public UserInfo login(String id, String pass) {
		UserInfo info = userRepo.select(id);
		if (info != null && info.getPassword().equals(pass)) {
			return info;
		} else {
			return null;
		}
	}

	@Override
	public UserInfo select(String id) {
		return userRepo.select(id);
	}

	@Override
	public List<UserInfo> selectAll() {
		return userRepo.selectAllUsers();
	}

	@Override
	public int joinDayTime(UserInfo info) {
		int result = userRepo.insert(info);
		UserInfo selected = userRepo.select(info.getUserId());
		logger.trace("조회 결과: {}", selected);
		return result;
	}

	@Override
	@Transactional
	public int updateDayTime(UserInfo info) {
		return userRepo.update(info);
	}

	@Override
	@Transactional
	public int leaveDayTime(String id) {
		return userRepo.delete(id);
	}

	@Override
	public UserRepository getUserRepo() {
		return userRepo;
	}
}
