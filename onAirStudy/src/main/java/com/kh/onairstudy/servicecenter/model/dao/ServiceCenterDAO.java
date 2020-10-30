package com.kh.onairstudy.servicecenter.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.common.PagingCriteria;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

public interface ServiceCenterDAO {

	List<ServiceCenter> selectServiceList(Map<String, Object> map);

	List<ServiceContent> selectServiceContentList();

	int insert(ServiceCenter servicecenter);

	//게시글 리스트를 출력하는 메소드 (검색옵션, 키워드 포함)
	List<ServiceCenter> listAll(String search_option, String keyword, int category);

	int totalCount(Map<String, Object> map);

	Map<String, Object> serviceDetail(int no);

	Object selectService(int no);

	int serviceUpdate(ServiceCenter service);

	int serviceDelete(int no);

	

	



	

	

}
