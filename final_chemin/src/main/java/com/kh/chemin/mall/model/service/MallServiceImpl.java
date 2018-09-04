package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.mall.model.dao.MallDao;
import com.kh.chemin.mall.model.vo.Product;

@Service
public class MallServiceImpl implements MallService {
	@Autowired
	MallDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	// 전체 상품 리스트 가져오기
	@Override
	public List<Map<String, String>> selectMallList(int cPage, int numPerPage) {
		return dao.selectMallList(sqlSession, cPage, numPerPage);
	}

	// 카테고리별 상품 리스트 가져오기
	@Override
	public List<Product> selectCateList(Map<String, Object> map) {
		return dao.selectCateList(sqlSession, map);
	}

	@Override
	public int selectProductCount() {
		return dao.selectProductCount(sqlSession);
	}

	//상품 디테일 정보 가져오기
	@Override
	public List<Map<String, String>> selectDetail(int no) 
	{
		return dao.selectDetail(sqlSession, no);
	}

	
}
