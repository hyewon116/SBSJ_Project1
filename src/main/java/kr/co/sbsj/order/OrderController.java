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
import kr.co.sbsj.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/order" )
public class OrderController {

	private final static Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private OrderService service;

	@Autowired
	private DeliveryService deliveryService;

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

		return "/order/order_list";//jsp file name
	}//orderList

}//class

/*
drop table order_main;

create table order_main (
  order_id int idt null auto_increment,
  mid int idt null,
  card_id int idt null,
  addr_id int idt null,
  order_product_cnt int idt null,
  order_amt int idt null,
  discount_amt int default null,
  pay_amt int idt null,
  order_date datetime idt null,
  order_status int default '3',
  primary key (order_id)
);

 -- order_id -- 주문번호
 -- mid -- 멤버번호
 -- card_id -- 카드번호
 -- addr_id -- 배송지번호
 -- order_product_cnt -- 주문상품수
 -- order_amt -- 주문금액
 -- discount_amt -- 할인금액
 -- pay_amt -- 결제금액
 -- order_date -- 주문일자
 -- order_status -- 주문상태
 -- 주문상태(1:주문완료, 3:결제완료, 5:판매자확인완료, 7:운송장정보입력완료, 9:택배사인수완료, 11:택배사배송완료, 13:구매자구매확정완료, 15:자동구매결정완료)
 -- 결제사 및 택배사 연동이 없으므로, (3:결제완료, 5:판매자확인완료, 7:운송장정보입력완료, 13:구매자구매확정완료, 15:자동구매결정완료)만 구현한다.

drop table order_detail;

create table order_detail (
  detail_id int idt null auto_increment,
  order_id int idt null,
  prdt_id int idt null,
  detail_qty int idt null,
  detail_price int idt null,
  detail_amt int idt null,
  detail_discount int default null,
  detail_discount_amt int idt null,
  detail_pay_amt int idt null,
  primary key (detail_id)
);

 -- detail_id -- 주문상세번호
 -- order_id -- 주문번호
 -- prod_id -- 상품번호
 -- detail_qty -- 주문수량
 -- detail_price -- 판매단가
 -- detail_amt -- 주문금액 (주문수량 * 판매단가)
 -- detail_discount -- 할인율
 -- detail_discount_amt -- 할인금액
 -- detail_pay_amt -- 결제금액

drop table common_code;

create table common_code (
  code_id int idt null,
  code_class varchar(30) idt null,
  code_name varchar(60) idt null
);

insert into common_code (code_id, code_class, code_name)
values (1, 'order_status', '주문완료')
, (3, 'order_status', '결제완료')
, (5, 'order_status', '판매자확인완료')
, (7, 'order_status', '운송장정보입력완료')
, (9, 'order_status', '택배사인수완료')
, (11, 'order_status', '택배사배송완료')
, (13, 'order_status', '구매자구매확정완료')
, (15, 'order_status', '자동구매결정완료');
*/
