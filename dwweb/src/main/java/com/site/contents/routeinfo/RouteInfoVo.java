package com.site.contents.routeinfo;
/**
 * @Class Name : RouteInfoVo
 * @Description : RouteInfoVo Class
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
public class RouteInfoVo {
	
	public String seq;			//도로 순번
	public String polCd;		//경찰서 코드
	public String polDistrict;	//지구 코드 : 1001:동부, 1002:서부, 1003:남부, 1004:북부
	public String routeNm;		//도록(국도)명
	public String regUserid;		//등록자
	public String regDate;		//등록일
	public String updtUserid;
	public String updtDate;
	public String delUserid;
	public String delDate;
	
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

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public String getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(String totCnt) {
		this.totCnt = totCnt;
	}

	
}
