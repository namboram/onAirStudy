package com.kh.onairstudy.servicecenter.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.servicecenter.model.dao.ServiceCenterDAO;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {

	@Autowired
	private ServiceCenterDAO serviceCenterDAO;
}
