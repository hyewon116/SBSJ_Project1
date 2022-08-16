package kr.co.sbsj.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.MemberDTO;

@Repository
public class JoinDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int join( MemberDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("JoinMapper.join", dto);
		return successCount;
	}
	
	
	public int passwordCheck( MemberDTO dto ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("JoinMapper.passwordCheck", dto );
		return isYN;
	}
	
	public int nickCheck( String member_nick ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("JoinMapper.nickCheck", member_nick );
		return isYN;
	}
	
	
	public int emailCheck( String member_email ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("JoinMapper.emailCheck", member_email );
		return isYN;
	}
	public int phoneCheck( String member_phone ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("JoinMapper.phoneCheck", member_phone );
		return isYN;
	}



	
}//JoinDAO
