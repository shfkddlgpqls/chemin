package com.kh.chemin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.chemin.admin.model.service.AdminService;
import com.kh.chemin.community.controller.CommunityController;
import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

@Controller
public class AdminController {
	private Logger logger=LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	private AdminService service;
	
	//회원관리 페이지
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	//장소요청내역 페이지
	@RequestMapping("/admin/adminPlaceList.do")
	public String adminPlaceList(Model model) {
		List<Place> plaList = service.adminPlaceList();
		model.addAttribute("plaList", plaList);
		return "admin/adminPlaceList";
	}
	
	//물품등록 페이지
	@RequestMapping("/admin/adminProductReg.do")
	public String adminProductReg() {
		return "admin/adminProductReg";
	}
	
	//물품관리 페이지
	@RequestMapping("/admin/adminProductList.do")
	public String memberList() {
		return "admin/adminProductList";
	}
	
	//장소 상세 페이지(모달)
	@RequestMapping(value="/admin/adminPlaDetailList.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String adminPlaDetailList(int plaNo, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		List<PlaceAttachment> attachList = service.selectAttachList(plaNo);
		List<PlaceMenu> menuList = service.selectMenuList(plaNo);
		
		
		map.put("attachList", attachList);
		map.put("menuList", menuList);

		jsonStr = mapper.writeValueAsString(map);
		return jsonStr;
	}
}
