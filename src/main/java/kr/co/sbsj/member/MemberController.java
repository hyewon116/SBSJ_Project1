package kr.co.sbsj.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.admin.AdminReviewDTO;
import kr.co.sbsj.admin.AdminService;
import kr.co.sbsj.md.CouponDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.mdquestion.MdQuestionDTO;
import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;


@Controller
@RequestMapping( value = "/member" )
public class MemberController {
	
	
	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private AdminService service2;
	
	//내 쿠폰 목록
	@RequestMapping( value = "/member_coupon_list", method = RequestMethod.GET )
	private String couponList( Model model, CouponDTO dto, HttpSession session) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login_info");
		String member_id = mdto.getMember_id();
		dto.setMember_id(member_id);
		
		List<CouponDTO> list = null;
		list = service.coupon_list( dto );
		model.addAttribute("coupon_list", list); 
		
		return "/member/member_coupon_list";
	}//couponList
	
	
	//내 상품 문의 삭제
	@RequestMapping( value = "/question_delete")
	private String questionDelete(HttpServletRequest request) {
			
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.questionDelete(ajaxMsg[i]);
		}
			
		return "/member/member_question_list";
	}//questionDelete
		
	//내 상품 문의 디테일
	@RequestMapping( value = "/question_detail", method = RequestMethod.GET )
	public String question_detail( String md_question_id, Model model, MemberDTO mdto ) {
		MdQuestionDTO dto = null;
		dto = service.question_detail( md_question_id );//문의 상세
		model.addAttribute("detail_dto", dto);
		
		dto = service2.replyDetail( md_question_id );//답변 상세
		model.addAttribute("reply_dto", dto);
		
		model.addAttribute("review_id", md_question_id); //수정&삭제 때 보낼 review_id 정보
		return "member/member_question_detail";//jsp file name
	}//question_detail
		
	//내 상품 문의 리스트
	@RequestMapping( value = "/member_question_list", method = RequestMethod.GET )
	public String questionList( Model model, String userWantPage, SearchDTO dto, HttpSession session ) {
			
		MemberDTO mdto = (MemberDTO) session.getAttribute("login_info");
		String member_id = mdto.getMember_id();
		dto.setMember_id(member_id);
			
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchQuestionCount( dto );
			
		if(totalCount > 10) {
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { 
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;
				
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}//if
		}//if

		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );

		List<MdQuestionDTO> list = null;
		list = service.searchQuestion( dto );
		System.out.println("===========================================================");
		System.out.println(list.toString());
		System.out.println("===========================================================");
		model.addAttribute("list", list); 
		model.addAttribute("search_dto", dto);
			 
		return "/member/member_question_list";//jsp file name
	}//questionList
		
	
	//내 상품 후기 삭제
	@RequestMapping( value = "/review_delete")
	private String reviewDelete(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.reviewDelete(ajaxMsg[i]);
		}
		
		return "/member/member_review_list";
	}//review_delete
	
	//내 상품 후기 디테일
	@RequestMapping( value = "/review_detail", method = RequestMethod.GET )
	public String review_detail( String review_id, Model model, MemberDTO mdto ) {
		MdReviewDTO dto = null;
		dto = service.review_detail( review_id );
		model.addAttribute("detail_dto", dto);
		model.addAttribute("review_id", review_id); //수정&삭제 때 보낼 review_id 정보
		return "member/member_review_detail";//jsp file name
	}//detail

	//내 상품 후기 리스트
	@RequestMapping( value = "/member_review_list", method = RequestMethod.GET )
	public String reviewList( Model model, String userWantPage, SearchDTO dto, HttpSession session ) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login_info");
		String member_id = mdto.getMember_id();
		dto.setMember_id(member_id);
		
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchReviewCount( dto );
		
		if(totalCount > 10) {
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { 
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;
			
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}//if
		}//if

		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );

		List<AdminReviewDTO> list = null;
		list = service.searchReview( dto );
		System.out.println("===========================================================");
		System.out.println(list.toString());
		System.out.println("===========================================================");
		model.addAttribute("list", list); 
		model.addAttribute("search_dto", dto);
		 
		return "/member/member_review_list";//jsp file name
	}//member_review_list
	
	
	//찜 목록 삭제
	@RequestMapping( value = "/wish_delete")
	private String wish_delete(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.wish_delete(ajaxMsg[i]);
		}
		
		return "/member/member_wish_list";
	}//wish_delete

	
	//찜 목록 리스트
	@RequestMapping( value = "/member_wish_list", method = RequestMethod.GET )
	private String member_wish_list( Model model, String userWantPage, SearchDTO dto, HttpSession session ) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login_info");
		String member_id = mdto.getMember_id();
		System.out.println("======================" + member_id);
		
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.wish_searchListCount( member_id );

		if(totalCount > 10) {
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { 
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}//if
		}//if

		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);
		
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		
		List<MdDTO> list = null;
		list = service.wish_searchList( dto );
		System.out.println(list);
		model.addAttribute("list", list); 
		model.addAttribute("search_dto", dto);

		return "/member/member_wish_list";//jsp file name
	}
	
	@RequestMapping( value = "/member", method = RequestMethod.GET )
	private String myPage() {
		return "/member/member";//
	}

	@RequestMapping( value = "/nick_chk", method = RequestMethod.GET )
	public void nickCheck( String member_nick, PrintWriter out ) {
		int isYN = 0;
		isYN = service.nickCheck( member_nick );
		System.out.println(isYN);
		out.print(isYN);
		out.close();
	}//nickCheck
	
	@RequestMapping( value = "/pwd_chk", method = RequestMethod.GET )
	public void passwordCheck( PrintWriter out, MemberDTO dto) {
		int isYN = 0;
		isYN = service.passwordCheck( dto );
		System.out.println(isYN);
		out.print(isYN);
		out.close();
	}//passwordCheck
	
	@RequestMapping( value = "/member_detail", method = RequestMethod.GET )
	private String member_Detail( String member_email, Model model, HttpSession session, UpdateDTO dto ) {
		List<UpdateDTO> list = null;
		list = service.member_updateList(member_email);
		model.addAttribute("list", list);
		
		return "/member/member_detail";//
	}
	
	@RequestMapping( value = "/member_update_form", method = RequestMethod.GET )
	private String memberForm(HttpSession session, String member_email, Model model, UpdateDTO dto) {
		List<UpdateDTO> list = null;
		list = service.member_updateList(member_email);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + list);
		model.addAttribute("list", list);
		return "/member/member_update_form";//
	}
	
	@RequestMapping( value = "/member_update", method = RequestMethod.POST )
	public void memberUpdate( MemberDTO dto, PrintWriter out, HttpSession session) {
		logger.info(dto.toString());
		int successCount = 0;
		int successCount1 = 0;
		successCount = service.update( dto );
		successCount1 = service.update1( dto );//
		out.print(successCount);
		out.close();
		
	}//join
	
	
	@RequestMapping( value = "/member_before_detail", method = RequestMethod.GET )
	private String member_Before_Detail() {
		return "/member/member_before_detail";//
	}
	
	
	
	
}//class