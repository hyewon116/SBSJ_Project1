package kr.co.sbsj.mdreview;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.util.dto.SearchDTO;


@Controller
@RequestMapping ( value = "/mdreview" )
public class MdReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(MdReviewController.class);
	
	@Autowired
	private MdReviewService service;
	
	
	//후기 삭제
	@RequestMapping ( value = "/delete", method = RequestMethod.GET) 
	public void delete( MdReviewDTO dto, String review_id, PrintWriter out, Model model, String md_id ) { 
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	
	}//delete
	
	
	//후기 수정
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( MdReviewDTO dto, PrintWriter out, Model model, String md_id ) throws IOException {
		dto.setReview_star(dto.getReview_star().substring(0, 1));
	
		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
		
	}//update
	
	//후기 수정 입력폼
	@RequestMapping( value = "/uform", method = RequestMethod.GET )
	public String updateForm( String review_id, Model model ) {
		MdReviewDTO dto = null;
		dto = service.detail( review_id ); //review_id에 맞는 디테일 정보를 가져와서 수정폼에 자동 입력
		model.addAttribute("detail_dto", dto);
		return "/mdreview/review_uform";//jsp file name
	}//updateForm
	
	
	//후기 상세보기
	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String review_id, Model model ) {
		MdReviewDTO dto = null;
		dto = service.detail( review_id );
		model.addAttribute("detail_dto", dto);
		model.addAttribute("review_id", review_id); //수정&삭제 때 보낼 review_id 정보
		return "/mdreview/review_detail";//jsp file name
	}//detail
	
	
	//후기 리스트
	@RequestMapping(value = "/review_list", method = RequestMethod.GET)
	public String review_list( Model model, String userWantPage, SearchDTO dto, String md_id ) {
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
		List<MdReviewDTO> list = null;
		list = service.pagingList( dto ); //md_id와 limitNum이 담긴 searchdto
		model.addAttribute("list", list);
		model.addAttribute("md_id", md_id ); //list에서 작성폼(review_write)으로 넘어갈 때 필요함. 
											//(위 list 객체에 담긴 md_id는 여러건이라서 인식 못하는듯?)
											//여기(list)올 때 받아왔던 md_id를 설정해야 함.

		return "/mdreview/review_list";//jsp file name
	}//review_list
	
	
	//후기 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert( MdReviewDTO dto, PrintWriter out, Model model, String md_id ) {
				
		System.out.println("확인용");
		System.out.println("==========" + md_id);
		dto.setReview_star(dto.getReview_star().substring(0, 1));
				
		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
			
	}//insert
	
	
	//후기 쓰기 (작성 폼으로 이동)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String review_write( String md_id, Model model ) {
		model.addAttribute( "md_id", md_id );
		System.out.println("========================" + md_id);
		return "/mdreview/review_write";//jsp file name
	}//review_write
	
	
	//교환&환불 멘트 
	@RequestMapping(value = "/exchange", method = RequestMethod.GET)
	public String exchange( ) {
		return "/mdreview/exchange";//jsp file name
	}//review_write
	
}


/*
CREATE TABLE `review` (
`review_id` int NOT NULL AUTO_INCREMENT,
`md_id` int NOT NULL,
`member_id` int NOT NULL,
`order_detail_id` int NOT NULL,
`review_title` varchar(100) NOT NULL,
`review_content` varchar(4000) NOT NULL,
`review_date` datetime NOT NULL,
`review_viewcnt` int NOT NULL DEFAULT 0,
review_star double NOT NULL DEFAULT 0,
member_nick varchar(100) NOT NULL,
PRIMARY KEY (`review_id`)
);
*/