<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Комната</title>
</head>
<body>
<%@include file="header.jsp" %><br>
_____________________________________________________________________________
<h1><fmt:message key="page.roombyid.room"/></h1>
<ul>
    <c:forEach var="room" items="${requestScope.roomlist}">
        <ul>
            Номер комнаты: ${room.number}<br>
            Этаж: ${room.floor}<br>
            Стоимость за сутки: ${room.dayPrice}<br>
            Статус комнаты: ${room.status}<br>
        </ul>
    </c:forEach>
</ul>
_____________________________________________________________________________
<%@ include file="footer.jsp" %>
</body>
</html>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Комната</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1><fmt:message key="page.roombyid.room"/></h1>--%>
<%--<ul>--%>
<%--    <c:forEach var="room" items="${requestScope.roomlist}">--%>
<%--        <ul>--%>
<%--            <fmt:message key="page.roombyid.numberroom"/>: ${room.number}<br>--%>
<%--            <fmt:message key="page.roombyid.floor"/>: ${room.floor}<br>--%>
<%--            <fmt:message key="page.roombyid.dayprice"/>: ${room.dayPrice}<br>--%>
<%--            <fmt:message key="page.roombyid.status"/>: ${room.status}<br>--%>
<%--        </ul>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>
<%--</body>--%>
<%--</html>--%>
