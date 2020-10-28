package com.kh.onairstudy.studytime.model.dao;

import java.util.List;

import com.kh.onairstudy.studytime.model.vo.Studytime;

public interface StudytimeDAO {

	List<Studytime> selectList(String memberId);
	
	void insertStudyTime(Studytime studytime);
	
	List<String> selectsrList(String memberId);

}
