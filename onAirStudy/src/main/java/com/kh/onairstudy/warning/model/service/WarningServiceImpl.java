package com.kh.onairstudy.warning.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.warning.model.dao.WarningDAO;
import com.kh.onairstudy.warning.model.vo.Warning;

@Service
public class WarningServiceImpl implements WarningService{

	@Autowired
	private WarningDAO warningDAO;
	
	
	@Override
	public int giveWarning(HashMap<String, Object> param) {
		//회원의 경고 이력이 있는 지 조회 
		Warning warning = warningDAO.selectWarningRecord(param);
		int result;
		if(warning != null)
			// 있다면 update
			result = warningDAO.updateWarning(param);
		else
			// 없다면 insert
			result = warningDAO.giveWarning(param);
		
		
		return result;
	}


	@Override
	public int forceWithDraw(HashMap<String, Object> param) {
		int forceExitOpt = (int)param.get("forceExitOpt");
			
		Warning warning = warningDAO.selectWarningRecord(param);
		
		int result = 3;
		if(warning.getWarningCnt() >= forceExitOpt)
			result = warningDAO.forceWithDraw(param);
		
		return result;
	}

	
	


}
