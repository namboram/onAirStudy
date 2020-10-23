package com.kh.onairstudy.diary.model.service;

import java.util.List;

import com.kh.onairstudy.diary.model.vo.Diary;

public interface DiaryService {

	List<Diary> selectDiaryList();

//	int insertDiary(Diary diary);

	Diary selectOneDiaryCollection(int no);

}
