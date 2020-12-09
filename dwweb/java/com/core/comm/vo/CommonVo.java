package com.core.comm.vo;

import java.lang.reflect.Method;

public class CommonVo {

	private String p;
	private String menuSeq;
	private String menuGbn;
	private String siteSeq;
	private String centerCd;
	private String centerNm;
	private String sdCd;
	private String sdNm;
	private String centerSidoNm;
	private String baseBusiYear;
	private String allSearchYn;
	private String errorCd;
	private String errorMsg;

	//사용자관련
	private String sessionId;
	private String membId;
	private String membSeq;
	private String membIp;
	private String membNm;
	private String regSeq;
	private String regIp;
	private String regNm;
	private String regDt;
	private String updSeq;
	private String updIp;
	private String updNm;
	private String updDt;
	private String delSeq;
	private String delIp;
	private String delNm;
	private String delDt;

	//검색관련
	private String keyKind;
	private String keyKind2;
	private String keyKind3;
	private String keyKind4;
	private String keyKind5;
	private String keyKind6;
	private String keyKind7;
	private String keyKind8;
	private String keyKind9;
	private String keyKind10;
	private String keyWord;
	private String keyWord2;
	private String keyWord3;
	private String keyWord4;
	private String keyWord5;
	private String keyWord6;
	private String keyWord7;
	private String keyWord8;
	private String keyWord9;
	private String keyWord10;
	private String keyCate1;
	private String keyCate2;
	private String keyCate3;
	private String keyCate4;
	private String keyCate5;
	private String keyDate;
	private String lumpOpt;
	private String stdDate;
	private String endDate;
	

	private String gubun;

	private String [] checkboxArry;
	private String [] stringArry;

	//페이지 관련
	private String pageNo;
	private String pageSize;
	private String pCount;
	private String rPageRowNum;
	private String sRowNum;
	private String eRowNum;
	private String totCnt;
	private String pageLimit;
	private String pageBlock;
	private String rownum;
	private String lastPageNum;
	private String viewNum;
	private String level;

	private String isnew;
	private String fileSeq;
	private String fileOrginNm;

	private String hisSeq;
	
	private int limitStart;
	private int limitEnd;

	/**
	 * 전 파라미터 파싱을 위한 toString 메소드
	 * 특수한 경우에 쓰인다
	 */
	public String toString(){
		Class c = getClass();
		StringBuffer sb = new StringBuffer();
		try{
			Method[] m = c.getDeclaredMethods();
			sb.append("{");
			for(int i = 0; i < m.length; i++){
				if(m[i].getName().indexOf("get") == 0){
					if(m[i].getParameterTypes().length == 0){
						try{
							Object value = m[i].invoke(this, null);
							if(value == null){
								value = "";
							}
							sb.append("\"");
							sb.append(m[i].getName());
//							sb.append(":::");
							sb.append("\":\"");
							sb.append(value);
							sb.append("\", ");
//							sb.append(":::");

						}catch(Exception ex){
							
							throw ex;
						}
					} // 인자가 없는 getter 메소드일 경우
				} // getter 메소드일 경우
			}
			sb.append("}");
		}catch(Exception ex){
			return "";
		}
		return sb.toString();
	}

	public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	public String getMenuSeq() {
		return menuSeq;
	}

	public void setMenuSeq(String menuSeq) {
		this.menuSeq = menuSeq;
	}
	
	public String getHisSeq() {
		return hisSeq;
	}

	public void setHisSeq(String hisSeq) {
		this.hisSeq = hisSeq;
	}

	public String getMenuGbn() {
		return menuGbn;
	}

	public void setMenuGbn(String menuGbn) {
		this.menuGbn = menuGbn;
	}

	public String getSiteSeq() {
		return siteSeq;
	}

	public void setSiteSeq(String siteSeq) {
		this.siteSeq = siteSeq;
	}

	public String getCenterCd() {
		return centerCd;
	}

	public void setCenterCd(String centerCd) {
		this.centerCd = centerCd;
	}

	public String getCenterNm() {
		return centerNm;
	}

	public void setCenterNm(String centerNm) {
		this.centerNm = centerNm;
	}

	public String getSdCd() {
		return sdCd;
	}

	public void setSdCd(String sdCd) {
		this.sdCd = sdCd;
	}

	public String getSdNm() {
		return sdNm;
	}

	public void setSdNm(String sdNm) {
		this.sdNm = sdNm;
	}

	public String getCenterSidoNm() {
		return centerSidoNm;
	}

	public void setCenterSidoNm(String centerSidoNm) {
		this.centerSidoNm = centerSidoNm;
	}

	public String getBaseBusiYear() {
		return baseBusiYear;
	}

	public void setBaseBusiYear(String baseBusiYear) {
		this.baseBusiYear = baseBusiYear;
	}

