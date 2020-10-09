package com.kh.onairstudy.test.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.test.model.dao.TestDAO;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class TestServiceImpl implements TestService {

	@Autowired 
	private TestDAO testDAO;
}
