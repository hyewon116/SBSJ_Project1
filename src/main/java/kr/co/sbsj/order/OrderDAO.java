package kr.co.sbsj.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.md.MdDTO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	public int updateDeliveryAddrUsedDate( OrderMainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.updateDeliveryAddrUsedDate", dto);
		return successCount;
	}//updateDeliveryAddrUsedDate

	public int updateCreditCardUsedDate( OrderMainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.updateCreditCardUsedDate", dto);
		return successCount;
	}//updateCreditCardUsedDate

	public int deleteCartByArray(String [] arr_cart_id) {
		int successCount = 0;
		successCount = sqlSession.delete("OrderMapper.deleteCartByArray", arr_cart_id);
		return successCount;
	}//deleteCartByArray

	public int insertBuyNowOrderDetail(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertBuyNowOrderDetail", dto);
		return successCount;
	}//insertOrderDetail

	public int insertOrderDetail(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertOrderDetail", dto);
		return successCount;
	}//insertOrderDetail

	public int insertOrderMain(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertOrderMain", dto);
		return successCount;
	}//insertOrderMain

	public List<MdDTO> buyNowOrderList(MdDTO dto) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("OrderMapper.buyNowOrderList", dto);
		return list;
	}//buyNowOrderList

	public List<MdDTO> orderList(String [] arr_cart_id) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("OrderMapper.orderList", arr_cart_id);
		return list;
	}//orderList

}//class
