package kr.co.sbsj.mdreview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.SearchDTO;


@Repository
public class MdReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MdReviewDTO> pagingList( SearchDTO dto ) {
		List<MdReviewDTO> list = null;
		list = sqlSession.selectList("ReviewMapper.pagingList", dto );
		return list;
	}//pagingList

	public int totalListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("ReviewMapper.totalCount", dto );
		return totalCount;
	}//totalListCount

	public int question_totalListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("ReviewMapper.question_totalCount", dto );
		return totalCount;
	}//question_totalListCount

	public List<MdReviewDTO> question_pagingList( SearchDTO dto ) {
		List<MdReviewDTO> list = null;
		list = sqlSession.selectList("ReviewMapper.question_pagingList", dto );
		return list;
	}//question_pagingList
	
}
