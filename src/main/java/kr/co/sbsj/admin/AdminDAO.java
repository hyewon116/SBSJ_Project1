package kr.co.sbsj.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.history.HistoryDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.mdquestion.MdQuestionDTO;
import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;



@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public MdQuestionDTO replyDetail( String md_question_id ) {
		MdQuestionDTO dto = null;
		dto = sqlSession.selectOne("AdminMapper.replyDetail", md_question_id);
		return dto;
	}//replyDetail - 답변 상세
	
	public int stateChange( MdQuestionDTO dto ) {
		int changeCount = 0;
		changeCount = sqlSession.update("AdminMapper.stateChange", dto);
		return changeCount;
	}//stateChange

	public int replyInsert( MdQuestionDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("AdminMapper.replyInsert", dto);
		return successCount;
	}//replyInsert
	
	public void questionOn(String no) {
		sqlSession.update("AdminMapper.questionOn", no);
	}//reviewOn
	
	public void questionOff(String no) {
		sqlSession.update("AdminMapper.questionOff", no);	
	}//reviewOff
	
	public void questionDelete( String no ) {
		sqlSession.delete("AdminMapper.questionDelete", no);
	}//questionDelete - 문의 삭제
	
	public MdQuestionDTO questionDetail( String md_question_id ) {
		MdQuestionDTO dto = null;
		dto = sqlSession.selectOne("AdminMapper.questionDetail", md_question_id);
		return dto;
	}//questionDetail - 문의 상세
	
	public List<MdQuestionDTO> searchQuestion(SearchDTO dto) {
		List<MdQuestionDTO> list = null;
		list = sqlSession.selectList("AdminMapper.selectQuestion", dto);
		return list;
	}//searchQuestion - 문의 리스트
	
	public List<MdQuestionDTO> searchQuestionAnswerNList(SearchDTO dto) {
		List<MdQuestionDTO> list = null;
		list = sqlSession.selectList("AdminMapper.searchQuestionAnswerNList", dto);
		return list;
	}//searchQuestionAnswerNList - 상품문의 미답변리스트

	public int searchQuestionCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchQuestionCount", dto);
		return totalCount;
	}//searchQuestionCount - 문의 리스트
	
	public int searchQuestionAnswerNCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchQuestionAnswerNCount", dto);
		return totalCount;
	}//searchQuestionAnswerNCount - 상품문의 미답변 리스트 카운트
	
	
	public void reviewOn(String no) {
		sqlSession.update("AdminMapper.reviewOn", no);
	}//reviewOn
	
	public void reviewOff(String no) {
		sqlSession.update("AdminMapper.reviewOff", no);	
	}//reviewOff
	
	public void reviewDelete( String no ) {
		sqlSession.delete("AdminMapper.reviewDelete", no);
	}//reviewDelete - 후기 삭제
	
	public List<AdminReviewDTO> searchReview( SearchDTO dto ) {
		List<AdminReviewDTO> list = null;
		list = sqlSession.selectList("AdminMapper.selectReview", dto);
		return list;
	}//searchReview - 후기 리스트 
	
	public int searchReviewCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchReviewCount", dto);
		return totalCount;
	}//searchReviewCount - 후기 리스트
	
	
	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("AdminMapper.searchOrderList", dto);
		return list;
	}//searchOrderList
	
	public List<HistoryDTO> Nsend_OrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("AdminMapper.Nsend_OrderList", dto);
		return list;
	}//Nsend_OrderList
	
	public List<HistoryDTO> orderDetail(HistoryDTO dto) {
	      List<HistoryDTO> list = null;
	      list = sqlSession.selectList("AdminMapper.orderDetail", dto);
	      return list;
	   }//orderDetail
	public int changeStatus( HistoryDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.changeStatus", dto);
		return successCount;
	}//delete
	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.searchOrderListCount", dto);
		return totalCount;
	}//searchOrderListCount
	
	public int Nsend_OrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.Nsend_OrderListCount", dto);
		return totalCount;
	}//searchOrderListCount
	
	public int order_TotalAmt( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.order_TotalAmt", dto);
		return totalCount;
	}//order_TotalAmt
	
	public int admin_order_TodayAmt( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("AdminMapper.admin_order_TodayAmt", dto);
		return totalCount;
	}//admin_order_TodayAmt
	
	
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

	
	public void delete( String no ) {
		sqlSession.delete("AdminMapper.delete", no);
	}//delete

	public void offsale(String no) {
		sqlSession.update("AdminMapper.offsale", no);
		
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
