<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Категория комнат:</title>
</head>
<body>
<%@include file="header.jsp" %><br>
_____________________________________________________________________________
<h1><fmt:message key="page.roomfindall.room"/></h1>
<ul>
    <c:forEach var="room" items="${requestScope.roomlist}">
        <li>
            <a href="${pageContext.request.contextPath}/room?id=${room.id}">${room.number} ${room.status}</a>
        </li>
    </c:forEach>
</ul>
_____________________________________________________________________________
<%@ include file="footer.jsp" %>
</body>
</html>

