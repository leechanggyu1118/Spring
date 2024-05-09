package com.ezen.www.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.domain.AuthVO;
import com.ezen.www.domain.UserVO;
import com.ezen.www.service.UserService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user/**")
@Slf4j
@RequiredArgsConstructor
public class UserController {
	
	private final UserService usv;
	private final BCryptPasswordEncoder bcEncoder;
	
	//controller mapping과 jsp 경로가 같으면 void가능
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(UserVO uvo, Model m) {
		
		List<UserVO> userList = usv.getUserList();
		for(UserVO a : userList) {
			if(a.getEmail().equals(uvo.getEmail())) {
				m.addAttribute("isEmail",-1);
				return "register";
			}
		}
		
		log.info(">>>> uvo >> {}", uvo);
		uvo.setPwd(bcEncoder.encode(uvo.getPwd()));
		int isOk = usv.register(uvo);
		return "index";
		
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String loginPost(HttpServletRequest request, RedirectAttributes re) {
		// 로그인 실패 시 다시 로그인 페이지로 돌아와서 오류 메시지 전송
		// 다시 로그인 유도
		log.info(">>> errMsg >> {}",request.getAttribute("errMsg"));
		re.addAttribute("email", request.getAttribute("email"));
		re.addAttribute("errMsg", request.getAttribute("errMsg"));
		
		return "redirect:/user/login";
		
	}
	
	@GetMapping("/list")
	public String list(Model m) {
		
		List<UserVO> userList = usv.getUserList();
		
		m.addAttribute("userList", userList);
		
		return "/user/list";
	
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = 
				SecurityContextHolder
				.getContext()
				.getAuthentication();
		
		new SecurityContextLogoutHandler()
			.logout(request, response, authentication);
	}
	
	@GetMapping("/modify")
	public void modify() {}
	
	@PostMapping("/modify")
	public String userDetail(UserVO uvo,Principal principal ,HttpServletRequest request, HttpServletResponse response) {
		String email = principal.getName();
		uvo.setEmail(email);
	
		
		if(uvo.getPwd().isEmpty() && uvo.getPwd().length() == 0) {
			
			usv.userModify(uvo);
			
		}else {
			
			String pwdModify = bcEncoder.encode(uvo.getPwd()); //비번을 다시 인코딩(암호화)하여 업데이트
			uvo.setPwd(pwdModify);
			usv.userPwdModify(uvo);
	
		}

		logout(request, response);
		return "redirect:/";
		
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(Principal principal,HttpServletRequest request, HttpServletResponse response) {
		String email = principal.getName(); //id
		
		usv.userAuthDelete(email);
		usv.userDelete(email);
		logout(request, response);
		return "redirect:/";
	}
	
	
	
	
	
}
