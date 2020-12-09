package com.site.contents.crossroadinfo;

import com.core.comm.vo.CommonVo;

/**
 * @Class Name : CrossroadInfoVo
 * @Description : CrossroadInfoVo Class
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2020.06.18           최초생성
 *
 * @author 양성진
 * @since 2020.06.18
 * @version 1.0
 * @see
 *
 */
public class CrossroadInfoVo extends CommonVo{
	
	public String seq;					//교차로 순번 : installCrossroadCd
	public String polCd;				//경찰서 코드
	public String polDistrict;			//지구 코드
	public String routeCd;				//도로코드
	public String routeNm;				//도로명
	public String crossroadNm;			//교차로명
	public String roadNm;				//도로명(북부만 존재)
	public String lat;					//위도
	public String lng;					//경도
	public String regUserid;
	public String regDate;
	public String updtUserid;
	public String updtDate;
	public String delUserid;
	public String delDate;
	public String linkedSeq;			//외부 연동 키
	public String linkedNm;
	public String installDate;			//

	public String totCnt;

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

	public String getRouteNm() {
		return routeNm;
	}

	public void setRouteNm(String routeNm) {
		this.routeNm = routeNm;
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

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public String getLinkedSeq() {
		return linkedSeq;
	}

	public void setLinkedSeq(String linkedSeq) {
		this.linkedSeq = linkedSeq;
	}

	public String getLinkedNm() {
		return linkedNm;
	}

	public void setLinkedNm(String linkedNm) {
		this.linkedNm = linkedNm;
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

	
}
