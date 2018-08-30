package com.kh.chemin.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.mall.model.service.MallService;

@Controller
public class MallController 
{
	@Autowired
	MallService service;
	
	// 메인 쇼핑몰로 이동
	@RequestMapping("/mall/mainMall.do")
	public ModelAndView mainMall(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView();
		
		String tab=req.getParameter("tabs");
		System.out.println(tab);
		
		Map<String,String> map = new HashMap<String, String>();
		
		
		List<Map<String,String>> list = service.selectMallList();
		
		mv.addObject("list", list);
		mv.setViewName("mall/mainMall");
		
		return mv;
	}	
	
	// 상품 상세화면 이동
	@RequestMapping("/mall/detail.do")
	public String mallDetail()
	{
	   return "mall/productDetail";
	}
	
	// 장바구니 이동
	@RequestMapping("/mall/cartList.do")
	public String cartList() {
		return "mall/cartList";
	}
	
	// 주문서 폼 이동
	@RequestMapping("mall/orderForm.do")
	public String orderForm() {
		return "mall/orderForm";
	}
	
}
