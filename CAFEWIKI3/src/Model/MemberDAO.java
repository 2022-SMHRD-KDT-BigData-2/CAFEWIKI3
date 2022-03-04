package Model;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;

public class MemberDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "Mapper/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}

	} // ==========================================================

	public int join(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("joinService", vo);
		session.close();
		return cnt;
	}

	public MemberVO login(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO uservo = session.selectOne("loginService", vo);
		session.close();

		return uservo;
	}

	public MemberVO idCheck(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO vo = session.selectOne("idCheck", id);
		session.close();

		return vo;
	}

	public MemberVO o_numCheck(String o_num) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO vo = session.selectOne("o_numCheck", o_num);
		session.close();

		return vo;
	}

	public MemberVO scan(int u_num) {
		SqlSession session = sqlSessionFactory.openSession();

		MemberVO vo = session.selectOne("barcodeScan", u_num);

		session.close();

		return vo;

	}

	public int update(MemberVO vo) {

		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.update("updateService", vo);
		session.commit();
		session.close();

		return cnt;
	}

	public int delete(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.delete("deleteService",id);
		session.commit();
		session.close();
		return cnt;
	}
	
	public MemberVO pwsearch(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO uservo = session.selectOne("pwsearch", vo);
		session.close();

		return uservo;
	}
	
	public int pwreset(MemberVO vo) {

		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.update("pwresetService", vo);
		session.commit();
		session.close();

		return cnt;
	}
}
