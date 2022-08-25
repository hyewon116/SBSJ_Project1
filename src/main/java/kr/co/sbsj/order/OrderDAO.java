package kr.co.sbsj.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.cs.NoticeDTO;
import kr.co.sbsj.md.CouponDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	private List<Object> list;
	
	public int stockUpdate(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("OrderMapper.stockUpdate", dto);
		return successCount;
	}//stockUpdate

	public int updateDeliveryAddrUsedDate( OrderMainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.updateDeliveryAddrUsedDate", dto);
		return successCount;
	}//updateDeliveryAddrUsedDate


	public int deleteCartByArray(String [] arr_cart_id) {
		int successCount = 0;
		successCount = sqlSession.delete("OrderMapper.deleteCartByArray", arr_cart_id);
		return successCount;
	}//deleteCartByArray

	public int insertBuyNowOrderDetail(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertBuyNowOrderDetail", dto);
		return successCount;
	}//insertBuyNowOrderDetail

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


	public MemberDTO memberdto(String member_id) {
		MemberDTO memberdto = null;
		memberdto = sqlSession.selectOne("OrderMapper.getMemberDto", member_id);
		return memberdto;
	}


	public List<CouponDTO> couponList(CouponDTO coupondto) {
		List<CouponDTO> couponList = null;
		couponList = sqlSession.selectList("OrderMapper.couponList", coupondto);
		return couponList;
	}


	public int updateCoupon(CouponDTO dto) {
		int couponCount = 0;
		couponCount = sqlSession.selectOne("OrderMapper.updateCoupon", dto);
		return couponCount;
	}
	public List<OrderMainDTO> subList(OrderMainDTO dto) {
		List<OrderMainDTO> subList = null;
		subList = sqlSession.selectList("OrderMapper.subList", dto);
		return subList;
	}
	
	public int subInsert( OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.subInsert", dto);
		return successCount;
	}//subInsert

	public int subsYnUpdate(OrderMainDTO dto) {
		int subsYnCnt = 0;
		subsYnCnt = sqlSession.delete("OrderMapper.subsYnUpdate", dto);
		return subsYnCnt;
	}

}//class
