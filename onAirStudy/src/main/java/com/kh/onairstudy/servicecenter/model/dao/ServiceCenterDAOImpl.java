package com.kh.onairstudy.servicecenter.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.common.PagingCriteria;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

@Repository
public class ServiceCenterDAOImpl implements ServiceCenterDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<ServiceCenter> selectServiceList(Map<String, Object> map) {
		return sqlSession.selectList("service.selectServiceList", map);
	}

	@Override
	public List<ServiceContent> selectServiceContentList() {
		return sqlSession.selectList("service.selectServiceContentList");
	}

	@Override
	public int insert(ServiceCenter servicecenter) {
		return sqlSession.insert("service.insertService" , servicecenter);
	}

	@Override
	public List<ServiceCenter> listAll(String search_option, String keyword, int category) {		
		//맵에 자료 저장
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("category", category);
		
		//매개변수는 옵션과 키워드가 들어간다.
		return sqlSession.selectList("service.listAll" , map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		
		//매개변수는 옵션과 키워드가 들어간다.
		return sqlSession.selectOne("service.totalCount", map);
				
	}

	
	@Override
	public Map<String, Object> serviceDetail(int no) {
		return sqlSession.selectOne("service.serviceDetail",no);
	}


	@Override
	public Object selectService(int no) {
		return sqlSession.selectOne("service.serviceDetail", no);
	}

	@Override
	public int serviceUpdate(ServiceCenter service) {
		return sqlSession.update("service.serviceUpdate", service);
	}

	@Override
	public int serviceDelete(int no) {
		return sqlSession.delete("service.serviceDelete" , no);
	}



	


}
