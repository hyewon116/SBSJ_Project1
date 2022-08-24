package kr.co.sbsj.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.admin.AdminReviewDTO;
import kr.co.sbsj.cs.QnaDTO;
import kr.co.sbsj.md.CouponDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.mdquestion.MdQuestionDTO;
import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.order.OrderMainDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int orderCnt(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.selectOne("MemberMapper.orderCnt", dto);
		return successCount;
	}
	public int orderStatusCnt(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.selectOne("MemberMapper.orderStatusCnt", dto);
		return successCount;
	}
	
	public int qnaAnswerCnt(QnaDTO dto) {
		int successCount = 0;
		successCount = sqlSession.selectOne("MemberMapper.qnaAnswerCnt", dto);
		return successCount;
	}
	public int unusedCouponCnt(CouponDTO dto) {
		int successCount = 0;
		successCount = sqlSession.selectOne("MemberMapper.unusedCouponCnt", dto);
		return successCount;
	}
	
	public List<CouponDTO> coupon_list(CouponDTO dto) {
		List<CouponDTO> list = null;
		list = sqlSession.selectList("MemberMapper.couponList", dto);
		return list;
	}//coupon_list
	
	public void questionDelete( String no ) {
		sqlSession.delete("MemberMapper.questionDelete", no);
	}//questionDelete
	
	public MdQuestionDTO question_detail( String review_id ) {
		MdQuestionDTO dto = null;
		dto = sqlSession.selectOne("MemberMapper.question_detail", review_id);
		return dto;
	}//question_detail - 상품문의 디테일
	
	public int searchQuestionCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MemberMapper.searchQuestionCount", dto);
		return totalCount;
	}//searchQuestionCount - 상품문의 리스트
	
	public List<MdQuestionDTO> searchQuestion( SearchDTO dto ) {
		List<MdQuestionDTO> list = null;
		list = sqlSession.selectList("MemberMapper.searchQuestion", dto);
		return list;
	}//searchQuestion - 상품문의 리스트
	
	public void reviewDelete( String no ) {
		sqlSession.delete("MemberMapper.reviewDelete", no);
	}//reviewDelete
	
	public MdReviewDTO review_detail( String review_id ) {
		MdReviewDTO dto = null;
		dto = sqlSession.selectOne("MemberMapper.review_detail", review_id);
		return dto;
	}//review_detail - 상품후기 디테일
	
	public int searchReviewCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MemberMapper.searchReviewCount", dto);
		return totalCount;
	}//searchReviewCount - 상품후기 리스트
	
	public List<AdminReviewDTO> searchReview( SearchDTO dto ) {
		 List<AdminReviewDTO> list = null;
		list = sqlSession.selectList("MemberMapper.selectReview", dto);
		return list;
	}//searchReview - 상품후기 리스트

	public void wish_delete( String no ) {
		sqlSession.delete("MemberMapper.wish_delete", no);
	}//wish_delete
	
	public List<MdDTO> wish_searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = sqlSession.selectList( "MemberMapper.wish_selectList", dto );
		return list;
	}//wish_searchList

	public int wish_searchListCount( String member_id ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne( "MemberMapper.wish_searchListCount", member_id );
		return totalCount;
	}//wish_searchListCount

	public int update( MemberDTO dto ) {
       int successCount = 0;
       successCount = sqlSession.update("MemberMapper.member_update", dto);
       return successCount;
	}//update
	
	public int update1( MemberDTO dto ) {
		int successCount1 = 0;
		successCount1 = sqlSession.update("MemberMapper.delivery_update", dto);
		return successCount1;
	}//update

	
	
	public int passwordCheck( MemberDTO dto ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.passwordCheck", dto );
		return isYN;
	}
	
	public int nickCheck( String member_nick ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.nickCheck", member_nick );
		return isYN;
	}
	public int emailCheck( String member_email ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.emailCheck", member_email );
		return isYN;
	}
	public int phoneCheck( String member_phone ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.phoneCheck", member_phone );
		return isYN;
	}

	public List<UpdateDTO> member_updateList(String member_email) {
		List<UpdateDTO> list = null;
		list = sqlSession.selectList( "MemberMapper.member_updateList", member_email );
		return list;
	}

}//JoinDAO
