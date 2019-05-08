/**
 *
 */
package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.UserInfo;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
public interface UserRepository {
	List<UserInfo>	selectAllUsers();
	UserInfo select(String id);
	int insert(UserInfo info);
	int update(UserInfo info);
	int delete(String userId);
}
