package kr.co.sbsj.mdquestion;

import java.io.IOException;
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

import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;


@Controller
@RequestMapping ( value = "/mdquestion" )
public class MdquestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(MdquestionController.class);
	
	@Autowired
	private MdQuestionService service;
	
	//문의 삭제
	@RequestMapping ( value = "/delete", method = RequestMethod.GET) 
	public void delete( MdQuestionDTO dto, String md_question_id, PrintWriter out ) { 
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete
	
	//문의 수정
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( MdQuestionDTO dto, PrintWriter out ) throws IOException {
		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}//update
	
	//문의 수정 입력폼
	@RequestMapping( value = "/uform", method = RequestMethod.GET )
	public String updateForm( String md_question_id, Model model ) {
		MdQuestionDTO dto = null;
		dto = service.detail( md_question_id ); //md_question_id에 맞는 디테일 정보를 가져와서 수정폼에 자동 입력
		model.addAttribute("detail_dto", dto);
		return "/mdquestion/question_uform";//jsp file name
	}//updateForm
	
	//문의 상세보기
	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String md_question_id, Model model ) {
		MdQuestionDTO dto = null;
		dto = service.detail( md_question_id );//문의 상세
		model.addAttribute("detail_dto", dto);
		
		dto = service.replyDetail( md_question_id );//답변 상세
		model.addAttribute("reply_dto", dto);
		
		model.addAttribute("md_question_id", md_question_id);
		return "/mdquestion/question_detail";//jsp file name
	}//detail

	
	//상품문의 리스트
	@RequestMapping(value = "/question_list", method = RequestMethod.GET)
	public String question_list( Model model, String userWantPage, SearchDTO dto, String md_id) {
		
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

/*
 CREATE TABLE `md_question` (
        `md_question_id`        int        NOT NULL auto_increment,
        `md_id`        int        NOT NULL,
        `member_id`        int        NOT NULL,
        `md_question_title`        varchar(100) NOT NULL,
        `md_question_content` varchar(4000) NOT NULL,
        `md_question_date` datetime        NOT NULL,
        `md_question_answer` varchar(100) NOT NULL        DEFAULT '답변대기',
        `md_question_type`        varchar(100) NOT NULL DEFAULT '상품',
        `md_answer_id`        int,
        `md_answer_member`        varchar(20)        DEFAULT '관리자',
        `md_answer_content`        varchar(4000),
        `md_answer_date` datetime,
         member_nick varchar(100) NOT NULL,
         PRIMARY KEY (`md_question_id`)
);
*/
