package kr.co.sbsj.order;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.sbsj.delivery.DeliveryDTO;
import kr.co.sbsj.delivery.DeliveryService;
import kr.co.sbsj.md.CouponDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/order" )
public class OrderController {


	@Autowired
	private OrderService service;

	@Autowired
	private DeliveryService deliveryService;

	@RequestMapping( value = "/paySuccess", method = RequestMethod.GET )
	public String paySuccess() {
		return "/order/paySuccess";
	}
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( OrderMainDTO dto, HttpSession session, PrintWriter out, CouponDTO coupondto ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		String [] tmpArr = dto.getStr_cart_id().split(",");
		dto.setArr_cart_id(tmpArr);

		int successCount = 0;
		if(dto.getArr_cart_id().length == 1 && dto.getArr_cart_id()[0].equals("0")) {
			//arr_cart_id의 길이가 1이고, arr_cart_id의 [0]번지의 값이 "0"이면, 장바구니 테이블에 데이터가 없는 바로 주문이다.
			successCount = service.insert(dto, 1);
		} else {
			successCount = service.insert(dto, 0);
		}
		out.print(successCount);
		out.close();
		
		if ( successCount >= 1 ) { //주문시 md 재고 수정 쿼리
			int stockCount = 0;
			stockCount = service.stockUpdate(dto);
			out.print(stockCount);
			out.close();
		}
		
		//결제 완료시 쿠폰사용 여부 Y로 변경
		int couponCount = 0;
		coupondto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		couponCount = service.updateCoupon(coupondto);
		out.print(couponCount);
		out.close();
	}//insert

	@RequestMapping( value = "/order_list", method = RequestMethod.GET )
	public String orderList( String [] arr_cart_id, MdDTO dto, Model model, HttpSession session, CouponDTO coupondto ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		
		List<MdDTO> list = null;
		if(arr_cart_id != null && arr_cart_id.length > 0) {//장바구니 -> 주문 목록
			list = service.orderList( arr_cart_id );
		} else {//상품 상세 화면 바로구매버튼 -> 주문 목록
			list = service.buyNowOrderList( dto );
			arr_cart_id = new String[1];
			arr_cart_id[0] = "0";
		}
		model.addAttribute("list", list);

		List<DeliveryDTO> deliverylist = null;
		deliverylist = deliveryService.list( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		model.addAttribute("deliverylist", deliverylist);

		model.addAttribute( "arr_cart_id", new Gson().toJson( arr_cart_id ) );

		MemberDTO memberdto = null;
		String member_id = ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() ;
		memberdto = service.memberdto(member_id);
		model.addAttribute("memberdto", memberdto);

		//쿠폰 리스트
		List<CouponDTO> couponList = null;
		coupondto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		couponList = service.couponList(coupondto);
		model.addAttribute("couponList", couponList);
		return "/order/order_list";//jsp file name
		
	}//orderList
	
	@RequestMapping( value = "/sub_order", method = RequestMethod.GET )
	public String subList(  OrderMainDTO dto, Model model, HttpSession session ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		
		List<OrderMainDTO> subList = null;
		subList = service.subList(dto);
		model.addAttribute("subList", subList);
		

		return "/order/sub_order";//jsp file name
		
	}//orderList
}//class

