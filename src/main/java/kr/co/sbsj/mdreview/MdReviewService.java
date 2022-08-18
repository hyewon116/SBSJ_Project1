package kr.co.sbsj.mdreview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.SearchDTO;


@Service
public class MdReviewService {
	
	@Autowired
	private MdReviewDAO dao;
	
	public int delete( MdReviewDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete
	
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

	public int insert( MdReviewDTO dto ) {
		int successCount = 0;
		successCount = dao.insert( dto );
		return successCount;
	}//insert

	public MdReviewDTO detail( String review_id ) {
		MdReviewDTO dto = null;
		dto = dao.detail( review_id );
		return dto;
	}//detail

	public int update( MdReviewDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update

}
