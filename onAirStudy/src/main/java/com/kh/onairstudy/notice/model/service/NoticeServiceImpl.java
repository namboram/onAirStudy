package com.kh.onairstudy.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.notice.model.dao.NoticeDAO;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<Map<String, Object>> noticeList() {
		return noticeDAO.noticeList();
	}

	@Override
	public Map<String, Object> noticeDetail(int no) {
		return noticeDAO.noticeDetail(no);
	}

	@Override
	public int updateCnt(int no) {
		return noticeDAO.updateCnt(no);
	}
	
	
}
