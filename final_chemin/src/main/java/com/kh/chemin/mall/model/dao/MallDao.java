package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.mall.model.vo.Product;

public interface MallDao {

	List<Map<String, String>> selectMallList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	List<Product> selectCateList(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int selectProductCount(SqlSessionTemplate sqlSession);

	//디테일 상품 정보
	List<Map<String, String>> selectDetail(SqlSessionTemplate sqlSession, int no);

}
