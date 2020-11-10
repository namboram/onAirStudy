package com.kh.onairstudy.warning.model.dao;

import java.util.HashMap;

import com.kh.onairstudy.warning.model.vo.Warning;

public interface WarningDAO {

	int giveWarning(HashMap<String, Object> param);

	Warning selectWarningRecord(HashMap<String, Object> param);

	int updateWarning(HashMap<String, Object> param);

	int forceWithDraw(HashMap<String, Object> param);

}
