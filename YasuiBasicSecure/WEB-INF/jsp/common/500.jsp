<%@ page isErrorPage="true"%>
<%@ page contentType="text/html; charset=UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/common/include.jsp" />
<title>エラーが発生しました</title>
<style>
body {
	background: #f9fee8;
	margin: 0;
	padding: 20px;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #666666;
}

.error_page {
	width: 800px;
	padding: 50px;
	margin: auto;
}

.error_page h1 {
	margin: 20px 0 0;
}

.error_page p {
	margin: 10px 0;
	padding: 0;
}

a {
	color: #9caa6d;
	text-decoration: none;
}

a:hover {
	color: #9caa6d;
	text-decoration: underline;
}

table#table01 {
	width: 750px;
	margin-left: auto;
	margin-right: auto;
	border: 1px #E3E3E3 solid;
	border-collapse: collapse;
	border-spacing: 0;
}

table#table01 th {
	padding: 5px;
	border: #E3E3E3 solid;
	border-width: 0 0 1px 1px;
	background: #F5F5F5;
	font-weight: bold;
	line-height: 120%;
	text-align: center;
}

table#table01 td {
	text-align: left;
	padding: 5px;
	border: 1px #E3E3E3 solid;
	border-width: 0 0 1px 1px;
	text-align: center;
}
</style>
<%
	// Java 例外オブジェクト
	Throwable exceptionObject = (Throwable) request
			.getAttribute("javax.servlet.error.exception");

	// エラーの発生したrequest URI
	request.setAttribute("requestURI", request.getRequestURI());
	//"javax.servlet.error.request_uri"

	// Java例外タイプ
	request.setAttribute("exception_type",
			request.getAttribute("ERROR_EXCEPTION_TYPE"));
	//"javax.servlet.error.exception_type");

	// HTTP status メッセージ
	request.setAttribute("servlet_name", request.getServletPath());
	//    "javax.servlet.error.message");

	// servlet 名
	request.setAttribute("servlet_name", request.getServletPath());
	//     "javax.servlet.error.servlet_name");

	// statusコード
	request.setAttribute("status_code", response.getStatus());
	//      "javax.servlet.error.status_code");

	//例外トレース
	request.setAttribute("stack_trace", exception.getStackTrace());

	//例外メッセージ
	request.setAttribute("exception_message", exception.getMessage());
	
	//例外メッセージ
	request.setAttribute("exception_cause", exception.getCause());
%>
</head>
<body class="login">
	<div class="error_page">
		<img alt="sorry" src="img/sad.gif">
		<h1>We're sorry...</h1>
		<p>
			現在の画面において、致命的なエラーが発生しました。 <br />
			しばらくたってもエラーが改善されない場合には、本画面のキャプチャを添付の上、 <a href="mailto:foo@bar.com">
				YASUI家具ヘルプデスク </a> までご連絡ください。
		</p>
		<hr />
		<p>
			<a href="http://localhost/YasuiBasic/"> サイトのトップページに戻る </a>
		</p>
	</div>
	<c:if test="${initParam['mode.debug']=='true'}">
		<table id="table01">
			<tr>
				<th valign="top" nowrap>ステータス</th>
				<td><c:out value="${status_code}" />： 
				<c:out value="${exception_message}" /></td>
			</tr>
			<tr>
				<th valign="top" nowrap>例外発生箇所（URI）</th>
				<td><c:out value="${request_uri}" /></td>
			</tr>
			<tr>
				<th valign="top" nowrap>例外クラス（サーブレット名）</th>
				<td><c:out value="${exception}" />（<c:out
						value="${servlet_name}" />）</td>
			</tr>
			<tr>
				<th valign="top" nowrap>例外トレース</th>
				<td><c:out value="${stack_trace}" /></td>
			</tr>
			<tr>
				<th valign="top" nowrap>例外根本原因</th>
				<td><c:out value="${exception_cause}" /></td>
			</tr>
		</table>
	</c:if>
</body>
</html>
