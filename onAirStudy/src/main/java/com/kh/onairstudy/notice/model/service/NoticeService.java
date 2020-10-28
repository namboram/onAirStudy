package com.kh.onairstudy.notice.model.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	List<Map<String, Object>> noticeList();

	Map<String, Object> noticeDetail(int no);

	int updateCnt(int no);

}
