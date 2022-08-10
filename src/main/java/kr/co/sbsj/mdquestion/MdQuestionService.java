package kr.co.sbsj.mdquestion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.SearchDTO;


@Service
public class MdQuestionService {
	
	@Autowired
	private MdQuestionDAO dao;
	
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

	
}
