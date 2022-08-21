package kr.co.sbsj.cs;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.util.dto.SearchDTO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update (NoticeDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.update(dto);
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping( value = "/uform", method = RequestMethod.GET )
	public String uform (String notice_id, Model model) {
		NoticeDTO dto = null;
		dto = service.detail(notice_id);//notice_id에 맞는 디테일 정보를 가져와서 수정폼에 자동 입력
		model.addAttribute("detail_dto", dto);
		return "/cs/notice_uform";
	}//uform
	
	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete (NoticeDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.delete(dto);
		out.print(successCount);
		out.close();
	}//delete
	
	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String notice_id, Model model ) {
		NoticeDTO dto = null;
		dto = service.detail( notice_id );
		model.addAttribute("detail_dto", dto);
		return "/cs/notice_detail";//jsp file name
	}//detail
	
	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String list(Model model, String userWantPage, SearchDTO dto) {
		if(userWantPage == null || userWantPage.equals("")) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount(dto);
		
		if(totalCount > 10) {
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if
		
		if(userWantPage.length() >= 2) { 
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}//if
		}//if

		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		
		List<NoticeDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/cs/notice_list";//jsp file name
	}//writeForm
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void write( NoticeDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.write( dto );
		out.print(successCount);
		out.close();
	}//write
	
	@RequestMapping(value = "/write_form", method = RequestMethod.GET)
	public String writeForm() {
		return "/cs/notice_write";
	}//writeForm
	
}
