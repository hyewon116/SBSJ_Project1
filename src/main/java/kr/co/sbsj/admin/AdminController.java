package kr.co.sbsj.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.mdquestion.MdQuestionDTO;
import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.SearchDTO;
import kr.co.sbsj.util.dto.UpdateDTO;
import kr.co.sbsj.admin.AdminReviewDTO;
import kr.co.sbsj.cs.NoticeDTO;
import kr.co.sbsj.cs.NoticeService;
import kr.co.sbsj.history.HistoryDTO;





@Controller
@RequestMapping( value = "/admin" )
public class AdminController {
	
	
	private final static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
	@Autowired
	   private NoticeService Notice_service;
	
	
	//문의 답변 등록
	@RequestMapping( value = "/questionReply", method = RequestMethod.POST )
	public void replyInsert( MdQuestionDTO dto, PrintWriter out, Model model ) {				
		int successCount = 0;
		int changeCount = 0;
		successCount = service.replyInsert(dto);
		if (successCount >= 1) {
			changeCount = service.stateChange(dto); //md_question 테이블 답변대기->답변완료 변경 쿼리
		}
		out.print(successCount);
		out.close();
	}//replyInsert
	
	
	@RequestMapping( value = "/question_on")
	private String questionOn(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.questionOn(ajaxMsg[i]);
		}
		
