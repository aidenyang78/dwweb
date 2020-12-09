package com.core.comm.util;

public class PageingUtil {

	public static StringBuffer pageing(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		sb.append("<a href=\"javascript:fnGoPage('1', '')\"><img src='"+contextPath+"/images/board/btn_page_first.gif' alt='첫페이지' /></a>");

		// 이전 X 페이지 이동
		sb.append(" <a href=\"javascript:fnGoPage('" + prevPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_page_prev.gif' alt='이전 " + pageBlock + "페이지'/></a>");
		// 페이지 번호 표시
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i == pageNo) {
				sb.append(" <strong>" + i + "</strong>");
				if (endPageNum != i) {
				}
			} else {
				sb.append(" <a href=\"javascript:fnGoPage('" + i + "', '')\" class=\"num\">");
				sb.append(i);
				sb.append("</a>");
				if (endPageNum != i) {
				}
			}
		}
		// 다음 X 페이지 이동
		sb.append(" <a href=\"javascript:fnGoPage('" + nextPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_page_next.gif' alt='다음" + pageBlock + "페이지' /></a>");
		// 마지막 페이지 이동
		sb.append(" <a href=\"javascript:fnGoPage('" + lastPageNum
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_page_last.gif' alt='마지막페이지' /></a>");

		return sb;
	}

	public static StringBuffer pageingAdminAjax(String contextPath, String function, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		if (function == null || "".equals(function)) {
			function = "fnGoPage";
		}

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		sb.append("<a href=\"javascript:" + function
				+ "('1', '')\"><img src='"+contextPath+"/images/board/btn_page_first.gif' alt='첫페이지' /></a>");

		// 이전 X 페이지 이동
		sb.append(" <a href=\"javascript:" + function + "('" + prevPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_page_prev.gif' alt='이전 " + pageBlock + "페이지'/></a>");
		// 페이지 번호 표시
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i == pageNo) {
				sb.append(" <strong>" + i + "</strong>");
				if (endPageNum != i) {
				}
			} else {
				sb.append(" <a href=\"javascript:" + function + "('" + i + "', '')\" class=\"num\">");
				sb.append(i);
				sb.append("</a>");
				if (endPageNum != i) {
				}
			}
		}
		// 다음 X 페이지 이동
		sb.append(" <a href=\"javascript:" + function + "('" + nextPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_page_next.gif' alt='다음" + pageBlock + "페이지' /></a>");
		// 마지막 페이지 이동
		sb.append(" <a href=\"javascript:" + function + "('" + lastPageNum
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_page_last.gif' alt='마지막페이지' /></a>");

		return sb;
	}

	public static StringBuffer pageingFront(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		sb.append("<img src='"+contextPath+"/images/board/btn_first.gif' border='0' alt='처음 페이지' align='absmiddle' onclick=\"fnGoPage('1', '')\" style='cursor:pointer;' />");

		// 이전 X 페이지 이동
		sb.append(" <img src='"+contextPath+"/images/board/btn_prev.gif' border='0' alt='이전 10페이지' align='absmiddle' onclick=\"fnGoPage('"
				+ prevPageGroup + "', '')\" style='cursor:pointer;' /> &nbsp;");

		// 페이지 번호 표시
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i == pageNo) {
				sb.append(" <strong>" + i + "</strong>");
				if (endPageNum != i) {
				}
			} else {
				sb.append(" <a href=\"javascript:fnGoPage('" + i + "', '')\" class=\"num\">");
				sb.append(i);
				sb.append("</a>");
				if (endPageNum != i) {
				}
			}
		}
		// 다음 X 페이지 이동
		sb.append("&nbsp; <img src='"+contextPath+"/images/board/btn_next.gif' border='0' alt='다음10페이지' align='absmiddle' onclick=\"fnGoPage('"
				+ nextPageGroup + "', '')\" style='cursor:pointer;' />");

		// 마지막 페이지 이동
		sb.append(" <img src='"+contextPath+"/images/board/btn_last.gif' border='0' alt='마지막  페이지' align='absmiddle' onclick=\"fnGoPage('"
				+ lastPageNum + "', '')\" style='cursor:pointer;' />");

		return sb;
	}

