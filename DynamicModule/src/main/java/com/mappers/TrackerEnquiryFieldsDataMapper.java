package main.java.com.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import main.java.com.models.TrackerEnquiryFieldsDataModel;

public class TrackerEnquiryFieldsDataMapper implements RowMapper<TrackerEnquiryFieldsDataModel>{

	@Override
	public TrackerEnquiryFieldsDataModel mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		TrackerEnquiryFieldsDataModel enq = new TrackerEnquiryFieldsDataModel(resultSet.getInt(1), resultSet.getInt(2), resultSet.getString(3),
				resultSet.getInt(4), resultSet.getString(5), resultSet.getString(6));
		return enq;
	}

}
