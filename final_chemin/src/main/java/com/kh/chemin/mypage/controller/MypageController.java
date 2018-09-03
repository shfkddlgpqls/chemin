package com.kh.chemin.mypage.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.map.controller.MapController;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;
import com.kh.chemin.mypage.model.service.MypageService;

@Controller
public class MypageController 
{		
	private Logger logger=LoggerFactory.getLogger(MapController.class);

	@Autowired
	private MypageService service;
	
	//주문 목록 페이지로 이동
	@RequestMapping("/mypage/myOrderList.do")
	public String myOrderList()
	{
		return "mypage/myOrderList";
	}
	
	//게시글 관리 페이지로 이동
	@RequestMapping("/mypage/myBoardList.do")
	public String mallDetail()
	{
		return "mypage/myBoardList";
	}
	
	//장바구니로 이동
	@RequestMapping("/mypage/myShoppingCart.do")
	public String shoppingCart()
	{
		return "mypage/myShoppingCart";
	}
	
	
	//찜 목록으로 이동
	@RequestMapping("/mypage/myWishList.do")
	public String wishList()
	{
		return "mypage/myWishList";
	}
	
	//장소 등록 페이지로 이동
	@RequestMapping("/mypage/myPlaceList.do")
	public String placeList(Model model, String userId)
	{
		List<Place> list = service.selectPlaceList(userId);
		model.addAttribute("list", list);
		return "mypage/myPlaceList";
	}
	
	/*@RequestMapping("/mypage/myPlaDetailList.do")
	public String plaDetailList(Model model, int plaNo) 
	{
		System.out.println(plaNo);
		model.addAttribute("attachList", service.selectAttachList(plaNo));
		model.addAttribute("menuList", service.selectMenuList(plaNo));
		return "mypage/myPlaceList";
	}*/
	
	@RequestMapping(value="/mypage/myPlaDetailList.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String plaDetailList(int plaNo, Model model) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		List<PlaceAttachment> attachList = service.selectAttachList(plaNo);
		List<PlaceMenu> menuList = service.selectMenuList(plaNo);
		
		System.out.println(attachList);
		
		map.put("attachList", attachList);
		map.put("menuList", menuList);
		
		jsonStr = mapper.writeValueAsString(map);
		return jsonStr;
	}
	
}