	public static StringBuffer pageingFrontType2(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		sb.append("<li class='direction'>");
		sb.append("<a href=\"javascript:fnGoPage('1', '')\"><img src='"+contextPath+"/images/board/btn_first.gif' alt='처음으로' /></a>");
		sb.append("</li>");
		// 이전 X 페이지 이동
		sb.append("<li class='direction'>");
		sb.append(" <a href=\"javascript:fnGoPage('" + prevPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_prev.gif' alt='이전 10페이지'/></a>");
		sb.append("</li>");

		sb.append("<li class='num'>");
		// 페이지 번호 표시
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i == pageNo) {
				sb.append(" <strong>" + i + "</strong>");
				if (endPageNum != i) {
				}
			} else {
				sb.append(" <a href=\"javascript:fnGoPage('" + i + "', '')\" class=\"num\">");
				sb.append(i);
				sb.append("</a>");
				if (endPageNum != i) {
				}
			}
		}
		sb.append("</li>");

		// 다음 X 페이지 이동
		sb.append("<li class='direction'>");
		sb.append(" <a href=\"javascript:fnGoPage('" + nextPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_next.gif' alt='다음10페이지' /></a>");
		sb.append("</li>");
		// 마지막 페이지 이동
		sb.append("<li class='direction'>");
		sb.append(" <a href=\"javascript:fnGoPage(" + lastPageNum
				+ ", '')\"><img src='"+contextPath+"/images/board/btn_last.gif' alt='마지막  페이지' /></a>");
		sb.append("</li>");
		return sb;
	}

	/**
	 * @author 아이웍스 인터렉티브
	 * @creation_date 2018. 8. 10.
	 * @description 페이징
	 * @history
	 * @param contextPath
	 * @param totCnt
	 * @param pageLimit
	 * @param pageBlock
	 * @param pageNo
	 * @return
	 */
	public static StringBuffer pageingFrontType3(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		/* 전체 페이지 갯수 */
		int lastPageNum = (totCnt - 1) / pageLimit + 1;

		/* 화면에 보여질 시작, 페이지 번호 */
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1;

		/* 화면에 보여질 종료, 페이지 번호 */
		int endPageNum = startPageNum + pageBlock - 1;
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		if (pageNo > 10) {
			sb.append(
					"<p class=\"prevMore\"><a href=\"#\" name=\"page_move\" data-page-num='1'><img src='"+contextPath+"/images/board/btn_prevmore.gif' alt='<<' /></a></p>")
					.append("\n");
		}

		if (pageNo > 1) {
			sb.append("<p class='prev'><a href='$' name='page_move' data-page-num='").append(prevPageGroup)
					.append("'><img src='"+contextPath+"/images/board/btn_prev.gif' alt='<' /></a></p>").append("\n");
		}

		sb.append("<ul>").append("\n");

		// 페이지 번호 표시
		for (int i = startPageNum; i <= endPageNum; i++) {
			sb.append("<li");
			if (i == pageNo) {
				sb.append(" class='checked'><span>" + i + "</span>");
				if (endPageNum != i) {
				}
			} else {
				sb.append("><a href=\"#\" name='page_move' data-page-num='").append(i).append("'>");
				sb.append(i);
				sb.append("</a>");
				if (endPageNum != i) {
				}
			}
		}
		sb.append("</li></ul>");

		if (lastPageNum > 1) {
			sb.append("<p class='next'><a href='#' name='page_move' data-page-num='").append(nextPageGroup)
					.append("'><img src='"+contextPath+"/images/board/btn_next.gif' alt='>' /></a></p>");
		}

		if (lastPageNum > 10) {
			sb.append("<p class='nextMore'><a href='#' name='page_move' data-page-num='").append(lastPageNum)
					.append("'><img src='"+contextPath+"/images/board/btn_nextmore.gif' alt='>>' /></a></p>");
		}

		return sb;
	}
	
	public static StringBuffer pageingMobileType3(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		int prevPage = 0;
		int nextPage = 0;
		int maxPageNo = 0;
		
		if((int)(Math.floor(totCnt/10)) < 1){
			maxPageNo = 1;
		}else{
			if(totCnt % 10 == 0){
				maxPageNo = (int)(Math.floor(totCnt/10));
			}else{
				maxPageNo = (int)(Math.floor(totCnt/10)) + 1;
			}
			 
		}
		
		if(pageNo == 1){
			prevPage = 1;
			nextPage = pageNo + 1;
		}else if((int)(Math.floor(totCnt/10)) == pageNo){
			prevPage = pageNo - 1;
			if(totCnt % 10 == 0){
				nextPage = pageNo;
			}else{
				nextPage = pageNo + 1;
			}
			
		}else{
			prevPage = pageNo -1;
			nextPage = pageNo + 1;
		}
		
		
		
		sb.append("<p class='prev'><a href='$' name='page_move' data-page-num='").append(prevPage)
				.append("'><img src='"+contextPath+"/images/board/btn_prev.gif' alt='<' /></a></p>").append("\n");
		sb.append("<div class=\"nowPage\"><b>");
		
		sb.append(pageNo);
		
		sb.append("</b> / ");
		
		sb.append(maxPageNo);
		
		sb.append("</div>");
		
		sb.append("<p class='next'><a href='#' name='page_move' data-page-num='").append(nextPage)
				.append("'><img src='"+contextPath+"/images/board/btn_next.gif' alt='>' /></a></p>");

		return sb;
	}
	
