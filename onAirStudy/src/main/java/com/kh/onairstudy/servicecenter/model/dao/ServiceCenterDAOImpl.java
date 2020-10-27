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
	public List<ServiceCenter> selectServiceList(PagingCriteria cri) {
		return sqlSession.selectList("service.selectServiceList", cri);
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
//		map.put("start", start); 
//		map.put("end", end);
		
		//매개변수는 시작 레코드의 번호, 끝 번호, 옵션과 키워드가 들어간다.
		return sqlSession.selectList("service.listAll" , map);
	}

	@Override
	public int totalCount(String search_option, String keyword, int category) {
		
		//맵에 자료 저장
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("category", category);
//		map.put("start", start); 
//		map.put("end", end);
				
		//매개변수는 시작 레코드의 번호, 끝 번호, 옵션과 키워드가 들어간다.
		return sqlSession.selectOne("service.totalCount", map);
				
	}

	


}
