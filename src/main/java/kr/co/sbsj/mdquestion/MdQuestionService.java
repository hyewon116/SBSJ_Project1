package kr.co.sbsj.mdquestion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.SearchDTO;


@Service
public class MdQuestionService {
	
	@Autowired
	private MdQuestionDAO dao;
	
	public MdQuestionDTO replyDetail( String md_question_id ) {
		MdQuestionDTO dto = null;
		dto = dao.replyDetail( md_question_id );
		return dto;
	}//replyDetail
	
	public int delete( MdQuestionDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete
	
	public int update( MdQuestionDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update
	
	public MdQuestionDTO detail( String md_question_id ) {
		MdQuestionDTO dto = null;
		dto = dao.detail( md_question_id );
		return dto;
	}//detail
	
	public List<MdQuestionDTO> pagingList( SearchDTO dto ) {
		List<MdQuestionDTO> list = null;
		list = dao.pagingList( dto );
		return list;
	}//pagingList

	public int totalListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.totalListCount( dto );
		return totalCount;
	}//totalListCount

	public int insert( MdQuestionDTO dto ) {
		int successCount = 0;
		successCount = dao.insert( dto );
		return successCount;
	}//insert
}
