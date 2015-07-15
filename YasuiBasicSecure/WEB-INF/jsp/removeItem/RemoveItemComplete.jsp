<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/jsp/common/tdk.jsp" />
<c:import url="/WEB-INF/jsp/common/include.jsp" />
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/header.jsp" />
	<c:import url="/WEB-INF/jsp/common/navmenu.jsp" />
	<c:choose>
		<c:when test="${role != 'administrator'}">
			<h2>管理者以外はこの画面にアクセスすることはできません。</h2>
			<form method="POST" action="/YasuiBasic/Index">
				<input type="submit" name="return" value="ログイン画面に戻る" />
			</form>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty errormessage}">
				<c:forEach var="message" items="${errormessage}"
					varStatus="statusError">
					<span class="errormsg">(Error)：${message}</span>
					<br />
				</c:forEach>
			</c:if>
			<h2>商品の削除を完了しました</h2>
			<form method="GET" action="ListItem">
				<input type="submit" name="return" value="商品一覧に戻る" />
			</form>
		</c:otherwise>
	</c:choose>
	<c:remove var="items" />
	<c:remove var="targetItems" />
	<c:remove var="canRemove" />
	<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</body>
</html>