package main.java.com.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import main.java.com.models.TrackerEnqFieldsModel;

public class TrackerMapper implements RowMapper<TrackerEnqFieldsModel> {
	@Override
	public TrackerEnqFieldsModel mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		TrackerEnqFieldsModel enq = new TrackerEnqFieldsModel(resultSet.getInt(1), resultSet.getInt(2),
				resultSet.getString(3), resultSet.getInt(4), resultSet.getString(5), resultSet.getString(6),
				resultSet.getInt(7), resultSet.getString(8));
		return enq;
	}
}
