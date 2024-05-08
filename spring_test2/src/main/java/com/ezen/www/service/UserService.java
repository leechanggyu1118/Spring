package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.UserVO;

public interface UserService {

	int register(UserVO uvo);

	int updateLastLogin(String authEmail);

	List<UserVO> getUserList();

	List<UserVO> userDetail(String email);

}
