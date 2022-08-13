package kr.co.sbsj.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.Naver_MemberDTO;
import kr.co.sbsj.util.dto.UpdateDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int update( MemberDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("MemberMapper.member_update", dto);
		return successCount;
	}
	
	public UpdateDTO udto( MemberDTO dto ) {
		UpdateDTO udto = null;
		udto = sqlSession.selectOne("MemberMapper.update_dto", dto);
		return udto;
	}//login
	
	
	public int passwordCheck( MemberDTO dto ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.passwordCheck", dto );
		return isYN;
	}
	
	public int nickCheck( String member_nick ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.nickCheck", member_nick );
		return isYN;
	}
	public int emailCheck( String member_email ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.emailCheck", member_email );
		return isYN;
	}
	public int phoneCheck( String member_phone ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MemberMapper.phoneCheck", member_phone );
		return isYN;
	}



	
}//JoinDAO
