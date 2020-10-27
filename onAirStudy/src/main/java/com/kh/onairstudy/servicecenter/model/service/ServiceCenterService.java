package com.kh.onairstudy.servicecenter.model.service;

import java.util.List;

import com.kh.onairstudy.common.PagingCriteria;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

public interface ServiceCenterService {

	List<ServiceCenter> selectServiceList(PagingCriteria cri);

	List<ServiceContent> selectServiceContentList();

	int insertService(ServiceCenter servicecenter);

	//목록 (페이지 나누기, 검색 기능을 포함)
    //매개변수는 시작 레코드 번호, 끝번호, 옵션과 키워드가 들어간다.
	List<ServiceCenter> listAll(String search_option, String keyword, int category);

	int totalCount(String search_option, String keyword, int category);
	
}
