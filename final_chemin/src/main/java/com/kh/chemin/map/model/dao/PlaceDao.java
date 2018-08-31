package com.kh.chemin.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;

public interface PlaceDao {
	int placeInsert(SqlSessionTemplate sqlSession, Place place);
}
