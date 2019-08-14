package chat.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import chat.dto.chatDTO;
import config.DB;

public class chatDAO {
	

	private Connection conn;
	
	public chatDAO() {
		try {
			//jdbc:oracle:thin:@localhost:1521:xe   jdbc:mysql://localhost:3306/ANONYMOUSCHAT
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			//username="java" password="java1234"
			String dbID = "java";
			String dbPassword = "java1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	


public ArrayList<chatDTO> getChatListRecent(String chatID){
ArrayList<chatDTO> chatList = null;
PreparedStatement pstmt =  null;
ResultSet rs = null;
String sql="select * from chat where chatID > ? order by chatTime";
    try{
pstmt=conn.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(chatID));
rs = pstmt.executeQuery();
chatList = new ArrayList<chatDTO>();
while(rs.next()){
	chatDTO chat = new chatDTO();
chat.setChatID(rs.getInt("chatID"));
chat.setChatName(rs.getString("chatName"));
chat.setChatContent
(rs.getString("chatContent").replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
String timeType = "오전";
if(Integer.parseInt(rs.getString("chatTime").substring(11,13))>=12){
 timeType = "오후";
 chatTime -=12;
}
chat.setChatTime(rs.getString("chatTime").substring(0,11)+" "+timeType+" "
+chatTime+":"+rs.getString("chatTime").substring(14,16)+" ");
chatList.add(chat);
}
    } catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
return chatList;
 }







public ArrayList<chatDTO> getChatListRecent(int number){
ArrayList<chatDTO> chatList = null;
PreparedStatement pstmt =  null;
ResultSet rs = null;
String sql="select * from chat where chatID > (select max(chatID) - ? from chat) order by chatTime";
    try{
pstmt=conn.prepareStatement(sql);
pstmt.setInt(1, number);
rs = pstmt.executeQuery();
chatList = new ArrayList<chatDTO>();
while(rs.next()){
	chatDTO chat = new chatDTO();
chat.setChatID(rs.getInt("chatID"));
chat.setChatName(rs.getString("chatName"));
chat.setChatContent
(rs.getString("chatContent").replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
String timeType = "오전";
if(Integer.parseInt(rs.getString("chatTime").substring(11,13)) >= 12){
 timeType = "오후";
 chatTime -=12;
}
chat.setChatTime(rs.getString("chatTime").substring(0,11)+" "+timeType+" "
+chatTime+":"+rs.getString("chatTime").substring(14,16)+" ");
chatList.add(chat);
}
    } catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
return chatList;
 }


	
	public ArrayList<chatDTO> getChatList(String nowTime){
		ArrayList<chatDTO> chatList = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		String sql="select * from chat where chatTime > ? order by chatTime";		   
		try {		    	
		    	pstmt=conn.prepareStatement(sql);
		    	pstmt.setString(1, nowTime);
		    	rs = pstmt.executeQuery();
		    	chatList = new ArrayList<chatDTO>();
		    	while(rs.next()){
		    		chatDTO chat = new chatDTO();
		    		chat.setChatID(rs.getInt("chatID"));
		    		chat.setChatName(rs.getString("chatName"));
		    		chat.setChatContent
		    		(rs.getString("chatContent").replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
		    		int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
		    		String timeType = "오전";
		    	
		    				if(Integer.parseInt(rs.getString("chatTime").substring(11,13)) >= 12){
		    			timeType = "오후";
		    			chatTime -=12;
		    		}
		    		chat.setChatTime(rs.getString("chatTime").substring(0,11)+" "+timeType+" "
		    				+chatTime+":"+rs.getString("chatTime").substring(14,16)+" ");
		    		chatList.add(chat);
		    	}			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	return chatList;
		}
	
		public int submit(String chatName, String chatContent) {
			PreparedStatement pstmt =  null;
			ResultSet rs = null;
			String sql="insert into chat(chatID,chatName,chatContent) values (chatID_seq.nextval, ?, ?)";
			    try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, chatName);
			pstmt.setString(2, chatContent);
			return pstmt.executeUpdate();

			    } catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			return -1; //오류생겼을때 반환
			 }
          } 
	
