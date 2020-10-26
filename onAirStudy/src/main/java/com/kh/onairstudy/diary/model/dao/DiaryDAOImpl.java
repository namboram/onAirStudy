package com.kh.onairstudy.diary.model.dao;

import java.util.List; 
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.diary.model.vo.Diary;
import com.kh.onairstudy.diary.model.vo.DiaryAttachment;

@Repository
public class DiaryDAOImpl implements DiaryDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Diary> selectDiaryList() {
		return sqlSession.selectList("diary.selectDiaryList");
	}


	@Override
	public int insertDiary(Diary diary) {
		return sqlSession.insert("diary.insertDiary", diary);
	}


	@Override
	public int insertAttachment(DiaryAttachment attach) {
		return sqlSession.insert("diary.insertAttachment", attach);
	}


	@Override
	public Diary selectOneDiary(int no) {
		return sqlSession.selectOne("diary.selectOneDiary", no);
	}


	@Override
	public List<DiaryAttachment> selectAttachList(int no) {
		return sqlSession.selectList("diary.selectAttachList", no);
	}


	@Override
	public void diaryReadCount(int no) {
		sqlSession.update("diary.diaryReadCount", no);
		
	}

	
	

	@Override
	public Diary selectOneDiary(int no) {
		return sqlSession.selectOne("diary.selectOneDiary",no);
	}



	
	

	


	


	
	

}
