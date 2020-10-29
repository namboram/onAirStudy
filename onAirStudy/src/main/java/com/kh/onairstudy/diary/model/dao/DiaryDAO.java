package com.kh.onairstudy.diary.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.diary.model.vo.Diary;
import com.kh.onairstudy.diary.model.vo.DiaryAttachment;
import com.kh.onairstudy.diary.model.vo.DiaryReply;


public interface DiaryDAO {

	List<Diary> selectDiaryList(Map<String, Object> map);

	int insertDiary(Diary diary);

	int insertAttachment(DiaryAttachment attach);

	Diary selectOneDiary(int no);

	List<DiaryAttachment> selectAttachList(int no);

	void diaryReadCount(int no);

	List<DiaryReply> selectDiaryReplyList(int diaryNo);

	int insertDiaryReply(DiaryReply diaryReply);

	int deleteDiaryReply(DiaryReply diaryReply);

	int deleteDiary(int no);

	int totalDiary(Map<String, Object> map);








}
