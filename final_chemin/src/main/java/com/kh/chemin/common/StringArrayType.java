package com.kh.chemin.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayType implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if(parameter!=null) {
			ps.setString(i, String.join(",", parameter));
		}else {
			ps.setString(i, "");
		}
		
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String columeValue=rs.getString(columnName);
		String[] columArray=columeValue.split(",");
		return columArray;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String columeValue=rs.getString(columnIndex);
		String[] columArray=columeValue.split(",");
		return columArray;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String columeValue=cs.getString(columnIndex);
		String[] columArray=columeValue.split(",");
		return columArray;
	}

}
