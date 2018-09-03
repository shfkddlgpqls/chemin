package com.kh.chemin.community.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.community.model.vo.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Override
	public List<Map<String,String>> communityList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("community.communityList");
	}

	@Override
	public int communityWriteEnd(SqlSessionTemplate sqlSession, Community community) {
		return sqlSession.insert("community.communityWriteEnd",community);
	}

}
