package kr.co.sbsj.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.history.HistoryDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.mdquestion.MdQuestionDTO;
import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;




@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	public MdQuestionDTO replyDetail( String md_question_id ) {
		MdQuestionDTO dto = null;
		dto = dao.replyDetail( md_question_id );
		return dto;
	}//replyDetail

	public int stateChange(MdQuestionDTO dto) {
		int changeCount = 0;
		changeCount = dao.stateChange( dto );
		return changeCount;
	}//stateChange - 문의완료 체인지
	
	public int replyInsert( MdQuestionDTO dto ) {
		int successCount = 0;
		successCount = dao.replyInsert( dto );
		return successCount;
	}//replyInsert - 답변 등록
	
	public void questionOn(String no) {
		dao.questionOn(no);
	}//questionOn
	
	public void questionOff(String no) {
		dao.questionOff(no);
	}//questionOff
	
	public void questionDelete(String no) {
		dao.questionDelete(no);
	}//questionDelete - 문의 삭제
	
	public MdQuestionDTO questionDetail( String md_question_id ) {
		MdQuestionDTO dto = null;
		dto = dao.questionDetail( md_question_id );
		return dto;
	}//questionDetail - 문의 상세
	
	public List<MdQuestionDTO> searchQuestion(SearchDTO dto) {
		List<MdQuestionDTO> list = null;
		list = dao.searchQuestion( dto );
		return list;
	}//searchQuestion - 문의리스트
	
	public List<MdQuestionDTO> searchQuestionAnswerNList(SearchDTO dto) {
		List<MdQuestionDTO> list = null;
		list = dao.searchQuestionAnswerNList( dto );
		return list;
	}//searchQuestion - 상품문의 미답변 리스트
	
	public int searchQuestionCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchQuestionCount( dto );
		return totalCount;	
	}//searchQuestionCount - 문의리스트
	
	public int searchQuestionAnswerNCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchQuestionAnswerNCount( dto );
		return totalCount;	
	}//searchQuestionAnswerNCount - 상품문의 미답변 리스트 카운트
		
	
	public void reviewOn(String no) {
		dao.reviewOn(no);
	}//reviewOn
	
	public void reviewOff(String no) {
		dao.reviewOff(no);
	}//reviewOff
	
	public void reviewDelete(String no) {
		dao.reviewDelete(no);
	}//reviewDelete - 후기 삭제
		
	public int searchReviewCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchReviewCount( dto );
		return totalCount;
	}//searchReviewCount - 후기 리스트
		
	public List<AdminReviewDTO> searchReview( SearchDTO dto ) {
		List<AdminReviewDTO> list = null;
		list = dao.searchReview( dto );
		return list;
	}//searchReview - 후기 리스트
	
	
	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = dao.searchOrderList( dto );
		return list;
	}//searchOrderList
	
	public List<HistoryDTO> Nsend_OrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = dao.Nsend_OrderList( dto );
		return list;
	}//searchOrderList
	
	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchOrderListCount( dto );
		return totalCount;
	}//searchOrderListCount
	
	
	public int Nsend_OrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.Nsend_OrderListCount( dto );
		return totalCount;
	}//searchOrderListCount
	
	public int order_TotalAmt( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.order_TotalAmt( dto );
		return totalCount;
	}//order_TotalAmt
	
	public int admin_order_TodayAmt( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.admin_order_TodayAmt( dto );
		return totalCount;
	}//admin_order_TodayAmt
	
	public List<HistoryDTO> orderDetail(HistoryDTO dto) {
	      List<HistoryDTO> list = null;
	      list = dao.orderDetail( dto );
	      return list;
	   }//orderDetail
	public int changeStatus(HistoryDTO dto) {
		int successCount = 0;
		successCount = dao.changeStatus( dto );
		return successCount;
	   }//changeStatus
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
	
	public void delete(String no) {
		dao.delete(no);
	}
	
	public void offsale(String no) {
		dao.offsale(no);
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
