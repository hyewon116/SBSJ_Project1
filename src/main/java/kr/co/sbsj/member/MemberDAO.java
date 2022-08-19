package kr.co.sbsj.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.Naver_MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	public void wish_delete( String no ) {
		sqlSession.delete("MemberMapper.wish_delete", no);
	}//wish_delete
	
	public List<MdDTO> wish_searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = sqlSession.selectList( "MemberMapper.wish_selectList", dto );
		return list;
	}//wish_searchList

	public int wish_searchListCount( String member_id ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne( "MemberMapper.wish_searchListCount", member_id );
		return totalCount;
	}//wish_searchListCount

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
