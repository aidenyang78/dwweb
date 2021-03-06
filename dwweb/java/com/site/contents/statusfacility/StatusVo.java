package com.site.contents.statusfacility;

import com.core.comm.vo.CommonVo;

/**
 * @Class Name : StatusVo.java
 * @Description : StatusVo Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2020.06.01           최초생성
 *
 * @author 양성진
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class StatusVo extends CommonVo{
	
	public String no;			//순번
	public String name;			//교차로명
	public String status;		//시설 상태 코드
	
	public String statusno;			//교차로 상태 코드
	public String description;		//교차로 상태코드 설명
	public String linkedCnt;
	
	public String polDistrict;
	public String routeCd;
	public String crossroadSeq;
	public String linkedYn;
	public String lat;
	public String lng;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusno() {
		return statusno;
	}
	public void setStatusno(String statusno) {
		this.statusno = statusno;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLinkedCnt() {
		return linkedCnt;
	}
	public void setLinkedCnt(String linkedCnt) {
		this.linkedCnt = linkedCnt;
	}
	public String getPolDistrict() {
		return polDistrict;
	}
	public void setPolDistrict(String polDistrict) {
		this.polDistrict = polDistrict;
	}
	public String getRouteCd() {
		return routeCd;
	}
	public void setRouteCd(String routeCd) {
		this.routeCd = routeCd;
	}
	public String getCrossroadSeq() {
		return crossroadSeq;
	}
	public void setCrossroadSeq(String crossroadSeq) {
		this.crossroadSeq = crossroadSeq;
	}
	public String getLinkedYn() {
		return linkedYn;
	}
	public void setLinkedYn(String linkedYn) {
		this.linkedYn = linkedYn;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
	
}
