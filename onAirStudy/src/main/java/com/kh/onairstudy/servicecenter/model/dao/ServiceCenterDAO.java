package com.kh.onairstudy.servicecenter.model.dao;

import java.util.List;

import com.kh.onairstudy.common.PagingCriteria;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

public interface ServiceCenterDAO {

	List<ServiceCenter> selectServiceList(PagingCriteria cri);

	List<ServiceContent> selectServiceContentList();

	int insert(ServiceCenter servicecenter);

	//게시글 리스트를 출력하는 메소드 (검색옵션, 키워드, 시작번호와 끝번호 포함)
	List<ServiceCenter> listAll(String search_option, String keyword, int category);

	int totalCount(String search_option, String keyword, int category);


}
