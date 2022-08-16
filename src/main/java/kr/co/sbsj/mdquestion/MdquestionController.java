package kr.co.sbsj.mdquestion;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.SearchDTO;


@Controller
@RequestMapping ( value = "/mdquestion" )
public class MdquestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(MdquestionController.class);
	
	@Autowired
	private MdQuestionService service;
	
	//상품문의 리스트
	@RequestMapping(value = "/question_list", method = RequestMethod.GET)
	public String question_list( Model model, String userWantPage, SearchDTO dto, String md_id ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.totalListCount( dto );
		
		if( totalCount > 10 ) {
			lastPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 ); 
		}
		if(userWantPage.length() >= 2) {
			String frontNum = userWantPage.substring(0, userWantPage.length()-1); 
			startPageNum = Integer.parseInt(frontNum) * 10 + 1; 
			endPageNum = (Integer.parseInt(frontNum) + 1) * 10; 
			
			String backNum = userWantPage.substring(userWantPage.length()-1, userWantPage.length()); 
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}
		}
		
		if(endPageNum > lastPageNum) {
			endPageNum = lastPageNum;
		}
		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("userWantPage", userWantPage);
		model.addAttribute("lastPageNum", lastPageNum);
	
		int limitNum = ( Integer.parseInt(userWantPage) -1 ) * 10;
		List<MdQuestionDTO> list = null;
		list = service.pagingList( dto ); //md_id와 limitNum이 담긴 searchdto
		model.addAttribute("list", list);
		model.addAttribute("md_id", md_id );
		
		//logger.info(list.toString());

		return "/mdquestion/question_list";//jsp file name
	}//question_list
	
	
	//문의 등록
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( MdQuestionDTO dto, PrintWriter out, Model model ) {
					
		System.out.println("확인용");
					
		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	
	//문의 쓰기 
	@RequestMapping( value = "/write", method = RequestMethod.GET )
	public String question_write( String md_id, Model model ) {
		model.addAttribute( "md_id", md_id );
		return "/mdquestion/question_write";//jsp file name
	}//question_write
}
