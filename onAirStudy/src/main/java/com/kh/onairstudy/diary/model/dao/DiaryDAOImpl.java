package com.kh.onairstudy.diary.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.diary.model.vo.Diary;

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
	public Diary selectOneDiaryCollection(int no) {
		return sqlSession.selectOne("diary.selectOneDiaryCollection", no);
	}
	


}
