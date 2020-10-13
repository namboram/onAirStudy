package com.kh.onairstudy.scheduler.model.service;

import java.util.List;
import java.util.Map;

public interface SchedulerService {

	List<Map<String, Object>> mainScheduler(String memberId);

}
