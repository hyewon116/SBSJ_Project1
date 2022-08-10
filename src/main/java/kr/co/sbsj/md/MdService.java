package kr.co.sbsj.md;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.SearchDTO;

@Service
public class MdService {
	
	@Autowired
	private MdDAO dao;
	
	public MdDTO detail( String md_id ) {
		MdDTO dto = null;
		dto = dao.detail( md_id );
		return dto;
	}//detail
	
	public List<MdDTO> searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
	public int insert( MdDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

}
