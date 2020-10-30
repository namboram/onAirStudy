package com.kh.onairstudy.test.model.dao;

import java.util.List;

import com.kh.onairstudy.test.model.vo.Test;

public interface TestDAO {
	
	int insertQuestion(Test test);

	List<Test> selectStudyNo();

	List<Test> selectQuestion(int srNo);

	int updatePoint(String memberId);

	int selectCountQuestion(int srNo);


}
