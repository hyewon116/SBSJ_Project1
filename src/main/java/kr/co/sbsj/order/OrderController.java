package kr.co.sbsj.order;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.sbsj.cart.CartController;
import kr.co.sbsj.delivery.DeliveryDTO;
import kr.co.sbsj.delivery.DeliveryService;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.member.MemberService;
import kr.co.sbsj.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/order" )
public class OrderController {

	private final static Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private OrderService service;

	@Autowired
	private DeliveryService deliveryService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping( value = "/paySuccess", method = RequestMethod.GET )
	public String paySuccess() {
		return "/order/paySuccess";
	}
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( OrderMainDTO dto, HttpSession session, PrintWriter out ) {
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
	}//insert

	@RequestMapping( value = "/order_list", method = RequestMethod.GET )
	public String orderList( String [] arr_cart_id, MdDTO dto, Model model, HttpSession session ) {
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


		return "/order/order_list";//jsp file name
	}//orderList

}//class

