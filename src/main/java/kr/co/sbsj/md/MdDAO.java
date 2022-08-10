package kr.co.sbsj.md;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.SearchDTO;

@Repository
public class MdDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MdDTO detail( String md_id ) {
		MdDTO dto = null;
		dto = sqlSession.selectOne("MdMapper.detail", md_id);
		return dto;
	}//detail
	
	public List<MdDTO> searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("MdMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MdMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	public int insert( MdDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("MdMapper.insert", dto);
		return successCount;
	}//insert

}
