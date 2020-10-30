package com.kh.onairstudy.diary.model.dao;

import java.util.List; 
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.diary.model.vo.Diary;
import com.kh.onairstudy.diary.model.vo.DiaryAttachment;
import com.kh.onairstudy.diary.model.vo.DiaryReply;

@Repository
public class DiaryDAOImpl implements DiaryDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Diary> selectDiaryList(Map<String, Object> map) {
		return sqlSession.selectList("diary.selectDiaryList", map);
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
	public int insertDiaryReply(DiaryReply diaryReply) {
		return sqlSession.insert("diaryReply.insertDiaryReply", diaryReply);
	}


	@Override
	public List<DiaryReply> selectDiaryReplyList(int diaryNo) {
		return sqlSession.selectList("diaryReply.selectDiaryReplyList", diaryNo);
	}


	@Override
	public int deleteDiary(int no) {
		return sqlSession.delete("diary.deleteDiary", no);
	}


	@Override
	public int deleteDiaryReply(DiaryReply diaryReply) {
		return sqlSession.delete("diaryReply.deleteDiaryReply", diaryReply);

	}


	@Override
	public int totalDiary(Map<String, Object> map) {
		return sqlSession.selectOne("diary.totalDiary", map);
	}



	
	

	


	


	
	

}
