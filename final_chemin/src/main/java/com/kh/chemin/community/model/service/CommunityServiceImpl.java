package com.kh.chemin.community.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chemin.community.model.dao.CommunityDao;
import com.kh.chemin.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String,String>> communityList() {
		return dao.communityList(sqlSession);
	}

	@Override
	public int communityWriteEnd(Community community) {
		return dao.communityWriteEnd(sqlSession,community);
	}

}
