package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.MyListDTO;
import com.four.myapp.domain.TimelineDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.four.mappers.mypageMapper";

	@Override
	public List<TimelineDTO> timeline(String user_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".timeline", user_no);
	}

	@Override
	public List<TimelineDTO> getNoti(String user_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".getNoti", user_no);
	}

	@Override
	public void dismissNoti(String noti_no) throws SQLException {
		sqlSession.update(NAMESPACE + ".dismissNoti", noti_no);
	}

	@Override
	public List<MainDto> getMyList(String user_no, int index) throws SQLException {
		MyListDTO myListDTO = new MyListDTO();
		myListDTO.setUser_no(user_no);
		myListDTO.setIndex(index);
		System.out.println("user_no : " + user_no + "\nindex : " + index);
		return sqlSession.selectList(NAMESPACE + ".getMyList", myListDTO);
	}

	@Override
	public List<MainDto> getMyRecmdList(String user_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".getMyRecmdList", user_no);
	}

	@Override
	public List<MainDto> getMyFinishList(String user_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".getMyFinishList", user_no);

	}

	@Override
	public void uploadProfile(MemberVO memberVO) {
		sqlSession.update(NAMESPACE + ".uploadProfile", memberVO);
	}

}
