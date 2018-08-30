package com.kh.chemin.community.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.community.model.service.CommunityService;
import com.kh.chemin.community.model.vo.Community;


@Controller
public class CommunityController {
	
	private Logger logger=LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityService service;
	
	
	@RequestMapping("/community/communityList.do")
	public ModelAndView communityList(ModelAndView mv)
	{
		List<Map<String,String>> list=service.communityList();
		mv.addObject("list",list);
		System.out.println(list);
		mv.setViewName("community/communityList");
		return mv;
	}
	
	@RequestMapping("/community/communityWrite.do")
	public String communityWrite()
	{
		return "community/communityWrite";
	}
	
	@RequestMapping(value="/community/communityWriteEnd.do",method=RequestMethod.POST)
	public ModelAndView communityWriteEnd(HttpServletRequest req,Community community)
	{
		ModelAndView mv=new ModelAndView();
		int result=service.communityWriteEnd(community);
		/*SimpleDateFormat fomatDate=new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
		String date=fomatDate.format(community.getCommunity_date());*/
		
		System.out.println(community);
		String msg="";
		String loc="";
		if(result>0) {
			msg="성공적으로 등록!!";
			loc="/community/communityList.do";
		}
		else 
		{
			msg="등록 실패";
			loc="/community/communityWrite.do";
			
		}

		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
}
