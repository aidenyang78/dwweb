/**
 * 
 */
package com.site.contents.main;

import com.core.comm.vo.CommonVo;

/**
 * @Class Name : MainVo.java
 * @Description : MainVo Class
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
public class MainVo{

	private String idx;	//순번
	/*도로(국도) 정보 조회*/
	public String seq;			//도로 순번
	public String polCd;		//경찰서 코드
	public String polNm;
	public String polDistrict;	//지구 코드 : 1001:동부, 1002:서부, 1003:남부, 1004:북부
	public String routeNm;		//도록(국도)명
	public String regUserid;		//등록자
	public String regDate;		//등록일
	public String updtUserid;
	public String updtDate;
	public String delUserid;
	
	/*교차로정보 조회*/
	public String routeCd;				//도로코드
	public String crossroadSeq;			//교차로 순번
	public String crossroadNm;			//교차로명
	public String roadNm;				//도로명(북부만 존재)
	public String maxLat;
	public String maxLng;
	public String minLat;
	public String minLng;
	public String lat;					//위도
	public String lng;					//경도
	
	/*검색 조건 추가*/
	public String delDate;
	public String keyKind;
	public String keyWord;
	public String stdDate;
	public String endDate;
	public String listType;				//리스트 형태 : 텍스트 / gui	
	public String linkedSeq;			//외부 연동 키
	public String installDate;			//신호장비 설치일
	public String totCnt;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPolCd() {
		return polCd;
	}
	public void setPolCd(String polCd) {
		this.polCd = polCd;
	}
	public String getPolNm() {
		return polNm;
	}
	public void setPolNm(String polNm) {
		this.polNm = polNm;
	}
	public String getPolDistrict() {
		return polDistrict;
	}
	public void setPolDistrict(String polDistrict) {
		this.polDistrict = polDistrict;
	}
	public String getRouteNm() {
		return routeNm;
	}
	public void setRouteNm(String routeNm) {
		this.routeNm = routeNm;
	}
	public String getRegUserid() {
		return regUserid;
	}
	public void setRegUserid(String regUserid) {
		this.regUserid = regUserid;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdtUserid() {
		return updtUserid;
	}
	public void setUpdtUserid(String updtUserid) {
		this.updtUserid = updtUserid;
	}
	public String getUpdtDate() {
		return updtDate;
	}
	public void setUpdtDate(String updtDate) {
		this.updtDate = updtDate;
	}
	public String getDelUserid() {
		return delUserid;
	}
	public void setDelUserid(String delUserid) {
		this.delUserid = delUserid;
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
	public String getCrossroadNm() {
		return crossroadNm;
	}
	public void setCrossroadNm(String crossroadNm) {
		this.crossroadNm = crossroadNm;
	}
	public String getRoadNm() {
		return roadNm;
	}
	public void setRoadNm(String roadNm) {
		this.roadNm = roadNm;
	}
	public String getMaxLat() {
		return maxLat;
	}
	public void setMaxLat(String maxLat) {
		this.maxLat = maxLat;
	}
	public String getMaxLng() {
		return maxLng;
	}
	public void setMaxLng(String maxLng) {
		this.maxLng = maxLng;
	}
	public String getMinLat() {
		return minLat;
	}
	public void setMinLat(String minLat) {
		this.minLat = minLat;
	}
	public String getMinLng() {
		return minLng;
	}
	public void setMinLng(String minLng) {
		this.minLng = minLng;
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
	public String getDelDate() {
		return delDate;
	}
	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}
	public String getKeyKind() {
		return keyKind;
	}
	public void setKeyKind(String keyKind) {
		this.keyKind = keyKind;
	}
	public String getStdDate() {
		return stdDate;
	}
	public void setStdDate(String stdDate) {
		this.stdDate = stdDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public String getLinkedSeq() {
		return linkedSeq;
	}
	public void setLinkedSeq(String linkedSeq) {
		this.linkedSeq = linkedSeq;
	}
	public String getInstallDate() {
		return installDate;
	}
	public void setInstallDate(String installDate) {
		this.installDate = installDate;
	}
	public String getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(String totCnt) {
		this.totCnt = totCnt;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	
	
	

}
