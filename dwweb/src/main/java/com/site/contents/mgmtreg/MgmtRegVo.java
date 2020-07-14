package com.site.contents.mgmtreg;

import com.core.comm.vo.CommonVo;

/**
 * @Class Name : MgmtRegVo
 * @Description : MgmtRegVo Class
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2020.06.01           최초생성
 *
 * @author 양성진
 * @since 2020.06.01
 * @version 1.0
 * @see
 *
 */
public class MgmtRegVo extends CommonVo{
	
	//설치 기본정보 : mgmtRegInstall
	public String mgmtSeq;				//관리순번
	public String polNm;				//경찰서명
	public String polCd;				//경찰서코드
	public String polDistrict;			//지구
	public String routeCd;				//도로(국도) 코드
	public String routeNm;				//도로(국도) 한글명
	public String crossroadCd;			//교차로코드
	public String crossroadNm;			//교차로명
	public String lightNo1;				//신호등번호1
	public String lightNo2;				//신호등번호2
	public String lightNo3;				//신호등번호3
	public String installDate;			//설치년월일	
	public String installCrossroad;			//설치위치
	public String installCrossroadCd;		//설치위치 코드	
	public String installAddrDtl1;		//설치위치 상세 동
	public String installAddrDtl2;		//설치위치 상세 읍
	public String installAddrDtl3;		//설치위치 상세 면
	public String installAddrDtl4;		//설치위치 상세 가
	public String installAddrDtl5;		//설치위치 상세 리
	public String installAddrDtl6;		//설치위치 상세 번지
	public String typeControll;			//신호등 제어방식
	public String typeRoad;				//신호등 도로구분
	public String lat;					//위도
	public String lng;					//경도
	public String regUserid;			//등록 관리자
	public String regDate;				//등록 일자
	public String updtUserid;			//수정 관리자
	public String updtDate;				//수정 일자
	public String delUserid;			//삭제 관리자
	public String delDate;				//삭제 일자

	//공사일반 : mgmtRegConstruction
	public String signalRules;			//신호기 제식
	public String signalWiring;			//신호기 배선
	public String upsType;				//ups 형식
	public String upsBatExchangeDate;	//ups bat  교체일
	public String constructorSignal1;	//신호기 시공자1
	public String constructorSignal2;	//신호기 시공자2
	public String constructorCtrl1;		//제어기 시공자1
	public String constructorCtrl2;		//제어기 시공자2
	public String constructorEng1;		//토목 시공자1
	public String constructorEng2;		//토목 시공자2
	public String constructionExpenses;	//공사비

	//교통신호등 : mgmtRegTrafficLight
	public String kindTrafficLight1;	//차량신호등1
	public String kindTrafficLight2;	//차량신호등2
	public String kindTrafficLight3;	//차량신호등3
	public String kindTrafficLight4;	//차량신호등4
	public String kindTrafficLight5;	//차량신호등5
	public String kindTrafficLight6;	//차량신호등6
	public String kindTrafficLight7;	//차량신호등7
	public String kindTrafficLight8;	//차량신호등8
	public String kindTrafficLight9;	//차량신호등9
	public String kindTrafficLight10;	//차량신호등10
	public String kindTrafficLight11;	//차량신호등11
	public String kindTrafficLight12;	//차량신호등12
	public String kindTrafficLight13;	//차량신호등13
	public String kindTrafficLight14;	//차량신호등14
	public String kindTrafficLight15;	//차량신호등15
	public String kindTrafficLight16;	//차량신호등16
	public String kindLampWarning1;		//차량경보등1
	public String kindLampWarning2;		//차량경보등2
	public String kindLampWarning3;		//차량경보등3
	public String kindLampWarning4;		//차량경보등4
	public String kindLampWarning5;		//차량경보등5
	public String kindLampWarning6;		//차량경보등6
	public String kindLampWarning7;		//차량경보등7
	public String kindLampWarning8;		//차량경보등8
	public String kindLampWarning9;		//차량경보등9
	public String kindLampWarning10;	//차량경보등10
	public String kindLampWarning11;	//차량경보등11
	public String kindLampWarning12;	//차량경보등12
	public String kindLampVariable1;	//차량가변등1
	public String kindLampVariable2;	//차량가변등2
	public String kindLampVariable3;	//차량가변등3
	public String kindLampVariable4;	//차량가변등4
	public String kindLampVariable5;	//차량가변등5
	public String kindLampVariable6;	//차량가변등6
	public String kindLampVariable7;	//차량가변등7
	public String kindLampVariable8;	//차량가변등8
	public String kindLampVariable9;	//차량가변등9
	public String kindLampVariable10;	//차량가변등10
	public String kindLampVariable11;	//차량가변등11
	public String kindLampVariable12;	//차량가변등12
	public String kindLampWalking1;		//보행등(자동차)1
	public String kindLampWalking2;		//보행등(자동차)2
	public String kindLampWalking3;		//보행등(자동차)3
	public String kindLampWalking4;		//보행등(자동차)4
	public String kindLampWalking5;		//보행등(자동차)5
	public String kindLampWalking6;		//보행등(자동차)6
	public String kindLampWalking7;		//보행등(자동차)7
	public String kindLampWalking8;		//보행등(자동차)8
	public String kindLampWalking9;		//보행등(자동차)9
	public String kindLampWalking10;	//보행등(자동차)10
	public String kindLampWalking11;	//보행등(자동차)11
	public String kindLampWalking12;	//보행등(자동차)12

	//신호등 지주 : mgmtRegPillar
	public String pillarVehicleLamp1;	//차량등 지주1
	public String pillarVehicleLamp2;	//차량등 지주2
	public String pillarVehicleLamp3;	//차량등 지주3
	public String pillarVehicleLamp4;	//차량등 지주4
	public String pillarVehicleLamp5;	//차량등 지주5
	public String pillarWalkingLamp1;	//보행등 지주1
	public String pillarWalkingLamp2;	//보행등 지주2
	public String pillarTrafficLight1;	//신호등 부착대1
	public String pillarTrafficLight2;	//신호등 부착대2
	public String pillarTrafficLight3;	//신호등 부착대3
	public String pillarTrafficLight4;	//신호등 부착대4
	public String pillarTrafficLight5;	//신호등 부착대5
	public String pillarIntegration1;	//통합폴 가로등1
	public String pillarIntegration2;	//통합폴 가로등2
	public String attachEtc1;			//기타부착물1
	public String attachEtc2;			//기타부착물2

