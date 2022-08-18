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

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.SearchDTO;




@Controller
@RequestMapping( value = "/admin" )
public class AdminController {
	
	
	private final static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
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

		System.out.println(222);

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

		System.out.println(333);

		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		System.out.println("=============================================================" + dto);
		int successCount = 0;
		successCount = service.update(dto);

		System.out.println(444);

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
	
	
	@RequestMapping( value = "/delete")
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
	
	@RequestMapping( value = "/onsale")
	private String md_able(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.onsale(ajaxMsg[i]);
		}
		
		return "/admin/admin_md_list";//
	}//md_able
	
	
	@RequestMapping( value = "/admin", method = RequestMethod.GET )
	private String myPage() {
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
	}//list

		
		
		
		
		
		
		
	
	// 아래부분은 미사용 부분//
	
	
}//class