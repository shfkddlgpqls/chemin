package com.kh.chemin.mall.controller;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.mall.model.service.MallService;
import com.kh.chemin.mall.model.vo.Product;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MallController 
{
	@Autowired
	MallService service;
	
	private Logger logger = LoggerFactory.getLogger(MallController.class);
	
	// 메인 쇼핑몰로 이동 (전체 상품 가져오기)
	@RequestMapping("/mall/mainMall.do")
	public ModelAndView mainMall(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage)
	{
		ModelAndView mv = new ModelAndView();
		
		int numPerPage = 8;
		
		List<Map<String,String>> list = service.selectMallList(cPage, numPerPage);
		
		int totalCount = service.selectProductCount();
		
		mv.addObject("list", list);
		mv.addObject("pageBar",MallPageBar.getPage(cPage, numPerPage, totalCount, "mainMall.do"));
		mv.setViewName("mall/mainMall");
		
		return mv;
	}
	
	// 카테고리별 상품 리스트 불러오기
	@RequestMapping("/mall/mallList.do")
	public void mallList(HttpServletResponse response, int cno, String searchType, String searchData, int lowValue, int highValue) throws Exception {
		String ctype=null;
		String stype_h=null;
		String stype_n=null;
		String stype_lv=null;
		String stype_hv=null;
		
		if(cno!=0) ctype="카테고리 분류";
		if(searchType.equals("hit")) stype_h="hit";
		if(searchType.equals("new")) stype_n="new";
		if(searchType.equals("low")) stype_lv="low";
		if(searchType.equals("high")) stype_hv="high";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ctype", ctype);
		map.put("cno", cno);
		map.put("stype_h", stype_h);
		map.put("stype_n", stype_n);
		map.put("stype_lv", stype_lv);
		map.put("stype_hv", stype_hv);
		map.put("searchData", searchData);
		map.put("lowValue", lowValue);
		map.put("highValue", highValue);
		
		List<Product> list = service.selectCateList(map);

		JSONObject jsonRes = null;
		JSONArray jsonArr = new JSONArray();

		DecimalFormat df = new DecimalFormat("#,###,###");
		if(!list.isEmpty()) {
			for(Product p : list) {
				jsonRes = new JSONObject();
				jsonRes.put("pno",p.getPno());
				jsonRes.put("pName", p.getpName());
				jsonRes.put("reImg", p.getReImg());
				jsonRes.put("price", df.format(p.getPrice()));
				jsonArr.add(jsonRes);
			}
		}
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
	
	
	
	// 장바구니 이동
	@RequestMapping("/mall/cartList.do")
	public String cartList(HttpServletRequest request) 
	{
		int pno = Integer.parseInt(request.getParameter("pno"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String userId = request.getParameter("userId");
		
		
		return "mall/cartList";
	}
	
	// 주문서 폼 이동
	@RequestMapping("mall/orderForm.do")
	public String orderForm() {
		return "mall/orderForm";
	}
	
}
