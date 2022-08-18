package kr.co.sbsj.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.sbsj.md.MdDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;

	@Transactional
	public int insert( OrderMainDTO dto, int buyNowYN ) {
		int successCount = 0;
		successCount = dao.insertOrderMain(dto);//insertOrderMain을 호출하는 시점에서는 dto에 order_no 값이 없다.
		//insertOrderMain을 수행하면서 selectKey가 dto에 order_no 값을 입력한다.
		if(successCount < 1) return successCount;

		if(buyNowYN == 0) {
			successCount = dao.insertOrderDetail(dto);//insertOrderDetail을 호출하는 시점에서는 dto에 order_no 값이 있다.
			if(successCount < 1) return successCount;

			successCount = dao.deleteCartByArray(dto.getArr_cart_id());
		} else if(buyNowYN == 1) {//장바구니 테이블에 데이터가 없는 바로 주문
			successCount = dao.insertBuyNowOrderDetail(dto);
		}
		if(successCount < 1) return successCount;

		successCount = dao.updateDeliveryAddrUsedDate(dto);
		if(successCount < 1) return successCount;

		return successCount;
	}//insert

	public List<MdDTO> buyNowOrderList(MdDTO dto) {
		List<MdDTO> list = null;
		list = dao.buyNowOrderList(dto);
		return list;
	}//buyNowOrderList

	public List<MdDTO> orderList(String [] arr_cart_id) {
		List<MdDTO> list = null;
		list = dao.orderList(arr_cart_id);
		return list;
	}//orderList

}//class
