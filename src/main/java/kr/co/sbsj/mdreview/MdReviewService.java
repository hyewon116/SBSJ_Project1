package kr.co.sbsj.mdreview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.SearchDTO;


@Service
public class MdReviewService {
	
	@Autowired
	private MdReviewDAO dao;
	
	public List<MdReviewDTO> pagingList( SearchDTO dto ) {
		List<MdReviewDTO> list = null;
		list = dao.pagingList( dto );
		return list;
	}//pagingList

	public int totalListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.totalListCount( dto );
		return totalCount;
	}//totalListCount

	public List<MdReviewDTO> question_pagingList( SearchDTO dto ) {
		List<MdReviewDTO> list = null;
		list = dao.question_pagingList( dto );
		return list;
	}//question_pagingList
	
	public int question_totalListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.question_totalListCount( dto );
		return totalCount;
	}//question_totalListCount

	
}
