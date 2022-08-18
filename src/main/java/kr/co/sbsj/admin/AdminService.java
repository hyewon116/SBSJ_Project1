package kr.co.sbsj.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.SearchDTO;




@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;

	
	
	public int fileDelete( AdminDTO dto ) {
		int successCount = 0;
		successCount = dao.fileDelete( dto );
		return successCount;
	}//fileDelete
	
	
	public int update( AdminDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update
	
	
	
	public AdminDTO detail( String md_id ) {
		AdminDTO dto = null;
		dto = dao.detail( md_id );
		return dto;
	}//detail
	
	
	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
	public List<MdDTO> searchList( SearchDTO dto ) {
		List<MdDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList
	
	public void delete(String no) {
		dao.delete(no);
	}
	
	public void offsale(String no) {
		dao.offsale(no);
	}
	public void onsale(String no) {
		dao.onsale(no);
	}
	
	
}//class