		return "/admin/admin_question_list";//
	}//reviewOn
	
	@RequestMapping( value = "/question_off")
	private String questionOff(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.questionOff(ajaxMsg[i]);
		}
		
		return "/admin/admin_question_list";//
	}//reviewOn
	
	
	//문의 삭제
	@RequestMapping( value = "/question_delete")
	private String questionDelete(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.questionDelete(ajaxMsg[i]);
		}
		
		return "/admin/admin_question_list";
	}//question_delete
	
	
	//문의 상세 보기
	@RequestMapping( value = "/question_detail", method = RequestMethod.GET )
	public String questionDetail( String md_question_id, Model model, MemberDTO mdto ) {
		MdQuestionDTO dto = null;
		dto = service.questionDetail( md_question_id );//문의 상세
		model.addAttribute("detail_dto", dto);
		
		dto = service.replyDetail( md_question_id );//답변 상세
		model.addAttribute("reply_dto", dto);
		model.addAttribute("md_question_id", md_question_id); 
		return "admin/admin_question_detail";//jsp file name
	}//question_detail
	
	
	//상품 문의 관리 (리스트)
	@RequestMapping( value = "/admin_question_list", method = RequestMethod.GET )
	public String questionList( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchQuestionCount( dto );

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

		List<MdQuestionDTO> list = null;
		list = service.searchQuestion( dto );
		System.out.println("===========================================================");
		System.out.println(list.toString());
		System.out.println("===========================================================");
		model.addAttribute("list", list); 
		model.addAttribute("search_dto", dto);
		 
		return "/admin/admin_question_list";//jsp file name
	}//admin_question_list
	
	
	@RequestMapping( value = "/review_on")
	private String reviewOn(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.reviewOn(ajaxMsg[i]);
		}
		
		return "/admin/admin_review_list";//
	}//reviewOn
	
	@RequestMapping( value = "/review_off")
	private String reviewOff(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.reviewOff(ajaxMsg[i]);
		}
		
		return "/admin/admin_review_list";//
	}//review_off
	
	
	@RequestMapping( value = "/review_delete")//리뷰 삭제
	private String reviewDelete(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.reviewDelete(ajaxMsg[i]);
		}
		
		return "/admin/admin_review_list";
	}//review_delete
	
	
	// 리뷰리스트에서의 검색
	@RequestMapping( value = "/admin_review_list", method = RequestMethod.GET )
	public String reViewList( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchReviewCount( dto );
		//System.out.println("상품의 총개수는 : ?" + totalCount);

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

		List<AdminReviewDTO> list = null;
		list = service.searchReview( dto );
		System.out.println("===========================================================");
		System.out.println(list.toString());
		System.out.println("===========================================================");
		model.addAttribute("list", list); 
		model.addAttribute("search_dto", dto);
		 
		return "/admin/admin_review_list";//jsp file name
	}//admin_review_list
	
	
	@RequestMapping(value = "/admin_order_list", method = RequestMethod.GET)
	public String oderList( Model model, String userWantPage, SearchDTO dto, HttpSession session, String member_id ) {
		dto.setMember_id( member_id );

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

		return "admin/admin_order_list";//jsp file name

	}//oderList
	
	@RequestMapping( value = "/admin_order_detail", method = RequestMethod.GET )
	   private String admin_order_Detail(  Model model, HttpSession session, HistoryDTO dto ) {
	      List<HistoryDTO> list = null;
	      list = service.orderDetail(dto);
	      model.addAttribute("list", list);
	      
	      return "/admin/admin_order_detail";//
	   }
	
	@RequestMapping( value = "/admin_member_detail", method = RequestMethod.GET )
	private String admin_member_Detail( String member_email, Model model, HttpSession session, MemberDTO dto ) {
		System.out.println(member_email);
		List<MemberDTO> list = null;
		list = service.admin_member_updateList(member_email);
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "/admin/admin_member_detail";//
	}

	@RequestMapping( value = "/admin_member_list", method = RequestMethod.GET )
	public String memberList( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchMemberCount( dto );
		//System.out.println("상품의 총개수는 : ?" + totalCount);

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

		List<AdminDTO> list = null;
		list = service.selectMemberList( dto );
		model.addAttribute("list", list); 
		model.addAttribute("search_dto", dto);
		 
		return "/admin/admin_member_list";//jsp file name
	}//admin_member_list
	
	
	
	
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( AdminDTO dto, HttpSession session, PrintWriter out ) throws IOException {

		System.out.println("확인용");
		System.out.println(dto);
		System.out.println("확인용");
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		//String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();
		File newFolder = new File("C:/upload/md/" + todayNalja + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		

		InputStream is = null;
		FileOutputStream fos = null;

		System.out.println(111);

		MultipartFile thumbnail = dto.getMd_thumbnail();
		if(thumbnail != null && !thumbnail.getOriginalFilename().equals("")) {
		is = thumbnail.getInputStream();
		fos = new FileOutputStream("C:/upload/md/" + todaySigan + "_" + thumbnail.getOriginalFilename());
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setMd_thumbnail_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
		dto.setMd_thumbnail_path("/upload/md/" + todaySigan + "_" + thumbnail.getOriginalFilename());

		}


		MultipartFile detail_img = dto.getMd_detail_image();
		if(detail_img != null && !detail_img.getOriginalFilename().equals("")) {
			is = detail_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/md/" + todayNalja + "_" + todaySigan + "_" + detail_img.getOriginalFilename());
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setMd_detail_name(todayNalja + "_" + todaySigan + "_" + detail_img.getOriginalFilename());
			dto.setMd_detail_path("/upload/md/" + todayNalja + "_" + todaySigan + "_" + detail_img.getOriginalFilename());
		}


		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		System.out.println("=============================================================" + dto);
		int successCount = 0;
		successCount = service.update(dto);

		out.print(successCount);
		out.close();
	}//update
	
	
	@RequestMapping( value = "/file/delete", method = RequestMethod.GET )
	public void fileDelete( String id, String path, AdminDTO dto, HttpSession session, PrintWriter out ) {
		File file = new File("C:" + path);
		file.delete();

		if(id.equals("thumbnail_btn")) {
			dto.setMd_thumbnail_name( path.substring(path.lastIndexOf("/") + 1) );
			dto.setMd_thumbnail_path(path);
		} else if(id.equals("md_detail_btn")) {
			dto.setMd_detail_name( path.substring(path.lastIndexOf("/") + 1) );
			dto.setMd_detail_path(path);
		}

		//dto.setMd_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		int successCount = 0;
		successCount = service.fileDelete( dto );
		out.print(successCount);
		out.close();
	}//fileDelete	
	
	
	
	@RequestMapping( value = "/update_form", method = RequestMethod.GET )
	private String update_form(String md_id, Model model ) {
		AdminDTO dto = null;
		dto = service.detail(md_id);
		model.addAttribute("detail_dto", dto);
		return "/admin/admin_md_update_form";//jsp file name
	}//updateForm
		
	
	
	
	@RequestMapping( value = "/admin_md_detail", method = RequestMethod.GET )
	public String detail( String md_id, String userWantPage, Model model ) {
		AdminDTO dto = null;
		dto = service.detail( md_id );
		model.addAttribute("detail_dto", dto);
		model.addAttribute("md_id", md_id);
		return "/admin/admin_md_detail";//jsp file name
	}//detail
	
	
	@RequestMapping( value = "/delete")//상품 삭제
	private String delete(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.delete(ajaxMsg[i]);
		}
		
		return "/admin/admin_md_list";//
	}//delete
	

	
	@RequestMapping( value = "/offsale")
	private String md_disable(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.offsale(ajaxMsg[i]);
		}
		
		return "/admin/admin_md_list";//
	}//md_disable
	

	
	@RequestMapping( value = "/off_account")
	private String offAccount(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.off_account(ajaxMsg[i]);
		}
		
		return "/admin/admin_member_list";//
	}//off_account
	
	@RequestMapping( value = "/on_account")
	private String onAccount(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.on_account(ajaxMsg[i]);
		}
		
		return "/admin/admin_member_list";//
	}//onaccount
	

	@RequestMapping( value = "/onsale")
	private String onsale(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.onsale(ajaxMsg[i]);
		}
		
		return "/admin/admin_md_list";//
	}//onsale
	
	
	@RequestMapping( value = "/admin", method = RequestMethod.GET )
	private String admin() {
		return "/admin/admin";//
	}//admin
	
	
	@RequestMapping( value = "/admin_md_list", method = RequestMethod.GET )
	public String mdList( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );
		//System.out.println("상품의 총개수는 : ?" + totalCount);

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

		List<MdDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list); 
		model.addAttribute("search_dto", dto);
		 
		return "/admin/admin_md_list";//jsp file name
	}//admin_md_list
	
	
	//공지사항 관리
	@RequestMapping( value = "/admin_notice_list", method = RequestMethod.GET )
	public String list(Model model, String userWantPage, SearchDTO dto) {
		if(userWantPage == null || userWantPage.equals("")) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = Notice_service.searchListCount(dto);
		
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
		list = Notice_service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/admin/admin_notice_list";//jsp file name
	}//admin_notice_list
	
	
	@RequestMapping( value = "/admin_notice_detail", method = RequestMethod.GET )
	public String detail( String notice_id, Model model ) {
		NoticeDTO dto = null;
		dto = Notice_service.detail( notice_id );
		model.addAttribute("detail_dto", dto);
		return "/admin/admin_notice_detail";//jsp file name
	}//detail
	
	@RequestMapping(value = "/admin_notice_write_form", method = RequestMethod.GET)
	public String writeForm() {
		return "/admin/admin_notice_write";
	}//writeForm
	
	@RequestMapping( value = "/admin_notice_insert", method = RequestMethod.POST )
	public void write( NoticeDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = Notice_service.write( dto );
		out.print(successCount);
		out.close();
	}//write
	
	@RequestMapping( value = "/admin_notice_uform", method = RequestMethod.GET )
	public String uform (String notice_id, Model model) {
		NoticeDTO dto = null;
		dto = Notice_service.detail(notice_id);//notice_id에 맞는 디테일 정보를 가져와서 수정폼에 자동 입력
		model.addAttribute("detail_dto", dto);
		return "/admin/admin_notice_uform";
	}//uform
	
	@RequestMapping( value = "/admin_notice_update", method = RequestMethod.POST )
	public void update (NoticeDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = Notice_service.update(dto);
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete (NoticeDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = Notice_service.delete(dto);
		out.print(successCount);
		out.close();
	}//delete
	
	// 아래부분은 미사용 부분//
	
}//class