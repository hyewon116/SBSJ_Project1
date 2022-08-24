package kr.co.sbsj.md;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.mdreview.MdReviewDTO;
import kr.co.sbsj.mdreview.MdReviewService;
import kr.co.sbsj.util.dto.SearchDTO;

@Controller
@RequestMapping( value="/md" )
public class MdController {
	
	private static final Logger logger = LoggerFactory.getLogger(MdController.class);
	
	@Autowired
	private MdService service;
	
	//쿠폰 발급
	@RequestMapping(value = "/coupon_insert", method = RequestMethod.POST)
	public void couponInsert( CouponDTO dto, PrintWriter out ) {
		int isYN = 0;
		isYN = service.couponCheck( dto ); //쿠폰 중복 체크용 쿼리
			
		//중복 체크 
		if ( isYN >= 1 ) {
			System.out.println(isYN);
			out.print(0);
			out.close();
			return;
			
		} else { //중복이 아니면 insert
			int successCount = 0;
			successCount = service.coupon_insert( dto );
			System.out.println(successCount);
			out.print(successCount);
			out.close();	
		}
		
	}//couponInsert
	
	
	//이벤트(쿠폰) 리스트
	@RequestMapping(value = "/event_list", method = RequestMethod.GET)
	public String eventList() {
		return "/md/event_list";//jsp file name
	}//event_list
	
	
	//정기구독 디테일
	@RequestMapping(value = "/subs_detail", method = RequestMethod.GET)
	public String subs_detail() {
		return "/md/subs_detail";//jsp file name
	}//subs_detail
	
	
	//정기구독 리스트
	@RequestMapping(value = "/subs_list", method = RequestMethod.GET)
	public String subs_list() {
		return "/md/subs_list";//jsp file name
	}//subs_list
	
	
	//상품 리스트 - 필터링  적용 
	@RequestMapping( value = "/list_cate", method = RequestMethod.GET )
	public String list_cate( Model model, String userWantPage, SearchDTO dto ) {
		
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount2( dto ); //주종~상황별 속성 + limitNum 담은 dto

		if(totalCount > 4) {
			lastPageNum = (totalCount / 4) + (totalCount % 4 > 0 ? 1 : 0);
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

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 4  );
		
		List<MdDTO> list = null;
		list = service.searchList2( dto ); //주종~상황별 속성 + limitNum 담은 dto
		model.addAttribute("list", list);
		return "/md/list";//jsp file name
	}//list_cate
	
	
	//찜 목록에 넣기
	@RequestMapping( value = "/wish_insert", method = RequestMethod.POST ) 
	public void wish( SearchDTO dto, PrintWriter out, MemberDTO mdto ) {
		
		int isYN = 0;
		isYN = service.wishCheck( dto ); //찜 중복 체크용 쿼리
		
		//중복 체크 
		if ( isYN >= 1 ) {
			System.out.println(isYN);
			out.print(0);
			out.close();
			return;
		} else { //중복이 아니면 insert
			int successCount = 0;
			successCount = service.wish_insert( dto );
			System.out.println(successCount);
			out.print(successCount);
			out.close();	
		}
		System.out.println("=============" + mdto);
		
	}//wish
	
	//게시글 상세보기
	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( MdDTO dto, String md_id, HttpSession session, Model model ) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info"); //로그인 정보 전달
		
		dto = service.detail( md_id );
		
		model.addAttribute("detail_dto", dto);
		model.addAttribute("md_id", md_id); //상품후기&문의 게시판에 보낼 md_id 정보
		return "/md/detail";//jsp file name
	}//detail
	
	
	//상품 리스트
	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String list( Model model, String userWantPage, SearchDTO dto, String md_id ) {

		List<MdDTO> list = null;
		list = service.searchList( dto ); //limitNum, md_id가 담긴 dto
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);//검색용 dto
		
		return "/md/list";//jsp file name
	}//list
	
	//베스트 상품 리스트
	@RequestMapping( value = "/best_list", method = RequestMethod.GET )
	public String bestList( Model model, String userWantPage, SearchDTO dto, String md_id ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.bestListCount( dto ); //md_id를 넘기기 위한 dto
		
		if(totalCount > 4) {
			lastPageNum = (totalCount / 4) + (totalCount % 4 > 0 ? 1 : 0);
		}//if
		
		if(userWantPage.length() >= 2) { 
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
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
		
		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 4  );
		
		List<MdDTO> list = null;
		list = service.bestList( dto ); //limitNum, md_id가 담긴 dto
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);//검색용 dto
		
		return "/md/best_list";//jsp file name
	}//btest_list
	
	
	//게시글 등록
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
		File newFolder = new File("C:/upload/md/" + todayNalja + "/"); //이미지 저장될 폴더명
		if( newFolder.exists() == false ) newFolder.mkdirs();

		MultipartFile thumbnail = dto.getMd_thumbnail();
		InputStream is = thumbnail.getInputStream();
		FileOutputStream fos 
			= new FileOutputStream("C:/upload/md/" + todayNalja + "/" + todaySigan + "_" + thumbnail.getOriginalFilename());
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setMd_thumbnail_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
		dto.setMd_thumbnail_path("/upload/md/" + todayNalja + "/" + todaySigan + "_" + thumbnail.getOriginalFilename());

		MultipartFile detail_img = dto.getMd_detail_image();
		if(detail_img != null && !detail_img.getOriginalFilename().equals("")) {
			is = detail_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/md/" + todayNalja + "/" + todaySigan + "_" + detail_img.getOriginalFilename());
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setMd_detail_name(todayNalja + "_" + todaySigan + "_" + detail_img.getOriginalFilename());
			dto.setMd_detail_path("/upload/md/" + todayNalja + "/" + todaySigan + "_" + detail_img.getOriginalFilename());
		}

		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	
	//게시글 쓰기
	@RequestMapping(value = "/write_form", method = RequestMethod.GET)
	public String write_form() {
		return "/md/write_form";//jsp file name
	}//write_form
	
}
