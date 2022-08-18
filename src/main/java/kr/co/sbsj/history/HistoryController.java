package kr.co.sbsj.history;

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

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;

@Controller
@RequestMapping(value = "/history")
public class HistoryController {

	private static final Logger logger = LoggerFactory.getLogger(HistoryController.class);

	@Autowired
	private HistoryService service;

	@RequestMapping(value = "/pay_detail", method = RequestMethod.GET)
	public void payDetail( HistoryDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		List<HistoryDTO> list = null;
		list = service.payDetail( dto );
		out.print( new Gson().toJson( list ) );
		out.close();
	}//payDetail

	@RequestMapping(value = "/my_order_list", method = RequestMethod.GET)
	public String oderList( Model model, String userWantPage, SearchDTO dto, HttpSession session ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchOrderListCount( dto );

		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
			//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;// 11 - 10 -> 1
				endPageNum = endPageNum - 10;// 20 - 10 -> 10
			}//if
		}//if

		//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		// 1 -> (1-1)*10 -> 0
		// 2 -> (2-1)*10 -> 10
		// 3 -> (3-1)*10 -> 20

		List<HistoryDTO> list = null;
		list = service.searchOrderList( dto );

		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);

		return "history/my_order_list";//jsp file name

	}//oderList

}//class
