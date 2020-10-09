package com.kh.onairstudy.diary.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.diary.model.dao.DiaryDAO;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryDAO diaryDAO;
	
}
