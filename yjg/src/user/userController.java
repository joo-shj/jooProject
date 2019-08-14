package user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.prism.ps.Shader;

import crypt.BCrypt;
import crypt.SHA256;
import user.dao.UserDAO;
import user.dto.UserDTO;


@WebServlet("/user_servlet/*")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		UserDAO dao = new UserDAO();
		
//user리스트		
		if(uri.indexOf("list.do") != -1) {						
			Map<String,Object> map=new HashMap<>();		
			List<UserDTO> list=dao.userList();			
			map.put("list", list);	
			map.put("count", list.size());					
			request.setAttribute("map", map);			
			String page="/user/userList.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
		
//회원등록					
		}else if(uri.indexOf("insertBCrypt.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String zipcode=request.getParameter("zipcode");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");					
			UserDTO dto=new UserDTO();
			dto.setUserid(userid);
			dto.setPasswd(BCrypt.hashpw(passwd, BCrypt.gensalt()));
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setZipcode(zipcode);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			dao.insertBCrypt(dto);		
	        String page="/login/login.jsp?result=success";
	        response.sendRedirect(request.getContextPath()+page);
			
//아이디로 상세보기				
         }else if(uri.indexOf("view.do") != -1) {
        	 String userid = request.getParameter("userid");

			UserDTO dto=dao.userDetail(userid);
			request.setAttribute("dto", dto);
	
			RequestDispatcher rd=request.getRequestDispatcher("/user/userEdit.jsp");
			rd.forward(request, response);			
			
		
			
			
//로그인			
		}else if(uri.indexOf("login.do") != -1){
				String userid=request.getParameter("userid");
				String passwd=request.getParameter("passwd");
				UserDTO dto=dao.loginCheck(userid);
				String page="/login/login.jsp";
				if(dto!=null) {
					if(BCrypt.checkpw(passwd, dto.getPasswd())) {
						HttpSession session=request.getSession();
						session.setAttribute("userid", userid);
						session.setAttribute("name", dto.getName());
						session.setAttribute("jgm_group", dto.getJgm_group());
						response.sendRedirect(request.getContextPath()+"/index.jsp?message=login");
					}else {
						response.sendRedirect(
								request.getContextPath()+
								page+"?message=error");
					}
				}else {
					response.sendRedirect(
							request.getContextPath()+
							page+"?message=error");
				}
				//로그아웃 처리				
				}else if(uri.indexOf("logout.do") != -1) {
					HttpSession session=request.getSession();
					session.invalidate();
					String page=request.getContextPath()
							+"/login/login.jsp?message=logout";
					response.sendRedirect(page);

//아이디 중복체크				
				}else if(uri.indexOf("idCheck.do") != -1) {
					String userid=request.getParameter("userid");
					try {
						int result = dao.idCheck(userid);
						response.getWriter().write(result+"");
					} catch (Exception e) {					
						e.printStackTrace();
					}
     			
//회원수정       			
                 }else if(uri.indexOf("update.do") != -1) {
                	String userid=request.getParameter("userid");
 					String passwd=request.getParameter("passwd");
 					String email=request.getParameter("email");
 					String hp=request.getParameter("hp");
 					String zipcode=request.getParameter("zipcode");
 					String address1=request.getParameter("address1");
 					String address2=request.getParameter("address2");					
 					UserDTO dto=new UserDTO();
 					dto.setUserid(userid);
 					dto.setPasswd(BCrypt.hashpw(passwd, BCrypt.gensalt()));
 					dto.setEmail(email);
 					dto.setHp(hp);
 					dto.setZipcode(zipcode);
 					dto.setAddress1(address1);
 					dto.setAddress2(address2); 				
         			dao.update(dto);
         			response.sendRedirect(context+"/user/user.jsp");
         			
//회원탈퇴     			
         		}else if(uri.indexOf("delete.do") != -1) {
         			String userid=request.getParameter("userid");
         			dao.delete(userid);
        			response.sendRedirect(context+"/user/user.jsp");
         		
		
			
			
//마이페이지 상세보기			
    }else if(uri.indexOf("mypageView.do") != -1) {
    	 HttpSession session = request.getSession();
    	 String userid=(String)session.getAttribute("userid");

		UserDTO dto=dao.mypage(userid);
		request.setAttribute("dto", dto);

		RequestDispatcher rd=request.getRequestDispatcher("/user/mypageEdit.jsp");
		rd.forward(request, response);			
		
	
    }	
}					

	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {

		doGet(request, response);
	}

}
