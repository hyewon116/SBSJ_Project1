package kr.co.sbsj.join;

import java.io.PrintWriter;

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

	@RequestMapping( value = "/form", method = RequestMethod.GET )
	public String joinForm() {
		return "/join/join_form";//jsp file name
	}//joinForm

}//class

/*

drop table member;
CREATE TABLE `member` (
  `mno` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `mpwd` varchar(20) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mdate` datetime NOT NULL,
  `service_agree` varchar(5) NOT NULL DEFAULT 'true',
  `info_agree` varchar(5) NOT NULL DEFAULT 'true',
  `sms_agree` varchar(5) NOT NULL DEFAULT 'false',
  `email_agree` varchar(5) NOT NULL DEFAULT 'false',
  `post_code` varchar(10) DEFAULT NULL,
  `addr1` varchar(150) DEFAULT NULL,
  `addr2` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`mno`)
);

insert into member(mid, mpwd, tel, email, mdate)
values('tea', '1111', '010-9999-8888', 'aaa@bbb.com', now());
commit;

*/
