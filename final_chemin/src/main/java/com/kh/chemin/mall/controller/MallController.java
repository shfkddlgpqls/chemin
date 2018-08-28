package com.kh.chemin.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MallController 
{
	
	//상품 상세 페이지로 이동
	@RequestMapping("/mall/detail.do")
	public String mallDetail()
	{
		return "mall/productDetail";
	}
	
}
