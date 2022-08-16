package kr.co.sbsj.mdquestion;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.SearchDTO;


@Repository
public class MdQuestionDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int delete( MdQuestionDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("QuestionMapper.delete", dto);
		return successCount;
	}//delete
	
	public int update(MdQuestionDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("QuestionMapper.update", dto);
		return successCount;
	}//update
	
	public MdQuestionDTO detail( String md_question_id ) {
		MdQuestionDTO dto = null;
		dto = sqlSession.selectOne("QuestionMapper.detail", md_question_id);
		return dto;
	}//detail
	
	public List<MdQuestionDTO> pagingList( SearchDTO dto ) {
		List<MdQuestionDTO> list = null;
		list = sqlSession.selectList("QuestionMapper.pagingList", dto );
		return list;
	}//pagingList

	public int totalListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("QuestionMapper.totalCount", dto );
		return totalCount;
	}//totalListCount

	public int insert( MdQuestionDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("QuestionMapper.insert", dto);
		return successCount;
	}//insert
	
}
