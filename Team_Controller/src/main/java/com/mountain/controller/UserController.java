package com.mountain.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mountain.entity.User;
import com.mountain.service.MountainService;

@Controller
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	MountainService mountainService;
	

	@ModelAttribute("user") // 로그인 때 입력한 정보를 User 객체에 담는다.
	public User setUser() {

	    return new User();

	}

	@PostMapping("userLogin") // 로그인
	public String login(@ModelAttribute("user") User user, Model model, HttpSession session) {
		
		User user01 = mountainService.selectByUserId(user.getUserId(), user.getPassword()); // 입력한 아이디로 DB(회원가입 여부 확인)에 저장되어있는 아이디와 비교하여 객체 가져오기 		
		
		
		if(user01 == null) {
			
			String result = "아이디 or 비밀번호가 틀립니다.";
			model.addAttribute("result", result);
			
			return "mountain/login";
			
		} else {
			session.setAttribute("userId", user01.getId()); // user의 id를 session 객체에 담는다.
			session.setAttribute("userName", user01.getUserId()); // user의 userId를 session 객체에 담는다.
			session.setMaxInactiveInterval(30*60); // session 30분동안 유지
			return "mountain/main";
		}
		
	}
	
	@GetMapping("logout") // 로그아웃 요청을 받으면
	public String logout(HttpSession session) {
		
		session.invalidate(); // 세션을 종료해 로그아웃!
		
		return "mountain/main";
		
	}
	
	@GetMapping("findId") // 아이디 찾기
	public String findId(String name, String email, Model model) {
		
		User user = mountainService.findId(name, email);
			
		if(user != null) {
			
			String result = "아이디는 " + user.getUserId() + "입니다.";
			
			model.addAttribute("result", result);
			
			return "mountain/main";
			
		} else {
			
			String result = "해당되는 아이디가 존재하지 않습니다.";
			
			model.addAttribute("result", result);
			
			return "mountain/main";
		}
		
		
	}
	
	@GetMapping("findPassword") // 비밀번호 찾기
	public String findPassword(String name, String userId, String email, Model model) {
		
		User user = mountainService.findPassword(name, userId, email);
		
		if(user != null) {
			
			String result = "비밀번호는 " + user.getPassword() + "입니다.";
			
			model.addAttribute("result", result);
			
			return "mountain/main";
			
		} else {
			
			String result = "해당되는 비밀번호가 존재하지 않습니다.";
			
			model.addAttribute("result", result);
			
			return "mountain/main";
		}
	}
}
