package kr.co.sbsj.md;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.SearchDTO;

@Repository
public class MdDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int coupon_insert( CouponDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("MdMapper.coupon_insert", dto);
		return successCount;
	}//coupon_insert

	public int couponCheck( CouponDTO dto) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MdMapper.couponCheck", dto );
		return isYN;
	}//couponCheck

	public MdDTO detail( String md_id ) {
		MdDTO dto = null;
		dto = sqlSession.selectOne("MdMapper.detail", md_id);
		return dto;
	}//detail
	
	public List<MdDTO> searchList2( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("MdMapper.selectList2", dto);
		return list;
	}//list - 필터링

	public int searchListCount2( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MdMapper.searchListCount2", dto);
		return totalCount;
	}//list - 필터링
	
	
	public List<MdDTO> searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("MdMapper.selectList", dto);
		return list;
	}//searchList
	
	public List<MdDTO> bestList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("MdMapper.bestList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MdMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	public int bestListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MdMapper.bestListCount", dto);
		return totalCount;
	}//bestListCount
	
	public int insert( MdDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("MdMapper.insert", dto);
		return successCount;
	}//insert

	public int wish_insert( SearchDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("MdMapper.wish_insert", dto);
		return successCount;
	}//wish_insert

	public int wishCheck(SearchDTO dto) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MdMapper.wishCheck", dto );
		return isYN;
	}//wishCheck

}
