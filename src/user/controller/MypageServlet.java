package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserInfo;
import user.service.face.UserInfoUpdateService;
import user.service.impl.UserInfoUpdateServiceImpl;

@WebServlet("/user/mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	UserInfoUpdateService userUpdateService = new UserInfoUpdateServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("/user/mypage [GET]");
		
		//20200624 이인주
		
		
		//사용자로 로그인한 아이디값 가져오기
		HttpSession session = req.getSession();
		
		
		if (session.getAttribute("userid") == null) {
			
//			System.out.println("로그인 정보 없음");
			resp.sendRedirect("/member/login");
			return;
		}
		 

		// 세션으로 사용자 아이디값 불러서 변수에 저장하기
		String userid = (String)session.getAttribute("userid");
		
		
		//UserInfo 객체 만들어서 id 넣어주기
		UserInfo u = new UserInfo();
		u.setUserid(userid);
		
		
		//사용자 정보 가져오기(등급)
		UserInfo uinfo = userUpdateService.userInfoLoad(u);
		int grade = uinfo.getUsergrade();
		
		System.out.println(grade);
		
		
		//사용자  아이디  jsp로 넘기기
		req.setAttribute("userid", userid);
	
		//사용자 정보 결과 전달
		req.setAttribute("grade", grade);
		 
		
	
		req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypage.jsp").forward(req, resp);
	
	}
	
	
}
