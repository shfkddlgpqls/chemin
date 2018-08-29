package com.kh.chemin.community.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.community.model.vo.Community;

public interface CommunityService {

	List<Map<String,String>> communityList();
	int communityWriteEnd(Community community);
}
