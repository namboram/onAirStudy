package com.kh.onairstudy.diary.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.diary.model.vo.Diary;
import com.kh.onairstudy.diary.model.vo.DiaryAttachment;


public interface DiaryDAO {

	List<Diary> selectDiaryList();

	int insertDiary(Diary diary);

	int insertAttachment(DiaryAttachment attach);

	Diary selectOneDiary(int no);

	List<DiaryAttachment> selectAttachList(int no);

	void diaryReadCount(int no);






}
