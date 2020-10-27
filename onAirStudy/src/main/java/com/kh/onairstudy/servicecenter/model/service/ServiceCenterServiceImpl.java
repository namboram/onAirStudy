package com.kh.onairstudy.servicecenter.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.common.PagingCriteria;
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
	public List<ServiceCenter> selectServiceList(PagingCriteria cri) {
		return serviceCenterDAO.selectServiceList(cri);
	}

	@Override
	public List<ServiceContent> selectServiceContentList() {
		return serviceCenterDAO.selectServiceContentList();
	}

	@Override
	public int insertService(ServiceCenter servicecenter) {
		return serviceCenterDAO.insert(servicecenter);
	}

	@Override
	public List<ServiceCenter> listAll(String search_option, String keyword, int category) {
		 return serviceCenterDAO.listAll(search_option, keyword, category);
	}

	@Override
	public int totalCount(String search_option, String keyword, int category) {
		return serviceCenterDAO.totalCount(search_option, keyword, category);
	}

	@Override
	public Map<String, Object> serviceDetail(int no) {
		return serviceCenterDAO.serviceDetail(no);
	}

}
