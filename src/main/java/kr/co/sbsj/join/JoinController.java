package kr.co.sbsj.join;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/join" )
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	private JoinService service;

	@RequestMapping( value = "/", method = RequestMethod.POST )
	public void join( MemberDTO dto, PrintWriter out ) {
		logger.info(dto.toString());
		int successCount = 0;
		successCount = service.join( dto );
		out.print(successCount);
		out.close();
	}//join
	
	
	@RequestMapping( value = "/join", method = RequestMethod.GET )
	public String join() {
		return "/join/join";//jsp file name
	}//joinForm

	@RequestMapping( value = "/pwd_chk", method = RequestMethod.GET )
	public void passwordCheck( PrintWriter out, MemberDTO dto ) {
		int isYN = 0;
		isYN = service.passwordCheck( dto );
		System.out.println(isYN);
		out.print(isYN);
		out.close();
	}//passwordCheck
	
	@RequestMapping( value = "/nick_chk", method = RequestMethod.GET )
	public void nickCheck( String member_nick, PrintWriter out ) {
		int isYN = 0;
		isYN = service.nickCheck( member_nick );
		System.out.println(isYN);
		out.print(isYN);
		out.close();
	}//nickCheck
	
	
	@RequestMapping( value = "/email_chk", method = RequestMethod.GET )
	public void emailCheck( String member_email, PrintWriter out ) {
		int isYN = 0;
		isYN = service.emailCheck( member_email );
		System.out.println(isYN);
		out.print(isYN);
		out.close();
	}//emailCheck
	
	@RequestMapping( value = "/phone_chk", method = RequestMethod.GET )
	public void phoneCheck( String member_phone, PrintWriter out ) {
		int isYN = 0;
		isYN = service.phoneCheck( member_phone );
		System.out.println(isYN);
		out.print(isYN);
		out.close();
	}//phone_chk


}//class
