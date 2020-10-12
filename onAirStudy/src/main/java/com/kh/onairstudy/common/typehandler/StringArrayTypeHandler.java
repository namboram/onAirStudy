package com.kh.onairstudy.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;


@MappedTypes(String[].class)
@MappedJdbcTypes(JdbcType.VARCHAR)
public class StringArrayTypeHandler extends BaseTypeHandler<String[]>{

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType)
			throws SQLException {
		String value = String.join(",", parameter);
		ps.setString(i, value);
		
		
	}

	
	/**
	 * VARCHAR -> String[]
	 */
	@Override
	public String[] getNullableResult(ResultSet rs, String columnName) throws SQLException {
		String hobby = rs.getString(columnName);
		return hobby != null ? hobby.split(",") : null;
	}

	@Override
	public String[] getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		String hobby = rs.getString(columnIndex);
		return hobby != null ? hobby.split(",") : null;
	}

	@Override
	public String[] getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String hobby = cs.getString(columnIndex);
		return hobby != null ? hobby.split(",") : null;
	}

}
