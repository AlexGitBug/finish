<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Check booking</title>
</head>
<body>
<%@ include file="header.jsp" %>
____________________________________________________________________________________
<h1><fmt:message key="page.checkorder.confirm"/></h1>
<ul>
    <b>Order description:</b><br>
    Order Id: ${requestScope.order.id}<br>
    User Id: ${requestScope.order.userInfo.id}<br>
    Room Id: ${requestScope.order.room.id}<br>
    Begin time: ${requestScope.order.beginTimeOfTheOrder}<br>
    End time: ${requestScope.order.endTimeOfTheOrder}<br>
    Condition: ${requestScope.order.condition}<br>
    Message: ${requestScope.order.message}<br>
</ul>

<ul>
    <b>Room description</b><br>
    Number room: ${requestScope.roomFromOrder.number}<br>
    Quantity bed: ${requestScope.quantityBed.capacity}<br>
    Floor : ${requestScope.roomFromOrder.floor}<br>
    Category room: ${requestScope.categoryRoom.kind}<br>
    Day price: ${requestScope.roomFromOrder.dayPrice}<br>
</ul>
<br>

<img width="210" height="170" src="${pageContext.request.contextPath}/users/users${requestScope.roomFromOrder.image}" alt="No image"><br>
<br>
<c:if test="${requestScope.order.condition == 'WANT_TO_RESERVE'}">
<form action="${pageContext.request.contextPath}/checkorder" method="get">
    <button type="submit" name="orderId" value="${requestScope.order.id}"><fmt:message key="page.checkorder.check"/></button>
</form>
</c:if>
<form action="${pageContext.request.contextPath}/checkorderbookedfree" method="get">
    <button type="submit" name="orderId" value="${requestScope.order.id}"><fmt:message key="page.checkorder.change.status.from.booked.for.free"/></button>
</form>

_____________________________________________________________________________<br>
<%@include file="footer.jsp" %>
</body>
</html>