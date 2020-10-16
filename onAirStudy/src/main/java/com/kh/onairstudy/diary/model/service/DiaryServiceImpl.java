package com.kh.onairstudy.diary.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.diary.model.dao.DiaryDAO;
import com.kh.onairstudy.diary.model.vo.Diary;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class DiaryServiceImpl implements DiaryService {


	@Autowired
	private DiaryDAO diaryDAO;
	
	@Override
	public List<Diary> selectDiaryList() {
		return diaryDAO.selectDiaryList();
	}
}
