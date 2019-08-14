package guest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import sqlmap.MybatisManager;

public class GuestDAO {
	
	public List<GuestDTO> getList(){
		SqlSession session=
				MybatisManager.getInstance().openSession();
		List<GuestDTO> list=session.selectList("guest.gbList");
		session.commit();
		session.close(); 
		return list;
	}

	public void gbInsert(GuestDTO dto) {
		SqlSession session=
				MybatisManager.getInstance().openSession();
		session.insert("guest.gbInsert", dto);
		session.commit();
		session.close();
	}

	public boolean passwdCheck(int idx, String passwd) {
		boolean result=false;
		SqlSession session=
				MybatisManager.getInstance().openSession();
		GuestDTO dto=new GuestDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);

		int count=session.selectOne("passwdCheck", dto);
		session.close();
		if(count==1) {
			result=true;
		}
		return result;
	}
	
	//게시물의 상세정보(idx: 게시물번호)
	public GuestDTO gbDetail(int idx) {
		GuestDTO dto=new GuestDTO();
		SqlSession session=
				MybatisManager.getInstance().openSession();
		dto = session.selectOne("gbDetail", idx);
		session.close();
		return dto;
	}

	public void gbUpdate(GuestDTO dto) {
		SqlSession session=
				MybatisManager.getInstance().openSession();
		//"네임스페이스.id"
		session.update("guest.gbUpdate", dto);
		session.commit();
		session.close();
	}

	public void gbDelete(int idx) {
		SqlSession session=
				MybatisManager.getInstance().openSession();
		//"네임스페이스.id"
		session.delete("guest.gbDelete", idx);
		session.commit();
		session.close();

		
	}
}
