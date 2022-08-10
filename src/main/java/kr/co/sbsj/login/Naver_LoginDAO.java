package kr.co.sbsj.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.Naver_MemberDTO;


@Repository
public class Naver_LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int join( Naver_MemberDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("JoinMapper.naver_join", dto);
		return successCount;
	}//join

	
	public MemberDTO login( Naver_MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = sqlSession.selectOne("LoginMapper.naver_login", dto);
		return dtoFromDB;
	}//login
	
	
}//class
