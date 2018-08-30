package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MallDaoImpl implements MallDao {

	@Override
	public List<Map<String, String>> selectMallList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("mall.selectMallList");
	}

}
