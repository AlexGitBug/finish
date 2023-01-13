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
<form action="/findallrooms" method="get" enctype="multipart/form-data">
  <label><br>
    <h1><fmt:message key="page.findallrooms.list.of.all.rooms"/></h1>
    <ul><c:forEach var="room" items="${requestScope.roomlist}">
      <li>
        <img width="210" height="170" src="${pageContext.request.contextPath}/users/users${room.image}" alt="No image"><br>
        <a href="/room?id=${room.id}"><fmt:message key="page.findallrooms.description.room"/>: ${room.number} - ${room.status}</a>
      </li>
    </c:forEach>
    </ul>
  </label>
</form><br>
<%--<form action="${pageContext.request.contextPath}/order" method="get">--%>
<%--  <button type="submit"><fmt:message key="page.findallrooms.submit.button.back"/></button>--%>
<%--</form>--%>
_____________________________________________________________________________
<br>
<%@include file="footer.jsp" %>
</body>