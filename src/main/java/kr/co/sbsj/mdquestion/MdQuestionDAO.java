package kr.co.sbsj.mdquestion;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.SearchDTO;


@Repository
public class MdQuestionDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
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
