package com.c.illy.member.point;

import lombok.Data;

@Data
public class PointVO {

	private Integer point_id;
	private String point_type;
	private String point_history;
	private Integer point_addOrUse;
	private Integer point_totalPoint;
}
