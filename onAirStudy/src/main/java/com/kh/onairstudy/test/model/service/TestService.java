package com.kh.onairstudy.test.model.service;

import java.util.List;

import com.kh.onairstudy.test.model.vo.Test;

public interface TestService {
	
	int insertQuestion(Test test);

	List<Test> selectStudyNo();

	List<Test> selectQuestion(int srNo);

	int updatePoint(String memberId);

	int selectCountQuestion(int srNo);

}
