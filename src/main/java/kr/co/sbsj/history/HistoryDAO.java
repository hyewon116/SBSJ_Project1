package kr.co.sbsj.history;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.util.dto.SearchDTO;

@Repository
public class HistoryDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<HistoryDTO> payDetail(HistoryDTO dto) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("HistoryMapper.payDetail", dto);
		return list;
	}//payDetail

	public List<HistoryDTO> searchOrderList( SearchDTO dto ) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("HistoryMapper.searchOrderList", dto);
		return list;
	}//searchOrderList

	public int searchOrderListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("HistoryMapper.searchOrderListCount", dto);
		return totalCount;
	}//searchOrderListCount

}//class