	public static StringBuffer pageingMobile(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수

		if (pageNo > 1) {
			sb.append("<a href=\"javascript:fnGoPage('" + (pageNo - 1) + "', '')\">이전목록</a>");
		} else {
			sb.append("<a href=\"javascript:fnGoPage('1', '')\">이전목록</a>");
		}

		sb.append("<span><strong>");
		sb.append(pageNo);
		sb.append("</strong> / ");
		sb.append(lastPageNum);
		sb.append("</span>");

		if (pageNo < lastPageNum) {
			sb.append("<a href=\"javascript:fnGoPage('" + (pageNo + 1) + "', '')\">다음목록</a>");
		} else {
			sb.append("<a href=\"javascript:fnGoPage('" + lastPageNum + "', '')\">다음목록</a>");
		}

		return sb;
	}

	public static StringBuffer pageing_backup(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		sb.append("<a href=\"javascript:fnGoPage('1', '')\"><img src='"+contextPath+"/images/front/board/btn_first.gif' alt='처음으로' /></a>");

		// 이전 X 페이지 이동
		sb.append(" <a class='prev' href=\"javascript:fnGoPage('" + prevPageGroup + "', '')\"><img src='"+contextPath+"/images/front/board/btn_prev.gif' alt='이전 "
				+ pageBlock + "페이지'/></a>");
		// 페이지 번호 표시
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i == pageNo) {
				sb.append(" <span class='num'><strong>" + i + "</strong></span>");
				if (endPageNum != i) {
				}
			} else {
				sb.append(" <span class='num'><a href=\"javascript:fnGoPage('" + i + "', '')\">");
				sb.append(i);
				sb.append("</a></span>");
				if (endPageNum != i) {
				}
			}
		}
		// 다음 X 페이지 이동
		sb.append(" <a class='next' href=\"javascript:fnGoPage('" + nextPageGroup + "', '')\"><img src='"+contextPath+"/images/front/board/btn_next.gif' alt='다음"
				+ pageBlock + "페이지' /></a>");
		// 마지막 페이지 이동
		sb.append(" <a href=\"javascript:fnGoPage('" + lastPageNum + "', '')\"><img src='"+contextPath+"/images/front/board/btn_last.gif' alt='마지막  페이지' /></a>");

		return sb;
	}

	// jstl custom tag
		public static StringBuffer jstlPageing(String funcName, int totCnt, int pageLimit, int pageBlock, int pageNo) {

			StringBuffer sb = new StringBuffer();

			int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
			int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																		   // 보여질 시작
																		   // 페이지 번호
			int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
			if (endPageNum > lastPageNum)
				endPageNum = lastPageNum; // 종료 페이지 범위 처리

			int prevPageGroup = 1;
			int nextPageGroup = lastPageNum;

			if (startPageNum - pageBlock < 1) {
				prevPageGroup = 1;
			} else {
				prevPageGroup = startPageNum - pageBlock;
				if (prevPageGroup <= 0) {
					prevPageGroup = 1;
				}
			}

			if (endPageNum + 1 > lastPageNum) {
				nextPageGroup = lastPageNum;
			} else {
				nextPageGroup = endPageNum + 1;
			}

			// 처음 페이지로 이동
			sb.append("<a href=\"javascript:" + funcName
					+ "('1', '')\" class=\"direction\"><img src='/dwweb/images/common/btn_page_first.gif' alt='첫페이지' /></a>");

			// 이전 X 페이지 이동
			sb.append(" <a href=\"javascript:" + funcName + "('" + prevPageGroup
					+ "', '')\" class=\"direction\"><img src='/dwweb/images/common/btn_page_prev.gif' alt='이전 " + pageBlock
					+ "페이지'/></a>");
			// 페이지 번호 표시
			for (int i = startPageNum; i <= endPageNum; i++) {
				if (i == pageNo) {
					sb.append(" <strong>" + i + "</strong>");
					if (endPageNum != i) {
					}
				} else {
					sb.append(" <a href=\"javascript:" + funcName + "('" + i + "', '')\" class=\"num\">");
					sb.append(i);
					sb.append("</a>");
					if (endPageNum != i) {
					}
				}
			}
			// 다음 X 페이지 이동
			sb.append(" <a href=\"javascript:" + funcName + "('" + nextPageGroup
					+ "', '')\" class=\"direction\"><img src='/dwweb/images/common/btn_page_next.gif' alt='다음" + pageBlock
					+ "페이지' /></a>");
			// 마지막 페이지 이동
			sb.append(" <a href=\"javascript:" + funcName + "('" + lastPageNum
					+ "', '')\" class=\"direction\"><img src='/dwweb/images/common/btn_page_last.gif' alt='마지막페이지' /></a>");

			return sb;
		}

	// 모바일 페이징 (컨텍트 루트, 페이지, 전체개수, 페이지당 표시의 개수, 한 화면에 보여질 페이지 번호 개수, 현재 선택된 페이지
	// 번호)
	public static StringBuffer mobilPageing(String contextPath, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		sb.append("<div class='pageing'>");
		sb.append("<a href='#' onclick=\"fnGoPage('" + prevPageGroup + "', '" + contextPath + "')\" class='btn_prev'>이전</a>");
		sb.append("<span class='numbering'>");

		for (int i = startPageNum; i <= endPageNum; i++) {

			if (i == pageNo) {
				sb.append("<a href='#' class='on'>" + i + "</a>");
				if (endPageNum != i) {
				} else {
					sb.append(" ");
				}
			} else {

				sb.append("<a href='#' onclick=\"javascript:fnGoPage('" + i + "', '" + contextPath + "')\">" + i + "</a>");

				if (endPageNum != i) {
				} else {
					sb.append(" ");
				}

			}
		}

		sb.append("</span>");
		sb.append("<a href='#' onclick=\"fnGoPage('" + nextPageGroup + "', '" + contextPath + "')\" class='btn_next'>다음</a>");
		sb.append("</div>");

		return sb;
	}

	public static StringBuffer pageingFrontAjax(String contextPath, String function, int totCnt, int pageLimit, int pageBlock, int pageNo) {

		StringBuffer sb = new StringBuffer();

		if (function == null || "".equals(function)) {
			function = "fnGoPage";
		}

		int lastPageNum = (totCnt - 1) / pageLimit + 1; // 전체 페이지 개수
		int startPageNum = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 화면에
																	   // 보여질 시작
																	   // 페이지 번호
		int endPageNum = startPageNum + pageBlock - 1; // 화면에 보여질 종료 페이지 번호
		if (endPageNum > lastPageNum)
			endPageNum = lastPageNum; // 종료 페이지 범위 처리

		int prevPageGroup = 1;
		int nextPageGroup = lastPageNum;

		if (startPageNum - pageBlock < 1) {
			prevPageGroup = 1;
		} else {
			prevPageGroup = startPageNum - pageBlock;
			if (prevPageGroup <= 0) {
				prevPageGroup = 1;
			}
		}

		if (endPageNum + 1 > lastPageNum) {
			nextPageGroup = lastPageNum;
		} else {
			nextPageGroup = endPageNum + 1;
		}

		// 처음 페이지로 이동
		sb.append("<a href=\"javascript:" + function + "('1', '')\"><img src='"+contextPath+"/images/board/btn_first.gif' alt='첫페이지' /></a>");

		// 이전 X 페이지 이동
		sb.append(" <a href=\"javascript:" + function + "('" + prevPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_prev.gif' alt='이전 " + pageBlock + "페이지'/></a>");
		// 페이지 번호 표시
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i == pageNo) {
				sb.append(" <strong>" + i + "</strong>");
				if (endPageNum != i) {
				}
			} else {
				sb.append(" <a href=\"javascript:" + function + "('" + i + "', '')\" class=\"num\">");
				sb.append(i);
				sb.append("</a>");
				if (endPageNum != i) {
				}
			}
		}
		// 다음 X 페이지 이동
		sb.append(" <a href=\"javascript:" + function + "('" + nextPageGroup
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_next.gif' alt='다음" + pageBlock + "페이지' /></a>");
		// 마지막 페이지 이동
		sb.append(" <a href=\"javascript:" + function + "('" + lastPageNum
				+ "', '')\"><img src='"+contextPath+"/images/board/btn_last.gif' alt='마지막페이지' /></a>");

		return sb;
	}

}
