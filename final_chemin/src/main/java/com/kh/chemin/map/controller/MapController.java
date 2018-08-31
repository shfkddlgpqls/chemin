package com.kh.chemin.map.controller;



import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chemin.community.controller.CommunityController;
import com.kh.chemin.community.model.service.CommunityService;
import com.kh.chemin.map.model.service.PlaceService;
import com.kh.chemin.map.model.vo.Place;

@Controller
public class MapController {
	
	private Logger logger=LoggerFactory.getLogger(MapController.class);

	@Autowired
	private PlaceService service;
	
	//지도를 보여주는 화면
	@RequestMapping("/map/mapView.do")
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


	@RequestMapping(value="/map/placeInsert.do", method = RequestMethod.POST)
	public ModelAndView placeInsert(Place place, @RequestParam("mainImg")MultipartFile mainImg, HttpServletRequest request, String phoneFirst, String phoneMiddle, String phoneEnd,String postCode, String roadAddr, String jibunAddr,
							  String day, String startTime, String endTime,String keyword1,String keyword2, String keyword3, String keyword4, String keyword5) {
		
		String phone=phoneFirst+"-"+phoneMiddle+"-"+phoneEnd;
		String address=roadAddr+"/"+postCode+"/"+jibunAddr;
		String time=day+"/"+startTime+"/"+endTime;
		String keyword = keyword1+" "+keyword2+" "+keyword3+" "+keyword4+" "+keyword5;
		place.setPlaPhone(phone);
		place.setPlaAddr(address);
		place.setPlaTime(time);
		place.setPlaKeyword(keyword);
		place.setUserId("hyebeen");
		/*place.setOrImg(mainImg.getOriginalFilename());*/
		logger.debug("전화 : "+phone);
		logger.debug("주소 : "+address);
		logger.debug("시간 : "+time);
		logger.debug("키워드 : "+keyword);
		logger.debug("이미지 : "+mainImg.getName());
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/place");
		if(!mainImg.isEmpty()) {	
			String orImg = mainImg.getOriginalFilename();
			String reImg = orImg;
			try {
				mainImg.transferTo(new File(saveDir+"/"+reImg));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			place.setOrImg(orImg);
			place.setReImg(reImg);
		}
		
		int result = service.placeInsert(place);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="등록이 완료되었습니다.";
		}else {
			msg="등록이 되지 않았습니다.";
		}
		loc="/";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