	// 신호제어기 : mgmtRegController
	public String ctrlElectron;			//전자 제어기
	public String ctrlCycle;			//정주기 제어기
	public String ctrlSensitive;		//교통감응 제어기
	public String signalCycle1;			//신호주기 1현시
	public String signalCycle2;			//신호주기 2현시
	public String signalCycle3;			//신호주기 3현시
	public String signalCycle4;			//신호주기 4현시
	public String signalCycle5;			//신호주기 5현시
	public String signalCycle6;			//신호주기 6현시
	public String signalSec1;			//신호주기 1현시 초
	public String signalSec2;			//신호주기 2현시 초
	public String signalSec3;			//신호주기 3현시 초
	public String signalSec4;			//신호주기 4현시 초
	public String signalSec5;			//신호주기 5현시 초
	public String signalSec6;			//신호주기 6현시 초
	public String signalSecTot;			//신호주기 초 합계
	
	public String currentSelTime1;		//현시시간 선택 시간대
	public String currentTime1;
	public String currentTime11;		//현시시간 초1
	public String currentTime12;		//현시시간 초1
	public String currentTime13;		//현시시간 초1
	public String currentTime14;		//현시시간 초1
	public String currentTime15;		//현시시간 초1
	public String currentTime16;		//현시시간 초1
	
	public String currentSelTime2;		//현시시간 선택 시간대
	public String currentTime2;
	public String currentTime21;			//현시시간 초2
	public String currentTime22;			//현시시간 초2
	public String currentTime23;			//현시시간 초2
	public String currentTime24;			//현시시간 초2
	public String currentTime25;			//현시시간 초2
	public String currentTime26;			//현시시간 초2
	
	public String currentSelTime3;		//현시시간 선택 시간대
	public String currentTime3;
	public String currentTime31;			//현시시간 초3
	public String currentTime32;			//현시시간 초3
	public String currentTime33;			//현시시간 초3
	public String currentTime34;			//현시시간 초3
	public String currentTime35;			//현시시간 초3
	public String currentTime36;			//현시시간 초3
	
	public String currentSelTime4;		//현시시간 선택 시간대
	public String currentTime4;
	public String currentTime41;			//현시시간 초4
	public String currentTime42;			//현시시간 초4
	public String currentTime43;			//현시시간 초4
	public String currentTime44;			//현시시간 초4
	public String currentTime45;			//현시시간 초4
	public String currentTime46;			//현시시간 초4
	
	public String currentSelTime5;		//현시시간 선택 시간대
	public String currentTime5;
	public String currentTime51;			//현시시간 초5
	public String currentTime52;			//현시시간 초5
	public String currentTime53;			//현시시간 초5
	public String currentTime54;			//현시시간 초5
	public String currentTime55;			//현시시간 초5
	public String currentTime56;			//현시시간 초5
	
	public String currentSelTime6;		//현시시간 선택 시간대
	public String currentTime6;
	public String currentTime61;			//현시시간 초6
	public String currentTime62;			//현시시간 초6
	public String currentTime63;			//현시시간 초6
	public String currentTime64;			//현시시간 초6
	public String currentTime65;			//현시시간 초6
	public String currentTime66;			//현시시간 초6
	
	public String currentSelTime7;		//현시시간 선택 시간대
	public String currentTime7;
	public String currentTime71;			//현시시간 초7
	public String currentTime72;			//현시시간 초7
	public String currentTime73;			//현시시간 초7
	public String currentTime74;			//현시시간 초7
	public String currentTime75;			//현시시간 초7
	public String currentTime76;			//현시시간 초7
	
	
	public String signalYellow1;		//황색1
	public String signalYellow2;		//황색2
	public String signalYellow3;		//황색3
	public String signalYellow4;		//황색4
	public String signalYellow5;		//황색5
	public String signalYellow6;
	
	public String signalAllRed1;		//올레드1
	public String signalAllRed2;		//올레드2
	public String signalAllRed3;		//올레드3
	public String signalAllRed4;		//올레드4
	public String signalAllRed5;		//올레드5
	public String signalAllRed6;		//올레드6
	public String signalAllRed7;		//올레드7
	public String signalAllRed8;		//올레드8
	public String signalAllRed9;		//올레드9
	public String signalAllRed10;		//올레드10
	public String signalAllRed11;		//올레드10
	public String signalAllRed12;		//올레드10
	
	
	public String signalCrosswalk1;		//횡단보도1
	public String signalCrosswalk2;		//횡단보도2
	public String signalCrosswalk3;		//횡단보도3
	public String signalCrosswalk4;		//횡단보도4
	public String signalCrosswalk5;		//횡단보도5
	public String signalCrosswalk6;		//횡단보도6
	public String signalCrosswalk7;		//횡단보도7
	public String signalCrosswalk8;		//횡단보도8
	public String signalCrosswalk9;		//횡단보도9
	public String signalCrosswalk10;	//횡단보도10
	public String signalCrosswalk11;	//횡단보도10
	public String signalCrosswalk12;	//횡단보도10
	
	public String searchDistrict;		//검색 지구 선택

	public String getMgmtSeq() {
		return mgmtSeq;
	}

	public void setMgmtSeq(String mgmtSeq) {
		this.mgmtSeq = mgmtSeq;
	}

	public String getPolNm() {
		return polNm;
	}

