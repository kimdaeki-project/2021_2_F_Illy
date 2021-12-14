package com.c.illy.license;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LicenseRepository {

	public int setSerialNumber(LicenseVO licenseVO) throws Exception;
}
