package kr.co.sbsj.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.MemberDTO;

@Service
public class JoinService {

	@Autowired
	private JoinDAO dao;

	public int join( MemberDTO dto ) {
		int successCount = 0;
		successCount = dao.join( dto );
		return successCount;
	}//join

	
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
