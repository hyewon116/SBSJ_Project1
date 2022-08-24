package kr.co.sbsj.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.admin.AdminReviewDTO;
import kr.co.sbsj.cs.QnaDTO;
import kr.co.sbsj.md.CouponDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.mdquestion.MdQuestionDTO;
import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.order.OrderMainDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.Naver_MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	public int orderCnt(OrderMainDTO dto) {
		int successCount = 0;
		successCount = dao.orderCnt(dto);
		return successCount;
	}
	public int orderStatusCnt(OrderMainDTO dto) {
		int successCount = 0;
		successCount = dao.orderStatusCnt(dto);
		return successCount;
	}
	
	public int qnaAnswerCnt(QnaDTO dto) {
		int successCount = 0;
		successCount = dao.qnaAnswerCnt(dto);
		return successCount;
	}
	
	public int unusedCouponCnt(CouponDTO dto) {
		int successCount = 0;
		successCount = dao.unusedCouponCnt(dto);
		return successCount;
	}
	
	public List<CouponDTO> coupon_list(CouponDTO dto) {
		List<CouponDTO> list = null;
		list = dao.coupon_list( dto );
		return list;
	}//coupon_list
	
	public void questionDelete(String no) {
		dao.questionDelete(no);
	}//questionDelete
	
	public MdQuestionDTO question_detail(String review_id) {
		MdQuestionDTO dto = null;
		dto = dao.question_detail( review_id );
		return dto;
	}//question_detail
	
	public int searchQuestionCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchQuestionCount( dto );
		return totalCount;
	}//searchQuestionCount
	
	public List<MdQuestionDTO> searchQuestion( SearchDTO dto ) {
		List<MdQuestionDTO> list = null;
		list = dao.searchQuestion( dto );
		return list;
	}//searchQuestion
	
	public void reviewDelete(String no) {
		dao.reviewDelete(no);
	}//reviewDelete
	
	public MdReviewDTO review_detail(String review_id) {
		MdReviewDTO dto = null;
		dto = dao.review_detail( review_id );
		return dto;
	}//review_detail
	
	public int searchReviewCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchReviewCount( dto );
		return totalCount;
	}//searchReviewCount
	
	public List<AdminReviewDTO> searchReview( SearchDTO dto ) {
		List<AdminReviewDTO> list = null;
		list = dao.searchReview( dto );
		return list;
	}//searchReview
	
	public void wish_delete(String no) {
		dao.wish_delete(no);
	}//wish_delete
	
	public List<MdDTO> wish_searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = dao.wish_searchList( dto );
		return list;
	}//wish_searchList
	
	public int wish_searchListCount( String member_id ) {
		int totalCount = 0;
		totalCount = dao.wish_searchListCount( member_id );
		return totalCount;
	}//wish_searchListCount
	
	public int update( MemberDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update
	
	public int update1( MemberDTO dto ) {
		int successCount1 = 0;
		successCount1 = dao.update1( dto );
		return successCount1;
	}//delivery_update
	
	
	
	public int passwordCheck( MemberDTO dto ) {
		int isYN = 0;
		isYN = dao.passwordCheck( dto );
		return isYN;
	}//idCheck
	
	
	public int nickCheck( String member_nick ) {
		int isYN = 0;
		isYN = dao.nickCheck( member_nick );
		return isYN;
	}//idCheck
	
	public int emailCheck( String member_email ) {
		int isYN = 0;
		isYN = dao.emailCheck( member_email );
		return isYN;
	}//idCheck
	
	public int phoneCheck( String member_phone ) {
		int isYN = 0;
		isYN = dao.phoneCheck( member_phone );
		return isYN;
	}//idCheck

	public List<UpdateDTO> member_updateList(String member_email) {
		List<UpdateDTO> list = null;
		list = dao.member_updateList( member_email );
		return list;
	}
	
}//class
