package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.UserVO;

public interface UserService {

	int register(UserVO uvo);

	int updateLastLogin(String authEmail);

	List<UserVO> getUserList();

	void userModify(UserVO uvo);

	void userPwdModify(UserVO uvo);

	void userAuthDelete(String email);

	void userDelete(String email);

	int checkEmail(String email);








	

}
