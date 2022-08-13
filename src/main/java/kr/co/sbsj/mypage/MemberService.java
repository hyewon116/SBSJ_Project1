package kr.co.sbsj.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.Naver_MemberDTO;
import kr.co.sbsj.util.dto.UpdateDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	
	
	public int update( MemberDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//join
	
	public UpdateDTO udto ( MemberDTO dto ) {
		UpdateDTO udto = null;
		udto = dao.udto( dto );
		return udto;
	}//login
	
	
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
	
}//class
