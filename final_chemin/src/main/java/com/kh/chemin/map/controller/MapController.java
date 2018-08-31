package com.kh.chemin.map.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.chemin.map.model.vo.Place;

@Controller
public class MapController {
	//지도를 보여주는 화면
	@RequestMapping("map/mapView.do")
	public String mapView() {
		return "/map/mapView";
	}
	
	//장소 상세정보를 보여주는 화면
	@RequestMapping("/map/placeInfo.do")
	public String info() {
		return "/map/placeInfo";
	}
	
	//장소를 등록하는 화면
	@RequestMapping("/map/placeReg.do")
	public String register() {
		return "/map/placeReg";
	}

	@RequestMapping("/map/placeInsert.do")
	public void placeInsert(Place place,MultipartFile mainImg,String phoneFirst, String phoneMiddle, String phoneEnd,String postCode, String roadAddr, String jibunAddr,
							  String day, String startTime, String endTime,String keyword1,String keyword2, String keyword3, String keyword4, String keyword5) {
		
		String phone=phoneFirst+"-"+phoneMiddle+"-"+phoneEnd;
		String address=roadAddr+"/"+postCode+"/"+jibunAddr;
		String time=day+"/"+startTime+"/"+endTime;
		String keyword = keyword1+" "+keyword2+" "+keyword3+" "+keyword4+" "+keyword5;
		place.setPlaPhone(phone);
		place.setPlaAddr(address);
		place.setPlaTime(time);
		place.setPlaKeyword(keyword);
		/*place.setOrImg(mainImg.getOriginalFilename());*/
		System.out.println("전화"+phone);
		System.out.println("주소"+address);
		System.out.println("시간"+time);
		System.out.println("키워드"+keyword);
		System.out.println("이미지"+mainImg);
		
		/*mainImg.get
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/place");
		int result = service.placeInsert(place);*/
	}
}
