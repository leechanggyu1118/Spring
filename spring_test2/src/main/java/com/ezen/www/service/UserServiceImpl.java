package com.ezen.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.www.domain.UserVO;
import com.ezen.www.repository.UserDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor

public class UserServiceImpl implements UserService {

	private final UserDAO udao;

	@Transactional
	@Override
	public int register(UserVO uvo) {
		// 권한 추가
		int isOk = udao.insert(uvo);
		
		return udao.insertAuthInit(uvo.getEmail());
	}

	@Override
	public int updateLastLogin(String authEmail) {
		// TODO Auto-generated method stub
		return udao.updateLastLogin(authEmail);
	}

	@Override
	public List<UserVO> getUserList() {
		// TODO Auto-generated method stub
		List<UserVO> userList = udao.getUserList();
		for(UserVO uvo : userList) {
			uvo.setAuthList(udao.selectAuths(uvo.getEmail()));;
		}
		return userList;
	}

	@Override
	public List<UserVO> userDetail(String email) {
		// TODO Auto-generated method stub
		return udao.userDetail(email);
	}
}
