package kr.co.sbsj.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.Session;

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.UpdateDTO;


@Controller
@RequestMapping( value = "/member" )
public class MemberController {
	
	
	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
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