	public String getAllSearchYn() {
		return allSearchYn;
	}

	public void setAllSearchYn(String allSearchYn) {
		this.allSearchYn = allSearchYn;
	}

	public String getErrorCd() {
		return errorCd;
	}

	public void setErrorCd(String errorCd) {
		this.errorCd = errorCd;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getMembId() {
		return membId;
	}

	public void setMembId(String membId) {
		this.membId = membId;
	}

	public String getMembSeq() {
		return membSeq;
	}

	public void setMembSeq(String membSeq) {
		this.membSeq = membSeq;
	}

	public String getMembIp() {
		return membIp;
	}

	public void setMembIp(String membIp) {
		this.membIp = membIp;
	}

	public String getMembNm() {
		return membNm;
	}

	public void setMembNm(String membNm) {
		this.membNm = membNm;
	}

	public String getRegSeq() {
		return regSeq;
	}

	public void setRegSeq(String regSeq) {
		this.regSeq = regSeq;
	}

	public String getRegIp() {
		return regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	public String getRegNm() {
		return regNm;
	}

	public void setRegNm(String regNm) {
		this.regNm = regNm;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getUpdSeq() {
		return updSeq;
	}

	public void setUpdSeq(String updSeq) {
		this.updSeq = updSeq;
	}

	public String getUpdIp() {
		return updIp;
	}

	public void setUpdIp(String updIp) {
		this.updIp = updIp;
	}

	public String getUpdNm() {
		return updNm;
	}

	public void setUpdNm(String updNm) {
		this.updNm = updNm;
	}

	public String getUpdDt() {
		return updDt;
	}

	public void setUpdDt(String updDt) {
		this.updDt = updDt;
	}

	public String getDelSeq() {
		return delSeq;
	}

	public void setDelSeq(String delSeq) {
		this.delSeq = delSeq;
	}

	public String getDelIp() {
		return delIp;
	}

	public void setDelIp(String delIp) {
		this.delIp = delIp;
	}

	public String getDelNm() {
		return delNm;
	}

	public void setDelNm(String delNm) {
		this.delNm = delNm;
	}

	public String getDelDt() {
		return delDt;
	}

	public void setDelDt(String delDt) {
		this.delDt = delDt;
	}

	public String getKeyKind() {
		return keyKind;
	}

	public void setKeyKind(String keyKind) {
		this.keyKind = keyKind;
	}

	public String getKeyKind2() {
		return keyKind2;
	}

	public void setKeyKind2(String keyKind2) {
		this.keyKind2 = keyKind2;
	}

	public String getKeyKind3() {
		return keyKind3;
	}

	public void setKeyKind3(String keyKind3) {
		this.keyKind3 = keyKind3;
	}

	public String getKeyKind4() {
		return keyKind4;
	}

	public void setKeyKind4(String keyKind4) {
		this.keyKind4 = keyKind4;
	}

	public String getKeyKind5() {
		return keyKind5;
	}

	public void setKeyKind5(String keyKind5) {
		this.keyKind5 = keyKind5;
	}

	public String getKeyKind6() {
		return keyKind6;
	}

	public void setKeyKind6(String keyKind6) {
		this.keyKind6 = keyKind6;
	}

	public String getKeyKind7() {
		return keyKind7;
	}

	public void setKeyKind7(String keyKind7) {
		this.keyKind7 = keyKind7;
	}

	public String getKeyKind8() {
		return keyKind8;
	}

	public void setKeyKind8(String keyKind8) {
		this.keyKind8 = keyKind8;
	}

	public String getKeyKind9() {
		return keyKind9;
	}

	public void setKeyKind9(String keyKind9) {
		this.keyKind9 = keyKind9;
	}

	public String getKeyKind10() {
		return keyKind10;
	}

	public void setKeyKind10(String keyKind10) {
		this.keyKind10 = keyKind10;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getKeyWord2() {
		return keyWord2;
	}

	public void setKeyWord2(String keyWord2) {
		this.keyWord2 = keyWord2;
	}

	public String getKeyWord3() {
		return keyWord3;
	}

	public void setKeyWord3(String keyWord3) {
		this.keyWord3 = keyWord3;
	}

	public String getKeyWord4() {
		return keyWord4;
	}

	public void setKeyWord4(String keyWord4) {
		this.keyWord4 = keyWord4;
	}

	public String getKeyWord5() {
		return keyWord5;
	}

	public void setKeyWord5(String keyWord5) {
		this.keyWord5 = keyWord5;
	}

	public String getKeyWord6() {
		return keyWord6;
	}

	public void setKeyWord6(String keyWord6) {
		this.keyWord6 = keyWord6;
	}

	public String getKeyWord7() {
		return keyWord7;
	}

	public void setKeyWord7(String keyWord7) {
		this.keyWord7 = keyWord7;
	}

	public String getKeyWord8() {
		return keyWord8;
	}

	public void setKeyWord8(String keyWord8) {
		this.keyWord8 = keyWord8;
	}

	public String getKeyWord9() {
		return keyWord9;
	}

	public void setKeyWord9(String keyWord9) {
		this.keyWord9 = keyWord9;
	}

	public String getKeyWord10() {
		return keyWord10;
	}

	public void setKeyWord10(String keyWord10) {
		this.keyWord10 = keyWord10;
	}

	public String getKeyCate1() {
		return keyCate1;
	}

	public void setKeyCate1(String keyCate1) {
		this.keyCate1 = keyCate1;
	}

	public String getKeyCate2() {
		return keyCate2;
	}

	public void setKeyCate2(String keyCate2) {
		this.keyCate2 = keyCate2;
	}

	public String getKeyCate3() {
		return keyCate3;
	}

	public void setKeyCate3(String keyCate3) {
		this.keyCate3 = keyCate3;
	}

	public String getKeyCate4() {
		return keyCate4;
	}

	public void setKeyCate4(String keyCate4) {
		this.keyCate4 = keyCate4;
	}

	public String getKeyCate5() {
		return keyCate5;
	}

	public void setKeyCate5(String keyCate5) {
		this.keyCate5 = keyCate5;
	}

	public String getKeyDate() {
		return keyDate;
	}

	public void setKeyDate(String keyDate) {
		this.keyDate = keyDate;
	}

	public String getLumpOpt() {
		return lumpOpt;
	}

	public void setLumpOpt(String lumpOpt) {
		this.lumpOpt = lumpOpt;
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

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String[] getCheckboxArry() {
		String[] tempCheckBoxArry = null;
		if ( null != checkboxArry ) {
			if ( checkboxArry.length < Integer.MAX_VALUE ) {
				tempCheckBoxArry = new String[checkboxArry.length];
				int idx = 0;
				for( String tempCheckBox : checkboxArry ) {
					tempCheckBoxArry[idx++] = tempCheckBox;
				}
			}
		}
		return tempCheckBoxArry;
		//return checkboxArry;
	}

	public void setCheckboxArry(String[] checkboxArry) {
		if ( null != checkboxArry ) {
			this.checkboxArry = new String[checkboxArry.length];
			int idx = 0;
			for ( String tempCheckBox : checkboxArry ) {
				this.checkboxArry[idx++] = tempCheckBox;
			}
		}
		//this.checkboxArry = checkboxArry;
	}

	public String[] getStringArry() {
		String[] tempStringArry = null;
		if ( null != stringArry ) {
			if ( stringArry.length < Integer.MAX_VALUE ) {
				tempStringArry = new String[stringArry.length];
				int idx = 0;
				for( String tempString : stringArry ) {
					tempStringArry[idx++] = tempString;
				}
			}
		}
		return tempStringArry;
		//return stringArry;
	}

	public void setStringArry(String[] stringArry) {
		if ( null != stringArry ) {
			this.stringArry = new String[stringArry.length];
			int idx = 0;
			for ( String tempString : stringArry ) {
				this.stringArry[idx++] = tempString;
			}
		}
		//this.stringArry = stringArry;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getpCount() {
		return pCount;
	}

	public void setpCount(String pCount) {
		this.pCount = pCount;
	}

	public String getrPageRowNum() {
		return rPageRowNum;
	}

	public void setrPageRowNum(String rPageRowNum) {
		this.rPageRowNum = rPageRowNum;
	}

	public String getsRowNum() {
		return sRowNum;
	}

	public void setsRowNum(String sRowNum) {
		this.sRowNum = sRowNum;
	}

	public String geteRowNum() {
		return eRowNum;
	}

	public void seteRowNum(String eRowNum) {
		this.eRowNum = eRowNum;
	}

	public String getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(String totCnt) {
		this.totCnt = totCnt;
	}

	public String getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(String pageLimit) {
		this.pageLimit = pageLimit;
	}

	public String getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(String pageBlock) {
		this.pageBlock = pageBlock;
	}

	public String getRownum() {
		return rownum;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public String getLastPageNum() {
		return lastPageNum;
	}

	public void setLastPageNum(String lastPageNum) {
		this.lastPageNum = lastPageNum;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getIsnew() {
		return isnew;
	}

	public void setIsnew(String isnew) {
		this.isnew = isnew;
	}

	public String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getFileOrginNm() {
		return fileOrginNm;
	}

	public void setFileOrginNm(String fileOrginNm) {
		this.fileOrginNm = fileOrginNm;
	}

	public String getViewNum() {
		return viewNum;
	}

	public void setViewNum(String viewNum) {
		this.viewNum = viewNum;
	}
	
	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public int getLimitEnd() {
		return limitEnd;
	}

	public void setLimitEnd(int limitEnd) {
		this.limitEnd = limitEnd;
	}
}