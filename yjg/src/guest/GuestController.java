package guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestDAO;
import guest.GuestDTO;


@WebServlet("/guest_servlet/*")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
	
		String uri=request.getRequestURI();
		System.out.println(uri);
		GuestDAO dao=new GuestDAO();
		if(uri.indexOf("list.do") != -1) {
			
			List<GuestDTO> items=dao.getList();
			request.setAttribute("list", items);
			request.setAttribute("count", items.size());
			
			String page="/guest/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		
		}else if(uri.indexOf("insert.do") != -1) {
			String email=request.getParameter("email");
			String passwd=request.getParameter("passwd");
			String content=request.getParameter("content");
			GuestDTO dto=new GuestDTO();
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			dao.gbInsert(dto);

			response.sendRedirect(request.getContextPath()+"/guest/guest.jsp");
		
		
		}else if(uri.indexOf("passwd_check.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			String passwd=request.getParameter("passwd");
			System.out.println("게시물번호 : "+idx);
			System.out.println("사용자가 입력한 비번 : "+passwd);
			
			boolean result=dao.passwdCheck(idx, passwd);
	
			System.out.println("결과 : "+result);
			String url="";
			if(result) {
				url="/guest/edit.jsp";//수정용 출력페이지

				GuestDTO dto=dao.gbDetail(idx);
				request.setAttribute("dto", dto);
				
			}else {
				url="/guest/list.jsp";
			}
	
			RequestDispatcher rd=request.getRequestDispatcher(url);
			rd.forward(request, response);
		
		
		}else if(uri.indexOf("update.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			String email=request.getParameter("email");
			String passwd=request.getParameter("passwd");
			String content=request.getParameter("content");
			GuestDTO dto=new GuestDTO();
			dto.setIdx(idx);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);			
			dao.gbUpdate(dto);

			String url="/guest_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		
		
		}else if(uri.indexOf("delete.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			dao.gbDelete(idx);
			String url="/guest_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
