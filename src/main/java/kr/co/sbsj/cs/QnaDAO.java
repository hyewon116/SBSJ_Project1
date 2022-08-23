package kr.co.sbsj.cs;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.SearchDTO;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int replyInsert(QnaDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("QnaMapper.replyInsert", dto);
		return successCount;
	}//replyInsert

	public int update_answerY(QnaDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("QnaMapper.update_answerY", dto);
		return successCount;
	}//update_answerY
	
	public int update_answerNcnt(QnaDTO dto) {
		int successCount = 0;
		successCount = sqlSession.selectOne("QnaMapper.update_answerNcnt", dto);
		return successCount;
	}//update_answerNcnt
	
	
	public int update(QnaDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("QnaMapper.update", dto);
		return successCount;
	}//update
	
	public int delete(QnaDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("QnaMapper.delete", dto);
		return successCount;
	}//delete
	
	public void incrementViewCnt( String qa_question_id ) {
		sqlSession.update("QnaMapper.incrementViewCnt", qa_question_id);
	}//incrementViewCnt
	
	public QnaDTO detail(String qa_question_id) {
		QnaDTO dto = null;
		dto = sqlSession.selectOne("QnaMapper.detail", qa_question_id);
		return dto;
	}//detail
	
	
	public List<QnaDTO> searchList( SearchDTO dto ) {
		List<QnaDTO> list = null;
		list = sqlSession.selectList("QnaMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("QnaMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	public int write( QnaDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("QnaMapper.write", dto);
		return successCount;
	}//write

}
