package kr.co.sbsj.mdreview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.SearchDTO;


@Repository
public class MdReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int delete( MdReviewDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("ReviewMapper.delete", dto);
		return successCount;
	}//delete
	
	public MdReviewDTO detail( String review_id ) {
		MdReviewDTO dto = null;
		dto = sqlSession.selectOne("ReviewMapper.detail", review_id);
		return dto;
	}//detail
	
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

	public int insert( MdReviewDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("ReviewMapper.insert", dto);
		return successCount;
	}//insert

	public int update(MdReviewDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ReviewMapper.update", dto);
		return successCount;
	}//update
	
}
