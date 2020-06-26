package com.site.contents.statistics;

import com.site.contents.mgmtreg.MgmtRegVo;

/**
 * @Class Name : StatisticsVo
 * @Description : StatisticsVo Class
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
public class StatisticsVo extends MgmtRegVo{
	
	/*도로(국도) 정보 조회*/
	public String seq;			//도로 순번
	public String polCd;		//경찰서 코드
	public String polDistrict;	//지구 코드 : 1001:동부, 1002:서부, 1003:남부, 1004:북부
	public String routeNm;		//도록(국도)명
	public String regUserid;		//등록자
	public String regDate;		//등록일
	public String updtUserid;
	public String updtDate;
	public String delUserid;
	
	/*교차로정보 조회*/
	public String routeCd;				//도로코드
	public String crossroadNm;			//교차로명
	public String roadNm;				//도로명(북부만 존재)
	public String lat;					//위도
	public String lng;					//경도
	
	/*검색 조건 추가*/
	public String delDate;
	public String keyKind;
	public String stdDate;
	public String endDate;
	public String listType;			//리스트 형태 : 텍스트 / gui

	public String cnt1;
	public String cnt2;
	public String cnt3;
	public String cnt4;
	public String cnt5;
	public String cnt6;
	public String cnt7;
	public String cnt8;
	public String cnt9;
	public String cnt10;
	public String cnt11;
	public String cnt12;
	public String cnt13;
	public String cnt14;
	public String cnt15;
	public String cnt16;
	public String cnt17;
	public String cnt18;
	public String cnt19;
	public String cnt20;
	public String cnt21;
	public String cnt22;
	public String cnt23;
	public String cnt24;
	public String cnt25;
	public String cnt26;
	public String cnt27;
	public String cnt28;
	public String cnt29;
	public String cnt30;
	public String cnt31;
	public String cnt32;
	public String cnt33;
	public String cnt34;
	public String cnt35;	
	
	public String totCnt;
	public String totCnt1;
	public String totCnt2;
	public String totCnt3;
	public String totCnt4;
	public String totCnt5;
	public String totCnt6;
	public String totCnt7;
	public String totCnt8;
	public String totCnt9;
	public String totCnt10;
	public String totCnt11;
	public String totCnt12;
	public String totCnt13;
	public String totCnt14;
	public String totCnt15;
	public String totCnt16;
	public String totCnt17;
	public String totCnt18;
	public String totCnt19;
	public String totCnt20;
	public String totCnt21;
	public String totCnt22;
	public String totCnt23;
	public String totCnt24;
	public String totCnt25;
	public String totCnt26;
	public String totCnt27;
	public String totCnt28;
	public String totCnt29;
	public String totCnt30;
	public String totCnt31;
	public String totCnt32;
	public String totCnt33;
	public String totCnt34;
	public String totCnt35;
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
	public String getRouteCd() {
		return routeCd;
	}
	public void setRouteCd(String routeCd) {
		this.routeCd = routeCd;
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
	public String getCnt1() {
		return cnt1;
	}
	public void setCnt1(String cnt1) {
		this.cnt1 = cnt1;
	}
	public String getCnt2() {
		return cnt2;
	}
	public void setCnt2(String cnt2) {
		this.cnt2 = cnt2;
	}
	public String getCnt3() {
		return cnt3;
	}
	public void setCnt3(String cnt3) {
		this.cnt3 = cnt3;
	}
	public String getCnt4() {
		return cnt4;
	}
	public void setCnt4(String cnt4) {
		this.cnt4 = cnt4;
	}
	public String getCnt5() {
		return cnt5;
	}
	public void setCnt5(String cnt5) {
		this.cnt5 = cnt5;
	}
	public String getCnt6() {
		return cnt6;
	}
	public void setCnt6(String cnt6) {
		this.cnt6 = cnt6;
	}
	public String getCnt7() {
		return cnt7;
	}
	public void setCnt7(String cnt7) {
		this.cnt7 = cnt7;
	}
	public String getCnt8() {
		return cnt8;
	}
	public void setCnt8(String cnt8) {
		this.cnt8 = cnt8;
	}
	public String getCnt9() {
		return cnt9;
	}
	public void setCnt9(String cnt9) {
		this.cnt9 = cnt9;
	}
	public String getCnt10() {
		return cnt10;
	}
	public void setCnt10(String cnt10) {
		this.cnt10 = cnt10;
	}
	public String getCnt11() {
		return cnt11;
	}
	public void setCnt11(String cnt11) {
		this.cnt11 = cnt11;
	}
	public String getCnt12() {
		return cnt12;
	}
	public void setCnt12(String cnt12) {
		this.cnt12 = cnt12;
	}
	public String getCnt13() {
		return cnt13;
	}
	public void setCnt13(String cnt13) {
		this.cnt13 = cnt13;
	}
	public String getCnt14() {
		return cnt14;
	}
	public void setCnt14(String cnt14) {
		this.cnt14 = cnt14;
	}
	public String getCnt15() {
		return cnt15;
	}
	public void setCnt15(String cnt15) {
		this.cnt15 = cnt15;
	}
	public String getCnt16() {
		return cnt16;
	}
	public void setCnt16(String cnt16) {
		this.cnt16 = cnt16;
	}
	public String getCnt17() {
		return cnt17;
	}
	public void setCnt17(String cnt17) {
		this.cnt17 = cnt17;
	}
	public String getCnt18() {
		return cnt18;
	}
	public void setCnt18(String cnt18) {
		this.cnt18 = cnt18;
	}
	public String getCnt19() {
		return cnt19;
	}
	public void setCnt19(String cnt19) {
		this.cnt19 = cnt19;
	}
	public String getCnt20() {
		return cnt20;
	}
	public void setCnt20(String cnt20) {
		this.cnt20 = cnt20;
	}
	public String getCnt21() {
		return cnt21;
	}
	public void setCnt21(String cnt21) {
		this.cnt21 = cnt21;
	}
	public String getCnt22() {
		return cnt22;
	}
	public void setCnt22(String cnt22) {
		this.cnt22 = cnt22;
	}
	public String getCnt23() {
		return cnt23;
	}
	public void setCnt23(String cnt23) {
		this.cnt23 = cnt23;
	}
	public String getCnt24() {
		return cnt24;
	}
	public void setCnt24(String cnt24) {
		this.cnt24 = cnt24;
	}
	public String getCnt25() {
		return cnt25;
	}
	public void setCnt25(String cnt25) {
		this.cnt25 = cnt25;
	}
	public String getCnt26() {
		return cnt26;
	}
	public void setCnt26(String cnt26) {
		this.cnt26 = cnt26;
	}
	public String getCnt27() {
		return cnt27;
	}
	public void setCnt27(String cnt27) {
		this.cnt27 = cnt27;
	}
	public String getCnt28() {
		return cnt28;
	}
	public void setCnt28(String cnt28) {
		this.cnt28 = cnt28;
	}
	public String getCnt29() {
		return cnt29;
	}
	public void setCnt29(String cnt29) {
		this.cnt29 = cnt29;
	}
	public String getCnt30() {
		return cnt30;
	}
	public void setCnt30(String cnt30) {
		this.cnt30 = cnt30;
	}
	public String getCnt31() {
		return cnt31;
	}
	public void setCnt31(String cnt31) {
		this.cnt31 = cnt31;
	}
	public String getCnt32() {
		return cnt32;
	}
	public void setCnt32(String cnt32) {
		this.cnt32 = cnt32;
	}
	public String getCnt33() {
		return cnt33;
	}
	public void setCnt33(String cnt33) {
		this.cnt33 = cnt33;
	}
	public String getCnt34() {
		return cnt34;
	}
	public void setCnt34(String cnt34) {
		this.cnt34 = cnt34;
	}
	public String getCnt35() {
		return cnt35;
	}
	public void setCnt35(String cnt35) {
		this.cnt35 = cnt35;
	}
	public String getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(String totCnt) {
		this.totCnt = totCnt;
	}
	public String getTotCnt1() {
		return totCnt1;
	}
	public void setTotCnt1(String totCnt1) {
		this.totCnt1 = totCnt1;
	}
	public String getTotCnt2() {
		return totCnt2;
	}
	public void setTotCnt2(String totCnt2) {
		this.totCnt2 = totCnt2;
	}
	public String getTotCnt3() {
		return totCnt3;
	}
	public void setTotCnt3(String totCnt3) {
		this.totCnt3 = totCnt3;
	}
	public String getTotCnt4() {
		return totCnt4;
	}
	public void setTotCnt4(String totCnt4) {
		this.totCnt4 = totCnt4;
	}
	public String getTotCnt5() {
		return totCnt5;
	}
	public void setTotCnt5(String totCnt5) {
		this.totCnt5 = totCnt5;
	}
	public String getTotCnt6() {
		return totCnt6;
	}
	public void setTotCnt6(String totCnt6) {
		this.totCnt6 = totCnt6;
	}
	public String getTotCnt7() {
		return totCnt7;
	}
	public void setTotCnt7(String totCnt7) {
		this.totCnt7 = totCnt7;
	}
	public String getTotCnt8() {
		return totCnt8;
	}
	public void setTotCnt8(String totCnt8) {
		this.totCnt8 = totCnt8;
	}
	public String getTotCnt9() {
		return totCnt9;
	}
	public void setTotCnt9(String totCnt9) {
		this.totCnt9 = totCnt9;
	}
	public String getTotCnt10() {
		return totCnt10;
	}
	public void setTotCnt10(String totCnt10) {
		this.totCnt10 = totCnt10;
	}
	public String getTotCnt11() {
		return totCnt11;
	}
	public void setTotCnt11(String totCnt11) {
		this.totCnt11 = totCnt11;
	}
	public String getTotCnt12() {
		return totCnt12;
	}
	public void setTotCnt12(String totCnt12) {
		this.totCnt12 = totCnt12;
	}
	public String getTotCnt13() {
		return totCnt13;
	}
	public void setTotCnt13(String totCnt13) {
		this.totCnt13 = totCnt13;
	}
	public String getTotCnt14() {
		return totCnt14;
	}
	public void setTotCnt14(String totCnt14) {
		this.totCnt14 = totCnt14;
	}
	public String getTotCnt15() {
		return totCnt15;
	}
	public void setTotCnt15(String totCnt15) {
		this.totCnt15 = totCnt15;
	}
	public String getTotCnt16() {
		return totCnt16;
	}
	public void setTotCnt16(String totCnt16) {
		this.totCnt16 = totCnt16;
	}
	public String getTotCnt17() {
		return totCnt17;
	}
	public void setTotCnt17(String totCnt17) {
		this.totCnt17 = totCnt17;
	}
	public String getTotCnt18() {
		return totCnt18;
	}
	public void setTotCnt18(String totCnt18) {
		this.totCnt18 = totCnt18;
	}
	public String getTotCnt19() {
		return totCnt19;
	}
	public void setTotCnt19(String totCnt19) {
		this.totCnt19 = totCnt19;
	}
	public String getTotCnt20() {
		return totCnt20;
	}
	public void setTotCnt20(String totCnt20) {
		this.totCnt20 = totCnt20;
	}
	public String getTotCnt21() {
		return totCnt21;
	}
	public void setTotCnt21(String totCnt21) {
		this.totCnt21 = totCnt21;
	}
	public String getTotCnt22() {
		return totCnt22;
	}
	public void setTotCnt22(String totCnt22) {
		this.totCnt22 = totCnt22;
	}
	public String getTotCnt23() {
		return totCnt23;
	}
	public void setTotCnt23(String totCnt23) {
		this.totCnt23 = totCnt23;
	}
	public String getTotCnt24() {
		return totCnt24;
	}
	public void setTotCnt24(String totCnt24) {
		this.totCnt24 = totCnt24;
	}
	public String getTotCnt25() {
		return totCnt25;
	}
	public void setTotCnt25(String totCnt25) {
		this.totCnt25 = totCnt25;
	}
	public String getTotCnt26() {
		return totCnt26;
	}
	public void setTotCnt26(String totCnt26) {
		this.totCnt26 = totCnt26;
	}
	public String getTotCnt27() {
		return totCnt27;
	}
	public void setTotCnt27(String totCnt27) {
		this.totCnt27 = totCnt27;
	}
	public String getTotCnt28() {
		return totCnt28;
	}
	public void setTotCnt28(String totCnt28) {
		this.totCnt28 = totCnt28;
	}
	public String getTotCnt29() {
		return totCnt29;
	}
	public void setTotCnt29(String totCnt29) {
		this.totCnt29 = totCnt29;
	}
	public String getTotCnt30() {
		return totCnt30;
	}
	public void setTotCnt30(String totCnt30) {
		this.totCnt30 = totCnt30;
	}
	public String getTotCnt31() {
		return totCnt31;
	}
	public void setTotCnt31(String totCnt31) {
		this.totCnt31 = totCnt31;
	}
	public String getTotCnt32() {
		return totCnt32;
	}
	public void setTotCnt32(String totCnt32) {
		this.totCnt32 = totCnt32;
	}
	public String getTotCnt33() {
		return totCnt33;
	}
	public void setTotCnt33(String totCnt33) {
		this.totCnt33 = totCnt33;
	}
	public String getTotCnt34() {
		return totCnt34;
	}
	public void setTotCnt34(String totCnt34) {
		this.totCnt34 = totCnt34;
	}
	public String getTotCnt35() {
		return totCnt35;
	}
	public void setTotCnt35(String totCnt35) {
		this.totCnt35 = totCnt35;
	}
	
	

}
