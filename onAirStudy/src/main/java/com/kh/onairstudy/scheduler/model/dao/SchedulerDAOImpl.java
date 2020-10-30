package com.kh.onairstudy.scheduler.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.scheduler.model.vo.Scheduler;

@Repository
public class SchedulerDAOImpl implements SchedulerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Scheduler> mainScheduler(Map<String, Object> map) {
		return sqlSession.selectList("scheduler.schedulerList", map);
	}
	
	@Override
	public int insertSchedule(Scheduler sch) {
		return sqlSession.insert("scheduler.insertSchedule", sch);
	}

	@Override
	public int deleteSchedule(int no) {
		return sqlSession.delete("scheduler.deleteSchedule", no);
	
	}

	@Override
	public Scheduler selectOne(int no) {
		return sqlSession.selectOne("scheduler.selectOne", no);
	}

	@Override
	public int updateSchedule(Scheduler sch) {
		return sqlSession.update("scheduler.updateOne", sch);
	}

	@Override
	public int insertTodo(Scheduler sch) {
		return sqlSession.insert("scheduler.insertTodo", sch);
	}

	@Override
	public int deleteTodo(Map<String, Object> map) {
		return sqlSession.delete("scheduler.deleteTodo", map);
	}

	@Override
	public List<Scheduler> selectToDoList(String memberId) {
		return sqlSession.selectList("scheduler.selectToDoList", memberId);
	}

	
	public Scheduler dDaySearch(Map<String, Object> map) {
		return sqlSession.selectOne("scheduler.dDaySearch", map);
	}

	
	
	
}
