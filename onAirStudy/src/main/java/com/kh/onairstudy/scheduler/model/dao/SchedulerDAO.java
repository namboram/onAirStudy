package com.kh.onairstudy.scheduler.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.scheduler.model.vo.Scheduler;

public interface SchedulerDAO {

	List<Scheduler> mainScheduler(String memberId);

	int insertSchedule(Scheduler sch);

	int deleteSchedule(int no);

	Scheduler selectOne(int no);

	int updateSchedule(Scheduler sch);

}
