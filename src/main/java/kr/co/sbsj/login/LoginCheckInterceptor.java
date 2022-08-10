package kr.co.sbsj.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.sbsj.util.dto.MemberDTO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private final static Logger logger = LoggerFactory.getLogger( LoginCheckInterceptor.class );
	    
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//logger.info("호출된 메소드가 실행되기 전에 실행되는 부분이다.");
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
		// login_info : LoginController 에서 만들어짐
		if( dto == null || dto.getMember_name() == null || dto.getMember_name().equals("") ) {
			response.sendRedirect( request.getContextPath() + "/" );
			//로그인 세션이 없을경우 홈으로 돌려보낸다.
			return false;//게속 진행 할 메소드 호출 중지.
		}//if
		return super.preHandle(request, response, handler);// 계속 진행 할 메소드 호출.
	}//preHandle
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//logger.info("호출된 메소드가 실행된 이후에 실행되는 부분이다.");
		super.postHandle(request, response, handler, modelAndView);
	}//postHandle
	
}//class
