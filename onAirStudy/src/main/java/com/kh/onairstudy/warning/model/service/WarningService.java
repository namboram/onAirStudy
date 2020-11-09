package com.kh.onairstudy.warning.model.service;

import java.util.HashMap;

public interface WarningService {

	int giveWarning(HashMap<String, Object> param);

	int forceWithDraw(HashMap<String, Object> param);

}
