package com.kh.onairstudy.scheduler.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.onairstudy.scheduler.model.vo.Scheduler;

public interface SchedulerService {

	List<Scheduler> mainScheduler(String memberId);

	int insertSchedule(Scheduler sch);

	int deleteSchedule(int no);

	Scheduler selectOne(int no);

	int updateSchedule(Scheduler sch);

	int insertTodo(List<Scheduler> list);

	int deleteTodo(Map<String, Object> map);

}
