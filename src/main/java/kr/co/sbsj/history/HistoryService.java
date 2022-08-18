package kr.co.sbsj.history;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.SearchDTO;

@Service
public class HistoryService {

	@Autowired
	private HistoryDAO dao;

	public List<HistoryDTO> payDetail(HistoryDTO dto) {
		List<HistoryDTO> list = null;
		list = dao.payDetail( dto );
		return list;
	}//payDetail

	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = dao.searchOrderList( dto );
		return list;
	}//searchOrderList

	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchOrderListCount( dto );
		return totalCount;
	}//searchOrderListCount

}//class






