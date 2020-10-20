package com.kh.onairstudy.servicecenter.model.service;

import java.util.List;

import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

public interface ServiceCenterService {

	List<ServiceCenter> selectServiceList();

	List<ServiceContent> selectServiceContentList();

}
