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

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;


@Controller
@RequestMapping( value = "/member" )
public class MemberController {
	
	
	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;

	
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
	public void passwordCheck( PrintWriter out, MemberDTO dto, HttpSession session ) {
		int isYN = 0;
		isYN = service.passwordCheck( dto );
		System.out.println(isYN);
		out.print(isYN);
		out.close();
	}//passwordCheck
	
	@RequestMapping( value = "/member_detail", method = RequestMethod.GET )
	private String member_Detail() {
		return "/member/member_detail";//
	}
	
	@RequestMapping( value = "/member_update_form", method = RequestMethod.GET )
	private String memberForm() {
		return "/member/member_update_form";//
	}
	
	@RequestMapping( value = "/member_update", method = RequestMethod.POST )
	public void memberUpdate( MemberDTO dto, PrintWriter out, UpdateDTO udto, HttpSession session) {
		
		logger.info(dto.toString());
		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		
		udto = service.udto( dto );// 개인정보 update 후 변경된 회원정보로 login_info session 재생성
		session.setAttribute("login_info", udto);
		out.close();
	}//join
	
	
	@RequestMapping( value = "/member_before_detail", method = RequestMethod.GET )
	private String member_Before_Detail() {
		return "/member/member_before_detail";//
	}
	
	
	
	
}//class