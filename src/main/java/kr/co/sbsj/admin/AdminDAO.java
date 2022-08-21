package kr.co.sbsj.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.history.HistoryDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;



@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	
	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("AdminMapper.searchOrderList", dto);
		return list;
	}//searchOrderList
	
	
	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchOrderListCount", dto);
		return totalCount;
	}//searchOrderListCount
	
	
	public List<MemberDTO> admin_member_updateList(String member_email) {
		List<MemberDTO> list = null;
		list = sqlSession.selectList( "AdminMapper.admin_member_updateList", member_email );
		return list;
	}//admin_member_updateList
	
	
	
	
	public int fileDelete( AdminDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.fileDelete", dto);
		return successCount;
	}//delete
	
	public int update( AdminDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.update", dto);
		return successCount;
	}//update
	
	
	
	public AdminDTO detail( String md_id ) {
		AdminDTO dto = null;
		dto = sqlSession.selectOne("AdminMapper.detail", md_id);
		return dto;
	}//detail
	
	
	public int searchReviewCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchReviewCount", dto);
		return totalCount;
	}//searchListCount
	
	
	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	public int searchMemberCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchMemberCount", dto);
		return totalCount;
	}//searchListCount


	public List<AdminReviewDTO> searchReview( SearchDTO dto ) {
		 List<AdminReviewDTO> list = null;
		list = sqlSession.selectList("AdminMapper.selectReview", dto);
		return list;
	}//searchList
	
	public List<MdDTO> searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("AdminMapper.selectList", dto);
		return list;
	}//searchList
	
	public List<AdminDTO> selectMemberList( SearchDTO dto ) {
		List<AdminDTO> list = null;
		list = sqlSession.selectList("AdminMapper.selectMemberList", dto);
		return list;
	}//selectMemberList
	
	public void reviewDelete( String no ) {
		sqlSession.delete("AdminMapper.reviewDelete", no);
	}//reviewDelete
	
	public void delete( String no ) {
		sqlSession.delete("AdminMapper.delete", no);
	}//delete

	public void offsale(String no) {
		sqlSession.update("AdminMapper.offsale", no);
		
	}
	public void reviewOn(String no) {
		sqlSession.update("AdminMapper.reviewOn", no);
		
	}
	
	public void reviewOff(String no) {
		sqlSession.update("AdminMapper.reviewOff", no);
		
	}
	
	
	public void onsale(String no) {
		sqlSession.update("AdminMapper.onsale", no);
		
	}
	public void on_account(String no) {
		sqlSession.update("AdminMapper.on_account", no);
		
	}
	public void off_account(String no) {
		sqlSession.update("AdminMapper.off_account", no);
		
	}
	
}//JoinDAO
