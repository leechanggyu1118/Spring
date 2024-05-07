package com.ezen.www.service;

import org.springframework.stereotype.Service;

import com.ezen.www.domain.UserVO;
import com.ezen.www.repository.UserDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor

public class UserServiceImpl implements UserService {

	private final UserDAO udao;

	@Override
	public int register(UserVO uvo) {
		// TODO Auto-generated method stub
		return udao.insert(uvo);
	}
}
