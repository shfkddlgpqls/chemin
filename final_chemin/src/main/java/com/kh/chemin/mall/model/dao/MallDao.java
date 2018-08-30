package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface MallDao {

	List<Map<String, String>> selectMallList(SqlSessionTemplate sqlSession);

}
