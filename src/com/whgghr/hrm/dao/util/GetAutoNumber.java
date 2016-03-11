package com.whgghr.hrm.dao.util;

import javax.persistence.Entity;

@Entity
public class GetAutoNumber {
	public static String getMaxNuber(String number) {
		if (number.length() == 1)
			number = "00" + number;
		if (number.length() == 2)
			number = "0" + number;
		return number;
	}
}
