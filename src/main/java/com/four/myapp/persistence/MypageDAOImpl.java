package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MypageDto;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.four.mappers.mypageMapper";

	@Override
	public List<MypageDto> timeline(String user_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".timeline", user_no);
	}

}
