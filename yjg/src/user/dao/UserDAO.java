package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.DB;
import crypt.SHA256;
import sqlmap.MybatisManager;
import user.dto.UserDTO;

public class UserDAO {

	//회원리스트
	public List<UserDTO> userList() {
		List<UserDTO> list = new ArrayList<>();
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("jg.list");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list; 
	}

	//로그인
	public UserDTO loginCheck(String userid) {
		SqlSession session = null;
		UserDTO dto=null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("jg.loginCheck", userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return dto;
	} 


	//회원등록(join)
	public void insertBCrypt(UserDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("jg.insert", dto);
		session.commit();
		session.close();
	}


	//아이디 중복체크
	public int idCheck(String userid)throws Exception{		
		int x=-1;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;

		try {			
			conn=DB.getConn();
			pstmt=conn.prepareStatement("select userid from jgmem where userid=?");
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) 
				x=1;
			else
				x=-1;
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		

		return x;
	}


	//유저상세보기
	public UserDTO userDetail(String userid) {
		SqlSession session = null;
		UserDTO dto=null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("jg.view", userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return dto;
	} 


	//회원수정
	public void update(UserDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("jg.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
	}


	//회원삭제
	public void delete(String userid) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("jg.delete", userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
	}
	
	
	//유저상세보기
		public UserDTO mypage(String userid) {
			SqlSession session = null;
			UserDTO dto=null;
			try {
				session = MybatisManager.getInstance().openSession();
				dto = session.selectOne("jg.mypageview", userid);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null) session.close();
			}
			return dto;
		} 
		


}





