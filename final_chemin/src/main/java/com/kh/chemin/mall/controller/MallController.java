package com.kh.chemin.mall.controller;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.common.MallPageBar;
import com.kh.chemin.mall.model.service.MallService;
import com.kh.chemin.mall.model.vo.Product;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SessionAttributes(value = {"memberLoggedIn"})
@Controller
public class MallController 
{
	@Autowired
	MallService service;
	
	// 메인 쇼핑몰로 이동
	@RequestMapping("/mall/mainMall.do")
	public ModelAndView mainMall()
	{
		ModelAndView mv = new ModelAndView();

		mv.setViewName("mall/mainMall");
		
		return mv;
	}
	
	// 카테고리별 상품 리스트 불러오기
	@RequestMapping("/mall/mallList.do")
	public void mallList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, HttpServletResponse response, int cno, String searchType, String searchData, int lowValue, int highValue) throws Exception {
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

		int numPerPage = 8;
		
		List<Product> list = service.selectCateList(map, cPage, numPerPage);

		int totalCount = service.selectCateCount(map);

		String pageBar = MallPageBar.getPageMall(cPage, numPerPage, totalCount, "mallList.do");

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
		jsonArr.add(pageBar);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArr);
	}
	
	// 상품 상세화면 이동
	@RequestMapping("/mall/detail.do")
	public String mallDetail() {
		return "mall/productDetail";
	}
	
	// 장바구니에 데이터 추가
	@RequestMapping("/mall/cartAdd.do")
	public String cartAdd(String userId, int pno, int amount) {
		Product product = service.selectProduct(pno);
		int price = product.getPrice() * amount;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pno", product.getPno());
		map.put("amount", amount);
		map.put("totalPrice", price);

		int result = service.insertCart(map);
		
		return "mall/cartList";
	}

	// 장바구니 이동
	@RequestMapping("/mall/cartList.do")
	public String cartList() {
		// 상태가 n이고 일주일 넘은 데이터 삭제해주기?
		return "mall/cartList";
	}
	
	// 주문서 폼 이동
	@RequestMapping("mall/orderForm.do")
	public String orderForm() {
		return "mall/orderForm";
	}
	
}
