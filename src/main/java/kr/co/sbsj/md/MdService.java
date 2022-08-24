package kr.co.sbsj.md;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.SearchDTO;

@Service
public class MdService {
	
	@Autowired
	private MdDAO dao;
	
	public int coupon_insert( CouponDTO dto ) {
		int successCount = 0;
		successCount = dao.coupon_insert( dto );
		return successCount;
	}//coupon_insert

	public int couponCheck (CouponDTO dto) {
		int isYN = 0;
		isYN = dao.couponCheck( dto );
		return isYN;
	}//couponCheck
	
	
	public MdDTO detail( String md_id ) {
		MdDTO dto = null;
		dto = dao.detail( md_id );
		return dto;
	}//detail
	
	public List<MdDTO> searchList2( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = dao.searchList2( dto );
		return list;
	}//list - 필터링

	public int searchListCount2( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount2( dto );
		return totalCount;
	}//list - 필터링
	
	public List<MdDTO> searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList
	
	public List<MdDTO> bestList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = dao.bestList( dto );
		return list;
	}//bestList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
	public int bestListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.bestListCount( dto );
		return totalCount;
	}//bestListCount
	
	public int insert( MdDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

	public int wish_insert( SearchDTO dto ) {
		int successCount = 0;
		successCount = dao.wish_insert( dto );
		return successCount;
	}//wish_insert

	public int wishCheck(SearchDTO dto) {
		int isYN = 0;
		isYN = dao.wishCheck( dto );
		return isYN;
	}//wishCheck

}
