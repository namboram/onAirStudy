package com.kh.onairstudy.scheduler.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.scheduler.model.dao.SchedulerDAO;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class SchedulerServiceImpl implements SchedulerService {

	@Autowired
	private SchedulerDAO schedulerDAO;

	@Override
	public List<Scheduler> mainScheduler(Map<String, Object> map) {
		return schedulerDAO.mainScheduler(map);
	}


	@Override
	public int insertSchedule(Scheduler sch) {
		return schedulerDAO.insertSchedule(sch);
	}

	@Override
	public int deleteSchedule(int no) {
		return schedulerDAO.deleteSchedule(no);
	}

	@Override
	public Scheduler selectOne(int no) {
		return schedulerDAO.selectOne(no);
	}

	@Override
	public int updateSchedule(Scheduler sch) {
		return schedulerDAO.updateSchedule(sch);
	}

	@Override
	public int insertTodo(List<Scheduler> list) {
		
		int result = 0;
		for(Scheduler sch : list) 
			result = schedulerDAO.insertTodo(sch);
		
		return result;
	}

	@Override
	public int deleteTodo(Map<String, Object> map) {
		return schedulerDAO.deleteTodo(map);
	}


	@Override
	public List<Scheduler> selectToDoList(String memberId) {
		return schedulerDAO.selectToDoList(memberId);
	}

	
	
	public Scheduler dDaySearch(Map<String, Object> map) {
		return schedulerDAO.dDaySearch(map);
	}


	
}
