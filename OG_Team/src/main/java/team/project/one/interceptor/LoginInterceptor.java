package team.project.one.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import team.project.one.vo.MemberVO;

@ControllerAdvice
public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("fit_member");
		
		if(!(vo.getFit_userkeyvalue().equals("Confirm")))
		{
			response.sendRedirect("/one/");
			return false;
		}
		return true;
	}
}
