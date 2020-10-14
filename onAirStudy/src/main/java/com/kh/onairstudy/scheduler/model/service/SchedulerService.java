package com.kh.onairstudy.scheduler.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.scheduler.model.vo.Scheduler;

public interface SchedulerService {

	List<Map<String, Object>> mainScheduler(String memberId);

	int insertSchedule(Scheduler sch);

}
