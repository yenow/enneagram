package com.enneagram.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueryVO {

	private int qno;
	private String query;
	private int type;
}
