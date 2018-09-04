package com.kh.chemin.mall.model.service;

import java.util.List;
import java.util.Map;

import com.kh.chemin.mall.model.vo.Product;

public interface MallService {

	List<Map<String, String>> selectMallList(int cPage, int numPerPage);

	List<Product> selectCateList(Map<String, Object> map);

	int selectProductCount();

	//상품 디테일 정보 가져오기
	List<Map<String, String>> selectDetail(int no);

}
