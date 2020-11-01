package com.kh.onairstudy.diary.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onairstudy.diary.model.dao.DiaryDAO;
import com.kh.onairstudy.diary.model.vo.Diary;
import com.kh.onairstudy.diary.model.vo.DiaryAttachment;
import com.kh.onairstudy.diary.model.vo.DiaryReply;

@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)
//어떠한 예외가 발생해도 rollback해달라는 말!
@Service
public class DiaryServiceImpl implements DiaryService {


	@Autowired
	private DiaryDAO diaryDAO;

	 @Override public List<Diary> selectDiaryList(Map<String, Object> map) { 
		 return diaryDAO.selectDiaryList(map); 
	}

	@Override
	public int insertDiary(Diary diary) {
		int result = 0;
		//1. board insert
		result = diaryDAO.insertDiary(diary);
		
		//2. attachment insert
//		if(diary.getAttachList() != null) {
//			
//			for(DiaryAttachment attach : diary.getAttachList()) {
//				//생성된 boardNo값 대입하기
//				attach.setDiaryNo(diary.getNo());
//				result = diaryDAO.insertAttachment(attach);
//			}
//			
//		}

		return result;
	}

	@Transactional(readOnly = true)
	@Override
	public Diary selectOneDiary(int no) {
		Diary diary = diaryDAO.selectOneDiary(no); 
		diaryDAO.diaryReadCount(no);
		
		/*
		 * List<DiaryAttachment> attachList = diaryDAO.selectAttachList(no);
		 * diary.setAttachList(attachList);
		 */
		
		return diary;
	}


	@Override
	public int insertDiaryReply(DiaryReply diaryReply) {
		return diaryDAO.insertDiaryReply(diaryReply);
	}


	@Override
	public List<DiaryReply> selectDiaryReplyList(int diaryNo) {
		return diaryDAO.selectDiaryReplyList(diaryNo);
	}


	@Override
	public int deleteDiaryReply(DiaryReply diaryReply) {
		return diaryDAO.deleteDiaryReply(diaryReply);
	}
	@Override
	public int deleteDiary(int no) {
		return diaryDAO.deleteDiary(no);

	}

	@Override
	public int totalDiary(Map<String, Object> map) {
		return diaryDAO.totalDiary(map);
	}
	

	
	


	
}
