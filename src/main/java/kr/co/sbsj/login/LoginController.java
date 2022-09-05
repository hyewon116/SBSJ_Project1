package kr.co.sbsj.login;

import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.protobuf.Parser;

import kr.co.sbsj.util.dto.Kakao_MemberDTO;
import kr.co.sbsj.util.dto.MemberDTO;
import kr.co.sbsj.util.dto.Naver_MemberDTO;


@Controller
@RequestMapping( value = "/login" )
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService service;
	@Autowired
	private Naver_LoginService n_service; // naver 서비스
	@Autowired
	private Kakao_LoginService k_service; // kakao 서비스
	
	
	@RequestMapping( value = "/login", method = RequestMethod.GET )
	public String login( HttpSession session ) {
		return "/login/login";//jsp file name
	}//login
	
	@RequestMapping( value = "/test1", method = RequestMethod.GET )
	public String test1( HttpSession session ) {//네이버 페이지 test용 
		return "/join/join_form_naver";//jsp file name
	}//test1
	
	@RequestMapping( value = "/test2", method = RequestMethod.GET )
	public String test2( HttpSession session ) {//카카오 페이지 test용
		return "/join/join_form_kakao";//jsp file name
	}//test2
	
	@RequestMapping( value = "/logout", method = RequestMethod.GET )
	public String logout( HttpSession session ) {// 차후 구현 대기
		session.invalidate();//세션 삭제
		return "/home";//jsp file name
	}//logout
	
	
	/*<============== Naver 로그인  시작 ==============> */
	
	
	
	/*<============== 2. 네이버 로그인 연동 결과 Callback 정보 ==============> */
	String apiURL;
	@RequestMapping( value = "/naver_callback", method = RequestMethod.GET )
	public String  callbackNaver(HttpServletRequest request, Naver_MemberDTO dto, PrintWriter out, HttpSession session ) throws UnsupportedEncodingException {
		//여기서 받고
		System.out.println("============== 2. 네이버 로그인 연동 결과 Callback 정보 ==============");
		String clientId = "hM6sBK_JUV8WoxnMmHzF";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "XJ0Bm86Wgx";//애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");//네이버 로그인과 정보 제공 동의 과정 완료 후 받은 code 값
		String state = request.getParameter("state");//네이버 로그인과 정보 제공 동의 과정 완료 후 받은 state 값
		String redirectURI = URLEncoder.encode("http://localhost:8081/sbsj/login/naver_callback", "UTF-8");//자신의 CallBack URL";
		System.out.println("Login 후 네이버에서 받은 code값 : " + code);
		System.out.println("Login 후 네이버에서 받은 state 값 : " + state);
		System.out.println("");
		
		
		
		
	/*<============== 3. 접근 토큰 발급 요청 ==============> */	
		//client_id값과 client_secret값 그리고 위 code, state값을 합하여 access_token을 발급 받기위한 apiURL을 생성
		System.out.println("============== 3. 접근 토큰 발급 요청 ==============");
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		
		
		String access_token = "";
		String refresh_token = "";
		System.out.println("");
		System.out.println("client_id값과 client_secret값 그리고 위 code, state값을 합하여 access_token을 발급 받기위한 apiURL을 생성");
		System.out.println("");
		System.out.println("생성된 apiURL의 값은 : "+apiURL);
		System.out.println("apiURL로 네이버에 접속");
		System.out.println("");
		System.out.println("");
		
		// 네이버와 apiURL을 통해서 연결 후 access_token, refresh_token, token_type, expires_in 를 받아 그 중 access_token만 token 변수에 저장
	
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			// apiURL 연결
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("네이버로 부터 받응 응답 코드인 responseCode는 : "+responseCode);
			System.out.println("응답 코드 200이 정상");
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if(responseCode==200) {
				System.out.println("");
				System.out.println("");
				System.out.println(" 네이버와 통신 후  access_token, refresh_token, token_type, expires_in정보를 받아서 res 변수에 넣음 ");
				System.out.println("");
				System.out.println("");
				System.out.println("**************** res의 원래 모습 (String) ****************");
				System.out.println(res.toString());
				System.out.println("******************************************************");
				System.out.println("");
				System.out.println("");
				JSONObject jsonObject = new JSONObject(); // JSONObject를 사용하여 JSON객체를 생성 하기위해 로드
				JSONParser parser = new JSONParser(); // String 객체(Json문자열)를 JSON Object로 변환 하기위해 로드
				jsonObject = (JSONObject) parser.parse(res.toString()); //String 객체(Json문자열)를 JSON Object형태("key", "value")로 변환(Parse)하여 JSON객체에  저장 
			
				System.out.println("JSONParser를 이용하여 JSONObject에 JSON 객체 저장");
				System.out.println("access_token 값만을 token 변수에 저장");
				
				String token = jsonObject.get("access_token").toString();// res의 정보 중 access_token의 값만을 token변수에 저장
				System.out.println("token의 값은 : " + token);
				
				System.out.println("");
				System.out.println("");
				
				
	/*<============== 4. 접근 토큰을 이용하여 프로필 API 호출하기 ==============> */
				System.out.println("============== 4. 접근 토큰을 이용하여 프로필 API 호출하기 ==============");
				System.out.println("");
				String header = "Bearer " + token; // token
				apiURL = "https://openapi.naver.com/v1/nid/me";

				Map<String, String> requestHeaders = new HashMap<String, String>();
				requestHeaders.put("Authorization", header);
				
				String responseBody = get(apiURL,requestHeaders); // 네이버에 access_token을 주고 네이버 프로필을 받아서 responseBody에 저장
				
				
				System.out.println("Naver에 access_token을 주고 return 받은 data String");
				System.out.println(responseBody);
				JSONObject jsonObject2 = (JSONObject) parser.parse(responseBody); //String 객체(Json문자열)를 JSON Object형태("key", "value")로 변환(Parse)하여 JSON객체에  저장
				System.out.println("");
				System.out.println("");
				System.out.println("JSONParser를 이용하여 JSONObject에 JSON 객체 저장");
				System.out.println("response 값만을 따로 저장");
				System.out.println("");
				System.out.println("response의 값");
				System.out.println(jsonObject2.get("response"));
				JSONObject jsonObject3 = (JSONObject) jsonObject2.get("response"); //responseBody의 정보 중 response의 값만을 저장
				System.out.println("");
				System.out.println("");
//				System.out.println("이름 : " + jsonObject3.get("name"));
//				System.out.println("닉네임 : " + jsonObject3.get("nickname"));
//				System.out.println("이메일 : " + jsonObject3.get("email"));
//				System.out.println("휴대폰번호 : " + jsonObject3.get("mobile"));
//				System.out.println("출생년도 : " + jsonObject3.get("birthyear"));
//				System.out.println("**************");
				
				
				System.out.println("DTO에 프로필 정보를 항목별로 넣는다.");
				//네이버에서 받은 프로팰 내용을 Naver_MemberDTO dto에 담음
				dto.setName( (String) jsonObject3.get("name") );
				dto.setNickname( (String) jsonObject3.get("nickname") );
				dto.setEmail( (String) jsonObject3.get("email") );
				dto.setMobile( ((String) jsonObject3.get("mobile")).replaceAll("-", "") );
				// 010-1234-6789 -> 01012346789의 형태로 변환하여 저장, 차후 전화번호 중복체크를 위해 '-' 삭제
				dto.setBirthyear((String) jsonObject3.get("birthyear"));
				dto.setJoin_naver("Y");
				System.out.println("");
				System.out.println("");
				System.out.println("Naver_MemberDTO에 담긴 내용들");
				logger.info(dto.toString());
				System.out.println("");
				System.out.println("");
				System.out.println("-------------------Naver_Login 끝-------------------");
				System.out.println("");
				System.out.println("");
				System.out.println("");
				String age = dto.getBirthyear(); // 접속한 접속자의 나이가 20세 미만의 경우 return 페이지로 이동
				System.out.println("나이가 몇인가요? : " + age);
				if ( Integer.parseInt(age) > 2003 ) {
					return "/19age";// 미성년자 일 경우 리턴되는 페이지
				}//if
				
				
				MemberDTO dtoFromDB = null;
				dtoFromDB = n_service.login( dto ); // 네이버 로그인을 통해 들어온 유저가 그 전에 가입한 적이있는지 확인
				System.out.println("가입한적이 있나요?" + dtoFromDB);
				
				
				//블럭처리된 계정의 처리 
				String BlockYn = "N"; // 계정블럭처리 시 사용할 변수
				
				
				if( dtoFromDB == null ) {
					//네이버 로그인을 통해 들어온 유저가 그 전에 가입한 적이 없을경우
					session.setAttribute("naver_login_info", dto);// Naver_MemberDTO의 값을가지고 회원가입 페이지로 이동
					
					return "/join/join_form_naver";// 회원 가입 페이지로 이동
				
				} else if ( dtoFromDB != null && dtoFromDB.getMember_account() != null && dtoFromDB.getMember_account().equals(BlockYn)) {
					return "block";//block 처리 조건문
					
				} else if ( dtoFromDB != null && dtoFromDB.getMember_name() != null && dtoFromDB.getMember_name() != "") {
					//네이버 로그인을 통해 들어온 유저가 그 전에 가입한 적이 있을경우 세션을 통해  Member DTO의 값을 세션 login_info로 생성 후 
					//"login/loginSuccess"로 이동
					session.setAttribute("login_info", dtoFromDB);
				}//login
				
			}
		} catch ( NullPointerException e) {
			return "/login/login"; // 가입페이지에서 새로고침 할경우 access_token 유실되어 nullpoint exception 발생---------------------------------->
		} catch (Exception e) {
			System.out.println(e);
	}
		
		return "home";//jsp file name
	}//callback_naver


	

	private static HttpURLConnection connect(String apiUrl){
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders){
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}


			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}//get

	private static String readBody(InputStream body){
		InputStreamReader streamReader = new InputStreamReader(body);

		try  {
			BufferedReader lineReader = new BufferedReader(streamReader);
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}//readBody
	
	
	/*<============== Naver 로그인  끝 ==============> */

	
	
	/*<============== Kakao 로그인  시작 ==============> */
	
	@RequestMapping(value="/kakao_login", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Kakao_MemberDTO dto, HttpSession session) throws Exception {
		try {
			
			System.out.println("#########" + code);
			String access_Token = k_service.getAccessToken(code);
			//Kakao_LoginService에서 access_Token을 받아옴 
			HashMap<String, Object> userInfo = k_service.getUserInfo(access_Token);
			//Kakao_LoginService에서 받아온 access_Token을 이용하여 userInfo(유저정보를 받아옴)
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));
			System.out.println("###age_range#### : " + userInfo.get("age_range"));
			
			//받아옴 유저정보를 Kakao_MemberDTO에 넣음
			dto.setNickname((String) userInfo.get("nickname"));
			dto.setAge_range((String) userInfo.get("age_range"));
			dto.setEmail((String) userInfo.get("email"));
			dto.setJoin_kakao("Y");
			
			// Kakao_MemberDTO에 담긴 값을 확인
			logger.info( dto.toString() );
			
			
			String beforeage = dto.getAge_range(); // dto.getAge_range()은 ex) 20 ~30 와 같이 연령대출력
			String afterage = beforeage.substring(0, 2); // 앞에서 0번째부터 2개 잘라서 연령대'20' 획득 
			System.out.println("나이가 몇인가요? : " + afterage); // 해당 연령대 확인
			
			if ( Integer.parseInt(afterage) < 20 ) { // 연령대가 20대보다 낮으면 즉 미성년자일 경우 
				return "/19age";// 미성년자 가입불가 페이지로 리턴
			}//if
			
			
			
			MemberDTO dtoFromDB = null;
			System.out.println("시작 전 dto : " + dtoFromDB);
			dtoFromDB = k_service.login( dto ); //k_service.login를 통해 로그인 여부 확인
			
			//블럭처리된 계정의 처리 
			String BlockYn = "N"; // 계정블럭처리 시 사용할 변수
			
			if( dtoFromDB == null ) {//회원 가입 이력이 없는 사용자
				session.setAttribute("kakao_login_info", dto); 
				// 미가입의 경우 api에서 전달 받은 값을 넣은 dto를 회원가입 페이지에서 로딩하기위해 kakao_login_info 세선에 정보 탑재
				return "/join/join_form_kakao";//카카오 회원가입 페이지로 이동 
			
			} else if ( dtoFromDB != null && dtoFromDB.getMember_account() != null && dtoFromDB.getMember_account().equals(BlockYn)) {
				return "block";//block 처리 조건문
				
				
			} else if ( dtoFromDB != null && dtoFromDB.getMember_name() != null && dtoFromDB.getMember_name() != "") {
				// 회원가입 이력이 있을경우
				session.setAttribute("login_info", dtoFromDB);
				
			}//login
			
			
			
			return "home";
			
		} catch (Exception e) {
			return "/login/login";
		}
		
		
		
		
		
	}//kakaoLogin
	
	/*<============== Kakao 로그인  끝==============> */
	

	
}//class


/*
create table member(
mno int primary key auto_increment
, mid varchar(20)
, mpwd varchar(20)
, tel varchar(15)
, email varchar(50)
, mdate datetime
);
*/