package kr.co.sbsj.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.SearchDTO;



@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount


	public List<MdDTO> searchList( SearchDTO dto ) {
		 List<MdDTO> list = null;
		list = sqlSession.selectList("AdminMapper.selectList", dto);
		return list;
	}//searchList
	
	public void delete( String no ) {
		sqlSession.delete("AdminMapper.delete", no);
	}//delete
	
}//JoinDAO
