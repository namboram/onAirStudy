package com.kh.onairstudy.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.notice.model.dao.NoticeDAO;
import com.kh.onairstudy.notice.model.vo.Notice;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> search) {
		return noticeDAO.noticeList(search);
	}

	@Override
	public Map<String, Object> noticeDetail(int no) {
		return noticeDAO.noticeDetail(no);
	}

	@Override
	public int updateCnt(int no) {
		return noticeDAO.updateCnt(no);
	}

	@Override
	public int noticeInsert(Map<String, Object> map) {
		return noticeDAO.noticeInsert(map);
	}

	@Override
	public int noticeUpdate(Notice notice) {
		return noticeDAO.noticeUptate(notice);
	}

	@Override
	public int totalNotice() {
		return noticeDAO.totalNotice();
	}
	
	
}
