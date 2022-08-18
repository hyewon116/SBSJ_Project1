package kr.co.sbsj.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sbsj.md.MdDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO dao;

	public int updateBuyQty( MdDTO dto ) {
		int successCount = 0;
		successCount = dao.updateBuyQty( dto );
		return successCount;
	}//updateBuyQty

	public int delete( MdDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public List<MdDTO> list(String member_id) {
		List<MdDTO> list = null;
		list = dao.list(member_id);
		return list;
	}//list

	public int insert( MdDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

}//class
