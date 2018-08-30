package com.kh.chemin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.member.model.service.MemberService;
import com.kh.chemin.member.model.vo.Member;

@SessionAttributes(value= {"memberLoggedIn"})//새로작성
@Controller
public class MemberController {

	@Autowired
	MemberService service;

	// BCryptPasswordEncoder bCryptPasswordEncoder;
	@RequestMapping("/login/login.do")
	
	public String login() {
		
		return "login/login";
		
	}
	@RequestMapping("/login/loginCheck.do")
	public ModelAndView loginCheck(String userId, String password, Model model) {
	
		Member m =service.selectOne(userId);
		System.out.println(m);
		ModelAndView mv=new ModelAndView();
		System.out.println("db data: "+m.getPassword());
		String msg="";
		String loc="";
		
		if(m==null) {
			msg="존재하지 않는 아이디 입니다";
		}else {
			if(password.equals(m.getPassword())) {
				msg="로그인성공";
				mv.addObject("memberLoggedIn", m);
				
			}else {
				msg="비밀번호가 일치하지 않습니다";
			}
			
		}
		loc="/";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	
	}
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	@RequestMapping("/login/memberlogout.do")
	public String memberLogout(SessionStatus ss) {
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
	}
	
}
