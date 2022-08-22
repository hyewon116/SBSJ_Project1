package kr.co.sbsj.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.util.dto.MemberDTO;

@Service
public class DeliveryService {

	@Autowired
	private DeliveryDAO dao;

	public int delete( DeliveryDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public int insert( DeliveryDTO dto ) {
		int successCount = 0;
		successCount = dao.insert( dto );
		return successCount;
	}//insert

	public List<DeliveryDTO> list( String member_id ) {
		List<DeliveryDTO> list = null;
		list = dao.list( member_id );
		return list;
	}//list
	
}//class
