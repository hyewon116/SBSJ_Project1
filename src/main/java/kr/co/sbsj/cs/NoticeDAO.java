package kr.co.sbsj.cs;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.SearchDTO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int update(NoticeDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("NoticeMapper.update", dto);
		return successCount;
	}//update
	
	public int delete(NoticeDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("NoticeMapper.delete", dto);
		return successCount;
	}//delete
	
	public void incrementViewCnt( String notice_id ) {
		sqlSession.update("NoticeMapper.incrementViewCnt", notice_id);
	}//incrementViewCnt
	
	public NoticeDTO detail(String notice_id) {
		NoticeDTO dto = null;
		dto = sqlSession.selectOne("NoticeMapper.detail", notice_id);
		return dto;
	}//detail
	
	public List<NoticeDTO> searchList( SearchDTO dto ) {
		List<NoticeDTO> list = null;
		list = sqlSession.selectList("NoticeMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("NoticeMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	public int write( NoticeDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("NoticeMapper.write", dto);
		return successCount;
	}//write
}
