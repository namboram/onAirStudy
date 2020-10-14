package com.kh.onairstudy.scheduler.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.scheduler.model.vo.Scheduler;

public interface SchedulerDAO {

	List<Map<String, Object>> mainScheduler(String memberId);

	int insertSchedule(Scheduler sch);

}
