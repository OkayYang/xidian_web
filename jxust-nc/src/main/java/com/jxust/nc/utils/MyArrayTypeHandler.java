package com.jxust.nc.utils;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyArrayTypeHandler implements TypeHandler<String[]> {
    private static final String DELIMITER = ",";

    @Override
    public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
        if (parameter != null) {
            ps.setString(i, String.join(DELIMITER, parameter));
        } else {
            ps.setString(i, null);
        }
    }

    @Override
    public String[] getResult(ResultSet rs, String columnName) throws SQLException {
        String string = rs.getString(columnName);
        return string != null ? string.split(DELIMITER) : null;
    }

    @Override
    public String[] getResult(ResultSet resultSet, int i) throws SQLException {
        return new String[0];
    }

    @Override
    public String[] getResult(CallableStatement callableStatement, int i) throws SQLException {
        return new String[0];
    }


    // 实现其他方法
}