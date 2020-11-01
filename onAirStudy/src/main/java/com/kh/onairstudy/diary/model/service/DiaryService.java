package com.kh.onairstudy.diary.model.service;


import java.util.List;
import java.util.Map;

import com.kh.onairstudy.diary.model.vo.Diary;
import com.kh.onairstudy.diary.model.vo.DiaryReply;


public interface DiaryService {

	List<Diary> selectDiaryList(Map<String, Object> map);


	int insertDiary(Diary diary);


	Diary selectOneDiary(int no);
	
	List<DiaryReply> selectDiaryReplyList(int diaryNo);

	int insertDiaryReply(DiaryReply diaryReply);

	int deleteDiaryReply(DiaryReply diaryReply);

	int deleteDiary(int no);


	int totalDiary(Map<String, Object> map);






}
