package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.mall.model.dao.MallDao;

@Service
public class MallServiceImpl implements MallService {
	@Autowired
	MallDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectMallList() {
		return dao.selectMallList(sqlSession);
	}

}
