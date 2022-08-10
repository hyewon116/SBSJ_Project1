package kr.co.sbsj.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.Naver_MemberDTO;

@Service
public class Naver_LoginService {
	
	@Autowired
	private Naver_LoginDAO dao;
	
	
	public int join( Naver_MemberDTO dto ) {
		int successCount = 0;
		successCount = dao.join( dto );
		return successCount;
	}//join
	
	public MemberDTO login( Naver_MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = dao.login( dto );
		return dtoFromDB;
	}//login
	
	
//	public Naver_LoginDAO login( Naver_LoginDAO dto ) {
//		Naver_LoginDAO dtoFromDB = null;
//		dtoFromDB = dao.login( dto );
//		return dtoFromDB;
//	}//login
}//class
