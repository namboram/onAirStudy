package com.kh.onairstudy.servicecenter.model.dao;

import java.util.List;

import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

public interface ServiceCenterDAO {

	List<ServiceCenter> selectServiceList();

	List<ServiceContent> selectServiceContentList();

}
