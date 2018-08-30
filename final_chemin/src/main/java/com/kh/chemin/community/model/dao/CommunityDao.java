package com.kh.chemin.community.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.chemin.community.model.vo.Community;

public interface CommunityDao {

	List<Map<String,String>> communityList(SqlSessionTemplate sqlSession);
	int communityWriteEnd(SqlSessionTemplate sqlSession, Community community);
}
