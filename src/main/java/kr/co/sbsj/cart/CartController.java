package kr.co.sbsj.cart;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/cart" )
public class CartController {

	private final static Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService service;
	
	//찜 목록에서 장바구니 담기
	@RequestMapping( value = "/wish_insert", method = RequestMethod.POST )
	public void wish_insert( MdDTO dto, HttpSession session, PrintWriter out, HttpServletRequest request ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.wish_insert(ajaxMsg[i]);
		}
	}//wish_insert

	@RequestMapping( value = "/update_buy_qty", method = RequestMethod.GET )
	public void updateBuyQty( MdDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		int successCount = 0;
		successCount = service.updateBuyQty( dto );
		out.print(successCount);
		out.close();
	}//updateBuyQty

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( MdDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete

	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String list( Model model, HttpSession session ) {
		String member_id = ( (MemberDTO) session.getAttribute("login_info") ).getMember_id();

		List<MdDTO> list = null;
		list = service.list( member_id );
		model.addAttribute("list", list);
		return "/cart/list";//jsp file name
	}//list

	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( MdDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert

}//class

