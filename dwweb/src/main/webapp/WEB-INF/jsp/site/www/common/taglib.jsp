<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="string" uri="/WEB-INF/tld/string.tld" %>
<%@ taglib prefix="paging" uri="/WEB-INF/tld/paging.tld" %>
<%@ taglib prefix="property" uri="/WEB-INF/tld/property.tld" %>
<%-- <%@ taglib prefix="tiels" uri="http://tiles.apache.org/tags-tiles"%> --%>
<%
//TEXTAREA Tag 값 치환을 위한 임시 변수
pageContext.setAttribute("crlf", "\r\n");
//큰따옴표
pageContext.setAttribute("dquotes", "&#34;");
//따옴표
pageContext.setAttribute("squotes", "&#39;");
%>