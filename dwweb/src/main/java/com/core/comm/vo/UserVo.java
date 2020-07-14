package com.core.comm.vo;

/**
 * @Class Name : UserVo
 * @Description : UserVo Class
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

public class UserVo extends CommonVo {

	private String seq;					//인덱스
	private String groupCode;			//그룹코드
	private String groupNm;				//그룹명
	private String name;				//사용자이름
	private String userId;				//사용자아이디
	private String userPwd;				//패스워드(변경된값)
	private String department;			//부서
	private String validateDate;		//유효일자
	private String regDesc;				//등록사유
	private String expiredYn;			//계정 만료 여부
	private String regDate;				//등록일
	private String regUserId;			//등록 관리자 id
	private String delUserId;			//삭제 관리자 id
	private String delDate;				//삭제일

	//AuthVo
	private String mapEdit;				//맵 수정 권한 0: 없음 1: 있음
	private String userModify;			//사용자 수정권한 (추가/수정/삭제) 0: 없음. 1: 있음.
	
	//추가
	public String validateDateYear;		//계정만료일 년
	public String validateDateMonth;	//계정만료일 월
	public String validateDateDay;		//계정만료일 일
	
	
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
	public String getGroupNm() {
		return groupNm;
	}
	public void setGroupNm(String groupNm) {
		this.groupNm = groupNm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getValidateDate() {
		return validateDate;
	}
	public void setValidateDate(String validateDate) {
		this.validateDate = validateDate;
	}
	public String getRegDesc() {
		return regDesc;
	}
	public void setRegDesc(String regDesc) {
		this.regDesc = regDesc;
	}
	public String getExpiredYn() {
		return expiredYn;
	}
	public void setExpiredYn(String expiredYn) {
		this.expiredYn = expiredYn;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegUserId() {
		return regUserId;
	}
	public void setRegUserId(String regUserId) {
		this.regUserId = regUserId;
	}
	public String getDelUserId() {
		return delUserId;
	}
	public void setDelUserId(String delUserId) {
		this.delUserId = delUserId;
	}
	public String getDelDate() {
		return delDate;
	}
	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}
	public String getMapEdit() {
		return mapEdit;
	}
	public void setMapEdit(String mapEdit) {
		this.mapEdit = mapEdit;
	}
	public String getUserModify() {
		return userModify;
	}
	public void setUserModify(String userModify) {
		this.userModify = userModify;
	}
	public String getValidateDateYear() {
		return validateDateYear;
	}
	public void setValidateDateYear(String validateDateYear) {
		this.validateDateYear = validateDateYear;
	}
	public String getValidateDateMonth() {
		return validateDateMonth;
	}
	public void setValidateDateMonth(String validateDateMonth) {
		this.validateDateMonth = validateDateMonth;
	}
	public String getValidateDateDay() {
		return validateDateDay;
	}
	public void setValidateDateDay(String validateDateDay) {
		this.validateDateDay = validateDateDay;
	}
}
