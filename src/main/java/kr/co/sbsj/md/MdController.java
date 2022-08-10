package kr.co.sbsj.md;

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
import org.springframework.web.multipart.MultipartFile;

import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.mdreview.MdReviewService;
import kr.co.sbsj.util.dto.SearchDTO;

@Controller
@RequestMapping( value="/md" )
public class MdController {
	
	private static final Logger logger = LoggerFactory.getLogger(MdController.class);
	
	@Autowired
	private MdService service;
	
	@Autowired
	private MdReviewService service2;
	
	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String md_id, String userWantPage, Model model ) {
		MdDTO dto = null;
		dto = service.detail( md_id );
		model.addAttribute("detail_dto", dto);
		model.addAttribute("md_id", md_id);
		return "/md/detail";//jsp file name
	}//detail
	
	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String list( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );

		if(totalCount > 4) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 4) + (totalCount % 4 > 0 ? 1 : 0);
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

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 4  );

		List<MdDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/md/list";//jsp file name
	}//list
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( MdDTO dto, String md_name, HttpSession session, PrintWriter out ) throws IOException {
		
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

		MultipartFile thumbnail = dto.getMd_thumbnail();
		InputStream is = thumbnail.getInputStream();
		FileOutputStream fos 
			= new FileOutputStream("C:/upload/md/" + todaySigan + "_" + thumbnail.getOriginalFilename());
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setMd_thumbnail_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
		dto.setMd_thumbnail_path("/upload/md/" + todaySigan + "_" + thumbnail.getOriginalFilename());

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

		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	@RequestMapping(value = "/write_form", method = RequestMethod.GET)
	public String write_form() {
		return "/md/write_form";//jsp file name
	}//write_form
	
}
