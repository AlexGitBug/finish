<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Заказы</title>
</head>
<body>

<%@include file="header.jsp" %>
_____________________________________________________________________________<br>
<h1><fmt:message key="page.orders.ordering"/></h1>
<form action="${pageContext.request.contextPath}/order" method="post">
    <label><fmt:message key="page.orders.rooms"/>:
        <select name="roomid" id="roomid">
            <c:forEach var="roomid" items="${requestScope.roomid}">
                    <option value="${roomid.id}">${roomid.number}</option>
            </c:forEach>
        </select>
    </label><br>
    <label for="begintime"><fmt:message key="page.orders.beginTime"/>:
        <input type="date" name="begintime" id="begintime">
    </label><br>
    <label for="endtime"><fmt:message key="page.orders.endTime"/>:
        <input type="date" name="endtime" id="endtime">
    </label><br>
    <label><fmt:message key="page.orders.condition"/>:
        <input type="radio" name="conditions" value="WANT_TO_RESERVE"><fmt:message key="page.orders.want.to.reserve"/>
        <%--        <select name="conditions" id="conditions">--%>
        <%--            <c:forEach var="conditions" items="${requestScope.conditions}">--%>
        <%--                <option value="${conditions}">${conditions}</option>--%>
        <%--            </c:forEach>--%>
        <%--        </select>--%>
    </label><br>
    <label for="message"><fmt:message key="page.orders.message"/>:
        <input type="text" name="message" id="message">
    </label><br>
    <button type="submit"><fmt:message key="page.orders.submit.button.Send"/></button><br>
</form>
<c:if test="${param.begintime != null}">
    <div style="color: red">
        <span><fmt:message key="page.orders.begin.time.is.not.correct"/></span>
    </div>
</c:if>
<br>
<form action="${pageContext.request.contextPath}/userorderlist" method="get">
    <button type="submit"><fmt:message key="page.orders.submit.button.list.of.my.orders"/></button>
</form>
<br>
<form action="${pageContext.request.contextPath}/findallfreeroom" method="get">
    <button type="submit"><fmt:message key="page.orders.submit.button.display.all.free.rooms"/></button>
</form><br>

_____________________________________________________________________________
<%@include file="footer.jsp"%>

</body>
</html>