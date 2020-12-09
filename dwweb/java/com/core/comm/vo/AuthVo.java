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

public class AuthVo extends CommonVo{
	
	private String seq;				//인덱스
	private String groupCode;		//사용자 그룹코드
	private String mapEdit;			//맵 수정 권한 0: 없음 1: 있음
	private String userModify;		//사용자 수정권한 (추가/수정/삭제) 0: 없음. 1: 있음.
	
	
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
}
