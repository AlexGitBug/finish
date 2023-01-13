<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Заказ</title>
</head>
<body>
<%@include file="header.jsp" %>
<br>
_____________________________________________________________________________

<h1><fmt:message key="page.orderbyid.orderbyid"/></h1>

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
    <b>User description</b><br>
    Name: ${requestScope.userInfo.firstName}<br>
    LastName: ${requestScope.userInfo.lastName}<br>
    Telephone: ${requestScope.userInfo.telephone}<br>
</ul>
<ul>
    <b>Room description</b><br>
    Number room: ${requestScope.roomFromOrder.number}<br>
    Quantity bed: ${requestScope.quantityBed.capacity}<br>
    Floor : ${requestScope.roomFromOrder.floor}<br>
    Category room: ${requestScope.categoryRoom.kind}<br>
    Day price: ${requestScope.roomFromOrder.dayPrice}<br>
</ul>


<img width="210" height="170" src="${pageContext.request.contextPath}/users/users${requestScope.roomFromOrder.image}"
     alt="No image"><br>
<br>
<br>

<form action="${pageContext.request.contextPath}/messageforadmintocancel" method="get">
    <button type="submit" name="orderId" value="${order.id}"><fmt:message
            key="page.orderbyid.submit.button.send"/></button>
</form>
<form action="${pageContext.request.contextPath}/payorder" method="get">
    <button type="submit" name="orderId" value="${order.id}"><fmt:message
            key="page.pay.submit.button.send"/></button>
</form>

_____________________________________________________________________________
<%@ include file="footer.jsp" %>
</body>
</html>
