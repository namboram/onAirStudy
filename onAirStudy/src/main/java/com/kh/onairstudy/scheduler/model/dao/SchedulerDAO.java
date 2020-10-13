package com.kh.onairstudy.scheduler.model.dao;

import java.util.List;
import java.util.Map;

public interface SchedulerDAO {

	List<Map<String, Object>> mainScheduler(String memberId);

}
