package com.kh.onairstudy.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.notice.model.vo.Notice;

public interface NoticeService {

	List<Map<String, Object>> noticeList(Map<String, Object> search);

	Map<String, Object> noticeDetail(int no);

	int updateCnt(int no);

	int noticeInsert(Map<String, Object> map);

	int noticeUpdate(Notice notice);

	int totalNotice();

}
