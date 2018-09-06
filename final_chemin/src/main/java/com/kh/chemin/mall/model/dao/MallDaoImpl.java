package com.kh.chemin.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.chemin.mall.model.vo.Product;

@Repository
public class MallDaoImpl implements MallDao {

	// 전체 상품 리스트 가져오기
	@Override
	public List<Map<String, String>> selectMallList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("mall.selectMallList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	// 카테고리별 상품 리스트 가져오기
	@Override
	public List<Product> selectCateList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("mall.selectCateList", map);
	}

	@Override
	public int selectProductCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mall.selectProductCount");
	}

	//디테일 상품 정보
	@Override
	public List<Map<String, String>> selectDetail(SqlSessionTemplate sqlSession, int no) 
	{
		return sqlSession.selectList("mall.selectDetail", no);
	}

	@Override
	 public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
	      return sqlSession.selectOne("mall.selectProduct", pno);
	 }


	
	
	
	
	
	
	
	
	

	
	

}
