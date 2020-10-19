package com.kh.onairstudy.servicecenter.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.servicecenter.model.dao.ServiceCenterDAO;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {

	@Autowired
	private ServiceCenterDAO serviceCenterDAO;

	@Override
	public List<ServiceCenter> selectServiceList() {
		return serviceCenterDAO.selectServiceList();
	}

	@Override
	public List<ServiceContent> selectServiceContentList() {
		return serviceCenterDAO.selectServiceContentList();
	}
}
