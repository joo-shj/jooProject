package chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chat.dao.chatDAO;
import chat.dto.chatDTO;



//@WebServlet("/ChatListSerlvet")
public class ChatListSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	//@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		
		//ServletRequest requset = null;
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String listType = request.getParameter("listType");
		if(listType == null || listType.equals("")) response.getWriter().write(""); //오류일때

		else if(listType.equals("today")) response.getWriter().write(getToday()+""); 
		else if(listType.equals("ten")) response.getWriter().write(getTen()+""); 

}
	
		public String getToday(){
			  StringBuffer result = new StringBuffer(""); 
			  result.append("{\"result\" : [" );  
			  chatDAO dao = new chatDAO();
			  ArrayList<chatDTO> chatList = dao.getChatList
			(new SimpleDateFormat("yyyy-MM-dd").format(new Date())); 
			  
			for(int i=0; i< chatList.size(); i++){
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatName()+"\"},");    
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatContent()+"\"},");  
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatTime()+"\"},");  
			
			  if( i != chatList.size() -1) 
			result.append(",");
			}
			result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatID()+ "\"}");
			return result.toString();
			}


			public String getID(String chatID){
			  StringBuffer result = new StringBuffer(""); 
			  result.append("{\"result\" : [" );  
			  chatDAO dao = new chatDAO();
			  ArrayList<chatDTO> chatList = dao.getChatListRecent(chatID);
			for(int i=0; i<chatList.size(); i++){
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatName()+"\"},");    
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatContent()+"\"},");  
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatTime()+"\"},");  
			
			  if( i != chatList.size() -1) 
			result.append(",");
			}
			result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatID()+ "\"}");
			return result.toString();
			}



			public String getTen(){
			  StringBuffer result = new StringBuffer(""); 
			  result.append("{\"result\" : [" );  
			  chatDAO dao = new chatDAO();
			  ArrayList<chatDTO> chatList = dao.getChatListRecent(10);
			for(int i=0; i<chatList.size(); i++){
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatName()+"\"},");    
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatContent()+"\"},");  
			  result.append("[{\"value\" : \"" + chatList.get(i).getChatTime()+"\"},");  
			if( i != chatList.size() -1) 
			result.append(",");
			}
			result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatID()+ "\"}");
			return result.toString();
			}
		
	}		
	
	

