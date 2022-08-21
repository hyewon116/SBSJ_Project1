package kr.co.sbsj.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.SearchDTO;

@Service
public class QnaService {
	@Autowired
	private QnaDAO dao;
	
	
	public int replyInsert(QnaDTO dto) {
		int successCount = 0;
		successCount = dao.replyInsert(dto);
		return successCount;
	}//update
	
	public int update(QnaDTO dto) {
		int successCount = 0;
		successCount = dao.update(dto);
		return successCount;
	}//update
	
	public int delete(QnaDTO dto) {
		int successCount = 0;
		successCount = dao.delete(dto);
		return successCount;
	}//delete
	
	public QnaDTO detail(String qa_question_id) {
		dao.incrementViewCnt(qa_question_id);
		
		QnaDTO dto = null;
		dto = dao.detail(qa_question_id);
		return dto;
	}//detail
	
	public List<QnaDTO> searchList( SearchDTO dto ) {
		List<QnaDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
	public int write( QnaDTO dto ) {
		int successCount = 0;
		successCount = dao.write( dto );
		return successCount;
	}//write
}
