package com.kh.chemin.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	@RequestMapping("map/mapView.do")
	public String mapView() {
		return "/map/mapView";
	}
	
	@RequestMapping("/map/placeInfo.do")
	public String info() {
		return "/map/placeInfo";
	}
	@RequestMapping("/map/placeReg.do")
	public String register() {
		return "/map/placeReg";
	}
}
