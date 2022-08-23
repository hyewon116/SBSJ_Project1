package kr.co.sbsj.cs;

import java.io.PrintWriter;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.admin.AdminController;
import kr.co.sbsj.util.dto.SearchDTO;


@Controller
@RequestMapping( value = "/qna" )
public class QnaController {
	
	private final static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private QnaService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping( value = "/replyInsert", method = RequestMethod.POST )
	public void replyInsert( QnaDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.replyInsert(dto);
		out.print(successCount);
		out.close();
		
		 //답변 내역 이메일 전송
	      String setFrom = "parkhyewon19@gmail.com"; //보내는 사람  이메일 주소
	      String toMail = dto.getMember_email(); //받는 사람 이메일 주소
	      String mailTitle = "[상부상주] 1:1 문의에 대한 답변이 등록되었습니다."; // 메일 제목
	      String contents = dto.getMember_nick() + "님의 1:1 문의에 대한 답변이 등록되었습니다. \n---------------------------------- \n" 
	                    + "문의 제목 : " + dto.getQa_question_title() + "\n\n"
	                    + "상부상주 바로가기 >> http://localhost:8081/sbsj";
	      try {
	         MimeMessage message= mailSender.createMimeMessage(); //message를 보냄
	         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	         
	         
	         messageHelper.setFrom(setFrom);
	         messageHelper.setTo(toMail);
	         messageHelper.setSubject(mailTitle);
	         messageHelper.setText(contents);
	   
	         mailSender.send(message);
	         
	      }
	      
	      catch (MessagingException e) {
	         logger.info("메일 전송 에러 start ==========");
	         e.printStackTrace();
	         logger.info("메일 전송 에러 end ==========");
	      }
	      
	}//update

	@RequestMapping( value = "/rform", method = RequestMethod.GET )
	public String rform (String qa_question_id, Model model) {
		QnaDTO dto = null;
		dto = service.detail(qa_question_id);//qa_question_id에 맞는 디테일 정보를 가져와서 수정폼에 자동 입력
		model.addAttribute("detail_dto", dto);
		return "/cs/qna_replyform";
	}//rform
	
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update (QnaDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.update(dto);
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping( value = "/uform", method = RequestMethod.GET )
	public String uform (String qa_question_id, Model model) {
		QnaDTO dto = null;
		dto = service.detail(qa_question_id);//qa_question_id에 맞는 디테일 정보를 가져와서 수정폼에 자동 입력
		model.addAttribute("detail_dto", dto);
		return "/cs/qna_uform";
	}//uform
	
	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete (QnaDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.delete(dto);
		out.print(successCount);
		out.close();
	}//delete
	
	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String qa_question_id, Model model ) {
		QnaDTO dto = null;
		dto = service.detail( qa_question_id );
		model.addAttribute("detail_dto", dto);
		return "/cs/qna_detail";//jsp file name
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
		
		
		List<QnaDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/cs/qna_list";//jsp file name
	}//list
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void write( QnaDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.write( dto );
		out.print(successCount);
		out.close();
	}//write
	
	@RequestMapping( value = "/write_form", method = RequestMethod.GET )
	public String writeForm() {
		return "/cs/qna_write";//jsp file name
	}//writeForm
	
	
}
