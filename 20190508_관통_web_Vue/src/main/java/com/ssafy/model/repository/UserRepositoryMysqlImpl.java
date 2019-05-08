/**
 *
 */
package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.UserInfo;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
@Repository
public class UserRepositoryMysqlImpl implements UserRepository {
	private static final Logger logger = LoggerFactory.getLogger(UserRepositoryMysqlImpl.class);
	private static final String ns = "com.ssafy.model.mapper.UserInfo.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public List<UserInfo> selectAllUsers() {
		String statement = ns+"selectAllUsers";
		return template.selectList(statement);
	}

	@Override
	public UserInfo select(String id) {
		logger.trace("사용자 조사: {}", id);
		String statement = ns+"select";
		return template.selectOne(statement, id);
	}

	@Override
	public int insert(UserInfo info) {
		String statement = ns+"insert";
		return template.insert(statement, info);
	}

	@Override
	public int update(UserInfo info) {
		String statement = ns+"update";
		return template.update(statement, info);
	}

	@Override
	public int delete(String userId) {
		String statement = ns+"delete";
		return template.update(statement, userId);
	}
}
