package com.core.comm.vo;

public class GroupVo extends CommonVo{
	public String seq;			//순번
	public String groupCode;	//그룹코드
	public String regDate;		//등록일
	public String regDesc;		//등록사유
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegDesc() {
		return regDesc;
	}
	public void setRegDesc(String regDesc) {
		this.regDesc = regDesc;
	}
}
