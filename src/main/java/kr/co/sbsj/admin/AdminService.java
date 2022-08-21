package kr.co.sbsj.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.history.HistoryDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;




@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;

	
	
	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = dao.searchOrderList( dto );
		return list;
	}//searchOrderList
	
	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchOrderListCount( dto );
		return totalCount;
	}//searchOrderListCount
	
	
	public List<MemberDTO> admin_member_updateList(String member_email) {
		List<MemberDTO> list = null;
		list = dao.admin_member_updateList( member_email );
		return list;
	}
	
	
	
	public int fileDelete( AdminDTO dto ) {
		int successCount = 0;
		successCount = dao.fileDelete( dto );
		return successCount;
	}//fileDelete
	
	
	public int update( AdminDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update
	
	
	
	public AdminDTO detail( String md_id ) {
		AdminDTO dto = null;
		dto = dao.detail( md_id );
		return dto;
	}//detail
	
	
	public int searchReviewCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchReviewCount( dto );
		return totalCount;
	}//searchListCount
	
	
	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
	public int searchMemberCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchMemberCount( dto );
		return totalCount;
	}//searchMemberCount
	
	public List<AdminReviewDTO> searchReview( SearchDTO dto ) {
		List<AdminReviewDTO> list = null;
		list = dao.searchReview( dto );
		return list;
	}//searchList
	
	public List<MdDTO> searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList
	
	public List<AdminDTO> selectMemberList( SearchDTO dto ) {
		List<AdminDTO> list = null;
		list = dao.selectMemberList( dto );
		return list;
	}//selectMemberList
	
	public void reviewDelete(String no) {
		dao.reviewDelete(no);
	}
	public void delete(String no) {
		dao.delete(no);
	}
	
	public void offsale(String no) {
		dao.offsale(no);
	}
	
	public void reviewOn(String no) {
		dao.reviewOn(no);
	}
	
	public void reviewOff(String no) {
		dao.reviewOff(no);
	}
	
	public void onsale(String no) {
		dao.onsale(no);
	}
	
	public void on_account(String no) {
		dao.on_account(no);
	}
	public void off_account(String no) {
		dao.off_account(no);
	}
	
	
}//class