	public void setPolNm(String polNm) {
		this.polNm = polNm;
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

	public String getCrossroadCd() {
		return crossroadCd;
	}

	public void setCrossroadCd(String crossroadCd) {
		this.crossroadCd = crossroadCd;
	}

	public String getCrossroadNm() {
		return crossroadNm;
	}

	public void setCrossroadNm(String crossroadNm) {
		this.crossroadNm = crossroadNm;
	}

	public String getLightNo1() {
		return lightNo1;
	}

	public void setLightNo1(String lightNo1) {
		this.lightNo1 = lightNo1;
	}

	public String getLightNo2() {
		return lightNo2;
	}

	public void setLightNo2(String lightNo2) {
		this.lightNo2 = lightNo2;
	}

	public String getLightNo3() {
		return lightNo3;
	}

	public void setLightNo3(String lightNo3) {
		this.lightNo3 = lightNo3;
	}

	public String getInstallDate() {
		return installDate;
	}

	public void setInstallDate(String installDate) {
		this.installDate = installDate;
	}

	public String getInstallCrossroad() {
		return installCrossroad;
	}

	public void setInstallCrossroad(String installCrossroad) {
		this.installCrossroad = installCrossroad;
	}

	public String getInstallCrossroadCd() {
		return installCrossroadCd;
	}

	public void setInstallCrossroadCd(String installCrossroadCd) {
		this.installCrossroadCd = installCrossroadCd;
	}

	public String getInstallAddrDtl1() {
		return installAddrDtl1;
	}

	public void setInstallAddrDtl1(String installAddrDtl1) {
		this.installAddrDtl1 = installAddrDtl1;
	}

	public String getInstallAddrDtl2() {
		return installAddrDtl2;
	}

	public void setInstallAddrDtl2(String installAddrDtl2) {
		this.installAddrDtl2 = installAddrDtl2;
	}

	public String getInstallAddrDtl3() {
		return installAddrDtl3;
	}

	public void setInstallAddrDtl3(String installAddrDtl3) {
		this.installAddrDtl3 = installAddrDtl3;
	}

	public String getInstallAddrDtl4() {
		return installAddrDtl4;
	}

	public void setInstallAddrDtl4(String installAddrDtl4) {
		this.installAddrDtl4 = installAddrDtl4;
	}

	public String getInstallAddrDtl5() {
		return installAddrDtl5;
	}

	public void setInstallAddrDtl5(String installAddrDtl5) {
		this.installAddrDtl5 = installAddrDtl5;
	}

	public String getInstallAddrDtl6() {
		return installAddrDtl6;
	}

	public void setInstallAddrDtl6(String installAddrDtl6) {
		this.installAddrDtl6 = installAddrDtl6;
	}

	public String getTypeControll() {
		return typeControll;
	}

	public void setTypeControll(String typeControll) {
		this.typeControll = typeControll;
	}

	public String getTypeRoad() {
		return typeRoad;
	}

	public void setTypeRoad(String typeRoad) {
		this.typeRoad = typeRoad;
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

	public String getSignalRules() {
		return signalRules;
	}

	public void setSignalRules(String signalRules) {
		this.signalRules = signalRules;
	}

	public String getSignalWiring() {
		return signalWiring;
	}

	public void setSignalWiring(String signalWiring) {
		this.signalWiring = signalWiring;
	}

	public String getUpsType() {
		return upsType;
	}

	public void setUpsType(String upsType) {
		this.upsType = upsType;
	}

	public String getUpsBatExchangeDate() {
		return upsBatExchangeDate;
	}

	public void setUpsBatExchangeDate(String upsBatExchangeDate) {
		this.upsBatExchangeDate = upsBatExchangeDate;
	}

	public String getConstructorSignal1() {
		return constructorSignal1;
	}

	public void setConstructorSignal1(String constructorSignal1) {
		this.constructorSignal1 = constructorSignal1;
	}

	public String getConstructorSignal2() {
		return constructorSignal2;
	}

	public void setConstructorSignal2(String constructorSignal2) {
		this.constructorSignal2 = constructorSignal2;
	}

	public String getConstructorCtrl1() {
		return constructorCtrl1;
	}

	public void setConstructorCtrl1(String constructorCtrl1) {
		this.constructorCtrl1 = constructorCtrl1;
	}

	public String getConstructorCtrl2() {
		return constructorCtrl2;
	}

	public void setConstructorCtrl2(String constructorCtrl2) {
		this.constructorCtrl2 = constructorCtrl2;
	}

	public String getConstructorEng1() {
		return constructorEng1;
	}

	public void setConstructorEng1(String constructorEng1) {
		this.constructorEng1 = constructorEng1;
	}

	public String getConstructorEng2() {
		return constructorEng2;
	}

	public void setConstructorEng2(String constructorEng2) {
		this.constructorEng2 = constructorEng2;
	}

	public String getConstructionExpenses() {
		return constructionExpenses;
	}

	public void setConstructionExpenses(String constructionExpenses) {
		this.constructionExpenses = constructionExpenses;
	}

	public String getKindTrafficLight1() {
		return kindTrafficLight1;
	}

	public void setKindTrafficLight1(String kindTrafficLight1) {
		this.kindTrafficLight1 = kindTrafficLight1;
	}

	public String getKindTrafficLight2() {
		return kindTrafficLight2;
	}

	public void setKindTrafficLight2(String kindTrafficLight2) {
		this.kindTrafficLight2 = kindTrafficLight2;
	}

	public String getKindTrafficLight3() {
		return kindTrafficLight3;
	}

	public void setKindTrafficLight3(String kindTrafficLight3) {
		this.kindTrafficLight3 = kindTrafficLight3;
	}

	public String getKindTrafficLight4() {
		return kindTrafficLight4;
	}

	public void setKindTrafficLight4(String kindTrafficLight4) {
		this.kindTrafficLight4 = kindTrafficLight4;
	}

	public String getKindTrafficLight5() {
		return kindTrafficLight5;
	}

	public void setKindTrafficLight5(String kindTrafficLight5) {
		this.kindTrafficLight5 = kindTrafficLight5;
	}

	public String getKindTrafficLight6() {
		return kindTrafficLight6;
	}

	public void setKindTrafficLight6(String kindTrafficLight6) {
		this.kindTrafficLight6 = kindTrafficLight6;
	}

	public String getKindTrafficLight7() {
		return kindTrafficLight7;
	}

	public void setKindTrafficLight7(String kindTrafficLight7) {
		this.kindTrafficLight7 = kindTrafficLight7;
	}

	public String getKindTrafficLight8() {
		return kindTrafficLight8;
	}

	public void setKindTrafficLight8(String kindTrafficLight8) {
		this.kindTrafficLight8 = kindTrafficLight8;
	}

	public String getKindTrafficLight9() {
		return kindTrafficLight9;
	}

	public void setKindTrafficLight9(String kindTrafficLight9) {
		this.kindTrafficLight9 = kindTrafficLight9;
	}

	public String getKindTrafficLight10() {
		return kindTrafficLight10;
	}

	public void setKindTrafficLight10(String kindTrafficLight10) {
		this.kindTrafficLight10 = kindTrafficLight10;
	}

	public String getKindTrafficLight11() {
		return kindTrafficLight11;
	}

	public void setKindTrafficLight11(String kindTrafficLight11) {
		this.kindTrafficLight11 = kindTrafficLight11;
	}

	public String getKindTrafficLight12() {
		return kindTrafficLight12;
	}

	public void setKindTrafficLight12(String kindTrafficLight12) {
		this.kindTrafficLight12 = kindTrafficLight12;
	}

	public String getKindTrafficLight13() {
		return kindTrafficLight13;
	}

	public void setKindTrafficLight13(String kindTrafficLight13) {
		this.kindTrafficLight13 = kindTrafficLight13;
	}

	public String getKindTrafficLight14() {
		return kindTrafficLight14;
	}

	public void setKindTrafficLight14(String kindTrafficLight14) {
		this.kindTrafficLight14 = kindTrafficLight14;
	}

	public String getKindTrafficLight15() {
		return kindTrafficLight15;
	}

	public void setKindTrafficLight15(String kindTrafficLight15) {
		this.kindTrafficLight15 = kindTrafficLight15;
	}

	public String getKindTrafficLight16() {
		return kindTrafficLight16;
	}

	public void setKindTrafficLight16(String kindTrafficLight16) {
		this.kindTrafficLight16 = kindTrafficLight16;
	}

	public String getKindLampWarning1() {
		return kindLampWarning1;
	}

	public void setKindLampWarning1(String kindLampWarning1) {
		this.kindLampWarning1 = kindLampWarning1;
	}

	public String getKindLampWarning2() {
		return kindLampWarning2;
	}

	public void setKindLampWarning2(String kindLampWarning2) {
		this.kindLampWarning2 = kindLampWarning2;
	}

	public String getKindLampWarning3() {
		return kindLampWarning3;
	}

	public void setKindLampWarning3(String kindLampWarning3) {
		this.kindLampWarning3 = kindLampWarning3;
	}

	public String getKindLampWarning4() {
		return kindLampWarning4;
	}

	public void setKindLampWarning4(String kindLampWarning4) {
		this.kindLampWarning4 = kindLampWarning4;
	}

	public String getKindLampWarning5() {
		return kindLampWarning5;
	}

	public void setKindLampWarning5(String kindLampWarning5) {
		this.kindLampWarning5 = kindLampWarning5;
	}

	public String getKindLampWarning6() {
		return kindLampWarning6;
	}

	public void setKindLampWarning6(String kindLampWarning6) {
		this.kindLampWarning6 = kindLampWarning6;
	}

	public String getKindLampWarning7() {
		return kindLampWarning7;
	}

	public void setKindLampWarning7(String kindLampWarning7) {
		this.kindLampWarning7 = kindLampWarning7;
	}

	public String getKindLampWarning8() {
		return kindLampWarning8;
	}

	public void setKindLampWarning8(String kindLampWarning8) {
		this.kindLampWarning8 = kindLampWarning8;
	}

	public String getKindLampWarning9() {
		return kindLampWarning9;
	}

	public void setKindLampWarning9(String kindLampWarning9) {
		this.kindLampWarning9 = kindLampWarning9;
	}

	public String getKindLampWarning10() {
		return kindLampWarning10;
	}

	public void setKindLampWarning10(String kindLampWarning10) {
		this.kindLampWarning10 = kindLampWarning10;
	}

	public String getKindLampWarning11() {
		return kindLampWarning11;
	}

	public void setKindLampWarning11(String kindLampWarning11) {
		this.kindLampWarning11 = kindLampWarning11;
	}

	public String getKindLampWarning12() {
		return kindLampWarning12;
	}

	public void setKindLampWarning12(String kindLampWarning12) {
		this.kindLampWarning12 = kindLampWarning12;
	}

	public String getKindLampVariable1() {
		return kindLampVariable1;
	}

	public void setKindLampVariable1(String kindLampVariable1) {
		this.kindLampVariable1 = kindLampVariable1;
	}

	public String getKindLampVariable2() {
		return kindLampVariable2;
	}

	public void setKindLampVariable2(String kindLampVariable2) {
		this.kindLampVariable2 = kindLampVariable2;
	}

	public String getKindLampVariable3() {
		return kindLampVariable3;
	}

	public void setKindLampVariable3(String kindLampVariable3) {
		this.kindLampVariable3 = kindLampVariable3;
	}

	public String getKindLampVariable4() {
		return kindLampVariable4;
	}

	public void setKindLampVariable4(String kindLampVariable4) {
		this.kindLampVariable4 = kindLampVariable4;
	}

	public String getKindLampVariable5() {
		return kindLampVariable5;
	}

	public void setKindLampVariable5(String kindLampVariable5) {
		this.kindLampVariable5 = kindLampVariable5;
	}

	public String getKindLampVariable6() {
		return kindLampVariable6;
	}

	public void setKindLampVariable6(String kindLampVariable6) {
		this.kindLampVariable6 = kindLampVariable6;
	}

	public String getKindLampVariable7() {
		return kindLampVariable7;
	}

	public void setKindLampVariable7(String kindLampVariable7) {
		this.kindLampVariable7 = kindLampVariable7;
	}

	public String getKindLampVariable8() {
		return kindLampVariable8;
	}

	public void setKindLampVariable8(String kindLampVariable8) {
		this.kindLampVariable8 = kindLampVariable8;
	}

	public String getKindLampVariable9() {
		return kindLampVariable9;
	}

	public void setKindLampVariable9(String kindLampVariable9) {
		this.kindLampVariable9 = kindLampVariable9;
	}

	public String getKindLampVariable10() {
		return kindLampVariable10;
	}

	public void setKindLampVariable10(String kindLampVariable10) {
		this.kindLampVariable10 = kindLampVariable10;
	}

	public String getKindLampVariable11() {
		return kindLampVariable11;
	}

	public void setKindLampVariable11(String kindLampVariable11) {
		this.kindLampVariable11 = kindLampVariable11;
	}

	public String getKindLampVariable12() {
		return kindLampVariable12;
	}

	public void setKindLampVariable12(String kindLampVariable12) {
		this.kindLampVariable12 = kindLampVariable12;
	}

	public String getKindLampWalking1() {
		return kindLampWalking1;
	}

	public void setKindLampWalking1(String kindLampWalking1) {
		this.kindLampWalking1 = kindLampWalking1;
	}

	public String getKindLampWalking2() {
		return kindLampWalking2;
	}

	public void setKindLampWalking2(String kindLampWalking2) {
		this.kindLampWalking2 = kindLampWalking2;
	}

	public String getKindLampWalking3() {
		return kindLampWalking3;
	}

	public void setKindLampWalking3(String kindLampWalking3) {
		this.kindLampWalking3 = kindLampWalking3;
	}

	public String getKindLampWalking4() {
		return kindLampWalking4;
	}

	public void setKindLampWalking4(String kindLampWalking4) {
		this.kindLampWalking4 = kindLampWalking4;
	}

	public String getKindLampWalking5() {
		return kindLampWalking5;
	}

	public void setKindLampWalking5(String kindLampWalking5) {
		this.kindLampWalking5 = kindLampWalking5;
	}

	public String getKindLampWalking6() {
		return kindLampWalking6;
	}

	public void setKindLampWalking6(String kindLampWalking6) {
		this.kindLampWalking6 = kindLampWalking6;
	}

	public String getKindLampWalking7() {
		return kindLampWalking7;
	}

	public void setKindLampWalking7(String kindLampWalking7) {
		this.kindLampWalking7 = kindLampWalking7;
	}

	public String getKindLampWalking8() {
		return kindLampWalking8;
	}

	public void setKindLampWalking8(String kindLampWalking8) {
		this.kindLampWalking8 = kindLampWalking8;
	}

	public String getKindLampWalking9() {
		return kindLampWalking9;
	}

	public void setKindLampWalking9(String kindLampWalking9) {
		this.kindLampWalking9 = kindLampWalking9;
	}

	public String getKindLampWalking10() {
		return kindLampWalking10;
	}

	public void setKindLampWalking10(String kindLampWalking10) {
		this.kindLampWalking10 = kindLampWalking10;
	}

	public String getKindLampWalking11() {
		return kindLampWalking11;
	}

	public void setKindLampWalking11(String kindLampWalking11) {
		this.kindLampWalking11 = kindLampWalking11;
	}

	public String getKindLampWalking12() {
		return kindLampWalking12;
	}

	public void setKindLampWalking12(String kindLampWalking12) {
		this.kindLampWalking12 = kindLampWalking12;
	}

	public String getPillarVehicleLamp1() {
		return pillarVehicleLamp1;
	}

	public void setPillarVehicleLamp1(String pillarVehicleLamp1) {
		this.pillarVehicleLamp1 = pillarVehicleLamp1;
	}

	public String getPillarVehicleLamp2() {
		return pillarVehicleLamp2;
	}

	public void setPillarVehicleLamp2(String pillarVehicleLamp2) {
		this.pillarVehicleLamp2 = pillarVehicleLamp2;
	}

	public String getPillarVehicleLamp3() {
		return pillarVehicleLamp3;
	}

	public void setPillarVehicleLamp3(String pillarVehicleLamp3) {
		this.pillarVehicleLamp3 = pillarVehicleLamp3;
	}

	public String getPillarVehicleLamp4() {
		return pillarVehicleLamp4;
	}

	public void setPillarVehicleLamp4(String pillarVehicleLamp4) {
		this.pillarVehicleLamp4 = pillarVehicleLamp4;
	}

	public String getPillarVehicleLamp5() {
		return pillarVehicleLamp5;
	}

	public void setPillarVehicleLamp5(String pillarVehicleLamp5) {
		this.pillarVehicleLamp5 = pillarVehicleLamp5;
	}

	public String getPillarWalkingLamp1() {
		return pillarWalkingLamp1;
	}

	public void setPillarWalkingLamp1(String pillarWalkingLamp1) {
		this.pillarWalkingLamp1 = pillarWalkingLamp1;
	}

	public String getPillarWalkingLamp2() {
		return pillarWalkingLamp2;
	}

	public void setPillarWalkingLamp2(String pillarWalkingLamp2) {
		this.pillarWalkingLamp2 = pillarWalkingLamp2;
	}

	public String getPillarTrafficLight1() {
		return pillarTrafficLight1;
	}

	public void setPillarTrafficLight1(String pillarTrafficLight1) {
		this.pillarTrafficLight1 = pillarTrafficLight1;
	}

	public String getPillarTrafficLight2() {
		return pillarTrafficLight2;
	}

	public void setPillarTrafficLight2(String pillarTrafficLight2) {
		this.pillarTrafficLight2 = pillarTrafficLight2;
	}

	public String getPillarTrafficLight3() {
		return pillarTrafficLight3;
	}

	public void setPillarTrafficLight3(String pillarTrafficLight3) {
		this.pillarTrafficLight3 = pillarTrafficLight3;
	}

	public String getPillarTrafficLight4() {
		return pillarTrafficLight4;
	}

	public void setPillarTrafficLight4(String pillarTrafficLight4) {
		this.pillarTrafficLight4 = pillarTrafficLight4;
	}

	public String getPillarTrafficLight5() {
		return pillarTrafficLight5;
	}

	public void setPillarTrafficLight5(String pillarTrafficLight5) {
		this.pillarTrafficLight5 = pillarTrafficLight5;
	}

	public String getPillarIntegration1() {
		return pillarIntegration1;
	}

	public void setPillarIntegration1(String pillarIntegration1) {
		this.pillarIntegration1 = pillarIntegration1;
	}

	public String getPillarIntegration2() {
		return pillarIntegration2;
	}

	public void setPillarIntegration2(String pillarIntegration2) {
		this.pillarIntegration2 = pillarIntegration2;
	}

	public String getAttachEtc1() {
		return attachEtc1;
	}

	public void setAttachEtc1(String attachEtc1) {
		this.attachEtc1 = attachEtc1;
	}

	public String getAttachEtc2() {
		return attachEtc2;
	}

	public void setAttachEtc2(String attachEtc2) {
		this.attachEtc2 = attachEtc2;
	}

	public String getCtrlElectron() {
		return ctrlElectron;
	}

	public void setCtrlElectron(String ctrlElectron) {
		this.ctrlElectron = ctrlElectron;
	}

	public String getCtrlCycle() {
		return ctrlCycle;
	}

	public void setCtrlCycle(String ctrlCycle) {
		this.ctrlCycle = ctrlCycle;
	}

	public String getCtrlSensitive() {
		return ctrlSensitive;
	}

	public void setCtrlSensitive(String ctrlSensitive) {
		this.ctrlSensitive = ctrlSensitive;
	}

	public String getSignalCycle1() {
		return signalCycle1;
	}

	public void setSignalCycle1(String signalCycle1) {
		this.signalCycle1 = signalCycle1;
	}

	public String getSignalCycle2() {
		return signalCycle2;
	}

	public void setSignalCycle2(String signalCycle2) {
		this.signalCycle2 = signalCycle2;
	}

	public String getSignalCycle3() {
		return signalCycle3;
	}

	public void setSignalCycle3(String signalCycle3) {
		this.signalCycle3 = signalCycle3;
	}

	public String getSignalCycle4() {
		return signalCycle4;
	}

	public void setSignalCycle4(String signalCycle4) {
		this.signalCycle4 = signalCycle4;
	}

	public String getSignalCycle5() {
		return signalCycle5;
	}

	public void setSignalCycle5(String signalCycle5) {
		this.signalCycle5 = signalCycle5;
	}

	public String getSignalCycle6() {
		return signalCycle6;
	}

	public void setSignalCycle6(String signalCycle6) {
		this.signalCycle6 = signalCycle6;
	}

	public String getSignalSec1() {
		return signalSec1;
	}

	public void setSignalSec1(String signalSec1) {
		this.signalSec1 = signalSec1;
	}

	public String getSignalSec2() {
		return signalSec2;
	}

	public void setSignalSec2(String signalSec2) {
		this.signalSec2 = signalSec2;
	}

	public String getSignalSec3() {
		return signalSec3;
	}

	public void setSignalSec3(String signalSec3) {
		this.signalSec3 = signalSec3;
	}

	public String getSignalSec4() {
		return signalSec4;
	}

	public void setSignalSec4(String signalSec4) {
		this.signalSec4 = signalSec4;
	}

	public String getSignalSec5() {
		return signalSec5;
	}

	public void setSignalSec5(String signalSec5) {
		this.signalSec5 = signalSec5;
	}

	public String getSignalSec6() {
		return signalSec6;
	}

	public void setSignalSec6(String signalSec6) {
		this.signalSec6 = signalSec6;
	}

	public String getSignalSecTot() {
		return signalSecTot;
	}

	public void setSignalSecTot(String signalSecTot) {
		this.signalSecTot = signalSecTot;
	}

	public String getCurrentSelTime1() {
		return currentSelTime1;
	}

	public void setCurrentSelTime1(String currentSelTime1) {
		this.currentSelTime1 = currentSelTime1;
	}

	public String getCurrentTime1() {
		return currentTime1;
	}

	public void setCurrentTime1(String currentTime1) {
		this.currentTime1 = currentTime1;
	}

	public String getCurrentTime11() {
		return currentTime11;
	}

	public void setCurrentTime11(String currentTime11) {
		this.currentTime11 = currentTime11;
	}

	public String getCurrentTime12() {
		return currentTime12;
	}

	public void setCurrentTime12(String currentTime12) {
		this.currentTime12 = currentTime12;
	}

	public String getCurrentTime13() {
		return currentTime13;
	}

	public void setCurrentTime13(String currentTime13) {
		this.currentTime13 = currentTime13;
	}

	public String getCurrentTime14() {
		return currentTime14;
	}

	public void setCurrentTime14(String currentTime14) {
		this.currentTime14 = currentTime14;
	}

	public String getCurrentTime15() {
		return currentTime15;
	}

	public void setCurrentTime15(String currentTime15) {
		this.currentTime15 = currentTime15;
	}

	public String getCurrentTime16() {
		return currentTime16;
	}

	public void setCurrentTime16(String currentTime16) {
		this.currentTime16 = currentTime16;
	}

	public String getCurrentSelTime2() {
		return currentSelTime2;
	}

	public void setCurrentSelTime2(String currentSelTime2) {
		this.currentSelTime2 = currentSelTime2;
	}

	public String getCurrentTime2() {
		return currentTime2;
	}

	public void setCurrentTime2(String currentTime2) {
		this.currentTime2 = currentTime2;
	}

	public String getCurrentTime21() {
		return currentTime21;
	}

	public void setCurrentTime21(String currentTime21) {
		this.currentTime21 = currentTime21;
	}

	public String getCurrentTime22() {
		return currentTime22;
	}

	public void setCurrentTime22(String currentTime22) {
		this.currentTime22 = currentTime22;
	}

	public String getCurrentTime23() {
		return currentTime23;
	}

	public void setCurrentTime23(String currentTime23) {
		this.currentTime23 = currentTime23;
	}

	public String getCurrentTime24() {
		return currentTime24;
	}

	public void setCurrentTime24(String currentTime24) {
		this.currentTime24 = currentTime24;
	}

	public String getCurrentTime25() {
		return currentTime25;
	}

	public void setCurrentTime25(String currentTime25) {
		this.currentTime25 = currentTime25;
	}

	public String getCurrentTime26() {
		return currentTime26;
	}

	public void setCurrentTime26(String currentTime26) {
		this.currentTime26 = currentTime26;
	}

	public String getCurrentSelTime3() {
		return currentSelTime3;
	}

	public void setCurrentSelTime3(String currentSelTime3) {
		this.currentSelTime3 = currentSelTime3;
	}

	public String getCurrentTime3() {
		return currentTime3;
	}

	public void setCurrentTime3(String currentTime3) {
		this.currentTime3 = currentTime3;
	}

	public String getCurrentTime31() {
		return currentTime31;
	}

	public void setCurrentTime31(String currentTime31) {
		this.currentTime31 = currentTime31;
	}

	public String getCurrentTime32() {
		return currentTime32;
	}

	public void setCurrentTime32(String currentTime32) {
		this.currentTime32 = currentTime32;
	}

	public String getCurrentTime33() {
		return currentTime33;
	}

	public void setCurrentTime33(String currentTime33) {
		this.currentTime33 = currentTime33;
	}

	public String getCurrentTime34() {
		return currentTime34;
	}

	public void setCurrentTime34(String currentTime34) {
		this.currentTime34 = currentTime34;
	}

	public String getCurrentTime35() {
		return currentTime35;
	}

	public void setCurrentTime35(String currentTime35) {
		this.currentTime35 = currentTime35;
	}

	public String getCurrentTime36() {
		return currentTime36;
	}

	public void setCurrentTime36(String currentTime36) {
		this.currentTime36 = currentTime36;
	}

	public String getCurrentSelTime4() {
		return currentSelTime4;
	}

	public void setCurrentSelTime4(String currentSelTime4) {
		this.currentSelTime4 = currentSelTime4;
	}

	public String getCurrentTime4() {
		return currentTime4;
	}

	public void setCurrentTime4(String currentTime4) {
		this.currentTime4 = currentTime4;
	}

	public String getCurrentTime41() {
		return currentTime41;
	}

	public void setCurrentTime41(String currentTime41) {
		this.currentTime41 = currentTime41;
	}

	public String getCurrentTime42() {
		return currentTime42;
	}

	public void setCurrentTime42(String currentTime42) {
		this.currentTime42 = currentTime42;
	}

	public String getCurrentTime43() {
		return currentTime43;
	}

	public void setCurrentTime43(String currentTime43) {
		this.currentTime43 = currentTime43;
	}

	public String getCurrentTime44() {
		return currentTime44;
	}

	public void setCurrentTime44(String currentTime44) {
		this.currentTime44 = currentTime44;
	}

	public String getCurrentTime45() {
		return currentTime45;
	}

	public void setCurrentTime45(String currentTime45) {
		this.currentTime45 = currentTime45;
	}

	public String getCurrentTime46() {
		return currentTime46;
	}

	public void setCurrentTime46(String currentTime46) {
		this.currentTime46 = currentTime46;
	}

	public String getCurrentSelTime5() {
		return currentSelTime5;
	}

	public void setCurrentSelTime5(String currentSelTime5) {
		this.currentSelTime5 = currentSelTime5;
	}

	public String getCurrentTime5() {
		return currentTime5;
	}

	public void setCurrentTime5(String currentTime5) {
		this.currentTime5 = currentTime5;
	}

	public String getCurrentTime51() {
		return currentTime51;
	}

	public void setCurrentTime51(String currentTime51) {
		this.currentTime51 = currentTime51;
	}

	public String getCurrentTime52() {
		return currentTime52;
	}

	public void setCurrentTime52(String currentTime52) {
		this.currentTime52 = currentTime52;
	}

	public String getCurrentTime53() {
		return currentTime53;
	}

	public void setCurrentTime53(String currentTime53) {
		this.currentTime53 = currentTime53;
	}

	public String getCurrentTime54() {
		return currentTime54;
	}

	public void setCurrentTime54(String currentTime54) {
		this.currentTime54 = currentTime54;
	}

	public String getCurrentTime55() {
		return currentTime55;
	}

	public void setCurrentTime55(String currentTime55) {
		this.currentTime55 = currentTime55;
	}

	public String getCurrentTime56() {
		return currentTime56;
	}

	public void setCurrentTime56(String currentTime56) {
		this.currentTime56 = currentTime56;
	}

	public String getCurrentSelTime6() {
		return currentSelTime6;
	}

	public void setCurrentSelTime6(String currentSelTime6) {
		this.currentSelTime6 = currentSelTime6;
	}

	public String getCurrentTime6() {
		return currentTime6;
	}

	public void setCurrentTime6(String currentTime6) {
		this.currentTime6 = currentTime6;
	}

	public String getCurrentTime61() {
		return currentTime61;
	}

	public void setCurrentTime61(String currentTime61) {
		this.currentTime61 = currentTime61;
	}

	public String getCurrentTime62() {
		return currentTime62;
	}

	public void setCurrentTime62(String currentTime62) {
		this.currentTime62 = currentTime62;
	}

	public String getCurrentTime63() {
		return currentTime63;
	}

	public void setCurrentTime63(String currentTime63) {
		this.currentTime63 = currentTime63;
	}

	public String getCurrentTime64() {
		return currentTime64;
	}

	public void setCurrentTime64(String currentTime64) {
		this.currentTime64 = currentTime64;
	}

	public String getCurrentTime65() {
		return currentTime65;
	}

	public void setCurrentTime65(String currentTime65) {
		this.currentTime65 = currentTime65;
	}

	public String getCurrentTime66() {
		return currentTime66;
	}

	public void setCurrentTime66(String currentTime66) {
		this.currentTime66 = currentTime66;
	}

	public String getCurrentSelTime7() {
		return currentSelTime7;
	}

	public void setCurrentSelTime7(String currentSelTime7) {
		this.currentSelTime7 = currentSelTime7;
	}

	public String getCurrentTime7() {
		return currentTime7;
	}

	public void setCurrentTime7(String currentTime7) {
		this.currentTime7 = currentTime7;
	}

	public String getCurrentTime71() {
		return currentTime71;
	}

	public void setCurrentTime71(String currentTime71) {
		this.currentTime71 = currentTime71;
	}

	public String getCurrentTime72() {
		return currentTime72;
	}

	public void setCurrentTime72(String currentTime72) {
		this.currentTime72 = currentTime72;
	}

	public String getCurrentTime73() {
		return currentTime73;
	}

	public void setCurrentTime73(String currentTime73) {
		this.currentTime73 = currentTime73;
	}

	public String getCurrentTime74() {
		return currentTime74;
	}

	public void setCurrentTime74(String currentTime74) {
		this.currentTime74 = currentTime74;
	}

	public String getCurrentTime75() {
		return currentTime75;
	}

	public void setCurrentTime75(String currentTime75) {
		this.currentTime75 = currentTime75;
	}

	public String getCurrentTime76() {
		return currentTime76;
	}

	public void setCurrentTime76(String currentTime76) {
		this.currentTime76 = currentTime76;
	}

	public String getSignalYellow1() {
		return signalYellow1;
	}

	public void setSignalYellow1(String signalYellow1) {
		this.signalYellow1 = signalYellow1;
	}

	public String getSignalYellow2() {
		return signalYellow2;
	}

	public void setSignalYellow2(String signalYellow2) {
		this.signalYellow2 = signalYellow2;
	}

	public String getSignalYellow3() {
		return signalYellow3;
	}

	public void setSignalYellow3(String signalYellow3) {
		this.signalYellow3 = signalYellow3;
	}

	public String getSignalYellow4() {
		return signalYellow4;
	}

	public void setSignalYellow4(String signalYellow4) {
		this.signalYellow4 = signalYellow4;
	}

	public String getSignalYellow5() {
		return signalYellow5;
	}

	public void setSignalYellow5(String signalYellow5) {
		this.signalYellow5 = signalYellow5;
	}

	public String getSignalYellow6() {
		return signalYellow6;
	}

	public void setSignalYellow6(String signalYellow6) {
		this.signalYellow6 = signalYellow6;
	}

	public String getSignalAllRed1() {
		return signalAllRed1;
	}

	public void setSignalAllRed1(String signalAllRed1) {
		this.signalAllRed1 = signalAllRed1;
	}

	public String getSignalAllRed2() {
		return signalAllRed2;
	}

	public void setSignalAllRed2(String signalAllRed2) {
		this.signalAllRed2 = signalAllRed2;
	}

	public String getSignalAllRed3() {
		return signalAllRed3;
	}

	public void setSignalAllRed3(String signalAllRed3) {
		this.signalAllRed3 = signalAllRed3;
	}

	public String getSignalAllRed4() {
		return signalAllRed4;
	}

	public void setSignalAllRed4(String signalAllRed4) {
		this.signalAllRed4 = signalAllRed4;
	}

	public String getSignalAllRed5() {
		return signalAllRed5;
	}

	public void setSignalAllRed5(String signalAllRed5) {
		this.signalAllRed5 = signalAllRed5;
	}

	public String getSignalAllRed6() {
		return signalAllRed6;
	}

	public void setSignalAllRed6(String signalAllRed6) {
		this.signalAllRed6 = signalAllRed6;
	}

	public String getSignalAllRed7() {
		return signalAllRed7;
	}

	public void setSignalAllRed7(String signalAllRed7) {
		this.signalAllRed7 = signalAllRed7;
	}

	public String getSignalAllRed8() {
		return signalAllRed8;
	}

	public void setSignalAllRed8(String signalAllRed8) {
		this.signalAllRed8 = signalAllRed8;
	}

	public String getSignalAllRed9() {
		return signalAllRed9;
	}

	public void setSignalAllRed9(String signalAllRed9) {
		this.signalAllRed9 = signalAllRed9;
	}

	public String getSignalAllRed10() {
		return signalAllRed10;
	}

	public void setSignalAllRed10(String signalAllRed10) {
		this.signalAllRed10 = signalAllRed10;
	}

	public String getSignalAllRed11() {
		return signalAllRed11;
	}

	public void setSignalAllRed11(String signalAllRed11) {
		this.signalAllRed11 = signalAllRed11;
	}

	public String getSignalAllRed12() {
		return signalAllRed12;
	}

	public void setSignalAllRed12(String signalAllRed12) {
		this.signalAllRed12 = signalAllRed12;
	}

	public String getSignalCrosswalk1() {
		return signalCrosswalk1;
	}

	public void setSignalCrosswalk1(String signalCrosswalk1) {
		this.signalCrosswalk1 = signalCrosswalk1;
	}

	public String getSignalCrosswalk2() {
		return signalCrosswalk2;
	}

	public void setSignalCrosswalk2(String signalCrosswalk2) {
		this.signalCrosswalk2 = signalCrosswalk2;
	}

	public String getSignalCrosswalk3() {
		return signalCrosswalk3;
	}

	public void setSignalCrosswalk3(String signalCrosswalk3) {
		this.signalCrosswalk3 = signalCrosswalk3;
	}

	public String getSignalCrosswalk4() {
		return signalCrosswalk4;
	}

	public void setSignalCrosswalk4(String signalCrosswalk4) {
		this.signalCrosswalk4 = signalCrosswalk4;
	}

	public String getSignalCrosswalk5() {
		return signalCrosswalk5;
	}

	public void setSignalCrosswalk5(String signalCrosswalk5) {
		this.signalCrosswalk5 = signalCrosswalk5;
	}

	public String getSignalCrosswalk6() {
		return signalCrosswalk6;
	}

	public void setSignalCrosswalk6(String signalCrosswalk6) {
		this.signalCrosswalk6 = signalCrosswalk6;
	}

	public String getSignalCrosswalk7() {
		return signalCrosswalk7;
	}

	public void setSignalCrosswalk7(String signalCrosswalk7) {
		this.signalCrosswalk7 = signalCrosswalk7;
	}

	public String getSignalCrosswalk8() {
		return signalCrosswalk8;
	}

	public void setSignalCrosswalk8(String signalCrosswalk8) {
		this.signalCrosswalk8 = signalCrosswalk8;
	}

	public String getSignalCrosswalk9() {
		return signalCrosswalk9;
	}

	public void setSignalCrosswalk9(String signalCrosswalk9) {
		this.signalCrosswalk9 = signalCrosswalk9;
	}

	public String getSignalCrosswalk10() {
		return signalCrosswalk10;
	}

	public void setSignalCrosswalk10(String signalCrosswalk10) {
		this.signalCrosswalk10 = signalCrosswalk10;
	}

	public String getSignalCrosswalk11() {
		return signalCrosswalk11;
	}

	public void setSignalCrosswalk11(String signalCrosswalk11) {
		this.signalCrosswalk11 = signalCrosswalk11;
	}

	public String getSignalCrosswalk12() {
		return signalCrosswalk12;
	}

	public void setSignalCrosswalk12(String signalCrosswalk12) {
		this.signalCrosswalk12 = signalCrosswalk12;
	}

	public String getSearchDistrict() {
		return searchDistrict;
	}

	public void setSearchDistrict(String searchDistrict) {
		this.searchDistrict = searchDistrict;
	}

	
}
