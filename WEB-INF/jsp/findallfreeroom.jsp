<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>All rooms</title>
</head>
<body>

<%@include file="header.jsp" %>
_____________________________________________________________________________
<form action="${pageContext.request.contextPath}/findallfreeroom" method="get" enctype="multipart/form-data">
    <label><br>
        <h1><fmt:message key="page.findallfreeroom.list.of.all.free.room"/></h1>
       <c:forEach var="room" items="${requestScope.freeroom}">
            <li>
                <img width="210" height="170" src="${pageContext.request.contextPath}/users/users${room.image}" alt="No image"><br>
                <a href="${pageContext.request.contextPath}/room?id=${room.id}"><fmt:message key="page.findallfreeroom.description.room"/>: ${room.number} - ${room.status}</a>
            </li>
        </c:forEach>
    </label>
</form><br>
<%--<form action="${pageContext.request.contextPath}/order" method="get">--%>
<%--  <button type="submit">Back to make a new order</button>--%>
<%--</form>--%>
_____________________________________________________________________________
<br>
<%@include file="footer.jsp" %>
</body>
</html>