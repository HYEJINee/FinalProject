package com.four.myapp.persistence;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.four.myapp.domain.TimelineDTO;

public class TimelineDAOImpl implements TimelineDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.four.mappers.timelineMapper";
	
	@Override
	public void timelineTopic(TimelineDTO timelineDTO) throws SQLException {
		sqlSession.insert(NAMESPACE + ".uploadProfile", timelineDTO);
	}

	@Override
	public void timelineVote(TimelineDTO timelineDTO) throws SQLException {
		sqlSession.insert(NAMESPACE + ".uploadProfile", timelineDTO);
	}

}
