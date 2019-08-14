package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chat.dao.chatDAO;


//@WebServlet("/ChatSubmitSerlvet")
public class ChatSubmitSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	//@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {

		//ServletRequest requset = null;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String chatName = URLDecoder.decode(request.getParameter("chatName"),"UTF-8");
		String chatContent = URLDecoder.decode(request.getParameter("chatContent"),"UTF-8");
	/*	String chatName =  request.getParameter("chatName");
		String chatContent = request.getParameter("chatContent");*/
		if(chatName == null || chatName.equals(" ")  ||  chatContent == null || chatContent.equals("")){
		response.getWriter().write("0"); //오류일때
		  }
		else{
		response.getWriter().write(new chatDAO().submit(chatName, chatContent)+""); 

		 }
	   }
	}


	