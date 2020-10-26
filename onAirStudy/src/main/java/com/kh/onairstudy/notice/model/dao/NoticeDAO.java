package com.kh.onairstudy.notice.model.dao;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {

	List<Map<String, Object>> noticeList();

	Map<String, Object> noticeDetail(int no);

}
