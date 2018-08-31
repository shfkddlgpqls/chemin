package com.kh.chemin.map.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.map.model.dao.PlaceDao;
import com.kh.chemin.map.model.vo.Place;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int placeInsert(Place place) {
		int result = dao.placeInsert(sqlSession, place);
		return result;
	}

}
