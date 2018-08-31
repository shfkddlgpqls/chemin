package com.kh.chemin.map.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.map.model.vo.Place;

@Repository
public class PlaceDaoImpl implements PlaceDao {

	@Override
	public int placeInsert(SqlSessionTemplate sqlSession, Place place) {
		return sqlSession.insert("place.placeInsert",place);
	}

}
