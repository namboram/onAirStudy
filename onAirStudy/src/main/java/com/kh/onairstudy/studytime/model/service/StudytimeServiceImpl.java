package com.kh.onairstudy.studytime.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.studytime.model.dao.StudytimeDAO;
import com.kh.onairstudy.studytime.model.vo.Studytime;

@Service
public class StudytimeServiceImpl implements StudytimeService {

	@Autowired
	private StudytimeDAO studytimeDAO;

	@Override
	public List<Studytime> selectList(String memberId) {
		return studytimeDAO.selectList(memberId);
	}

	@Override
	public void insertStudyTime(Studytime studytime) {
		studytimeDAO.insertStudyTime(studytime);
		
	}

	@Override
	public List<String> selectsrList(String memberId) {
		return studytimeDAO.selectsrList(memberId);
	}


	
}
