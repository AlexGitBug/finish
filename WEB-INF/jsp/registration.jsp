<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
</head>
<body>
<%@include file="header.jsp" %>

<h1><fmt:message key="page.registration.registrationpage"/></h1>
<form action="${pageContext.request.contextPath}/registration" method="post" enctype="multipart/form-data">
    <label for="name"><fmt:message key="page.registration.name"/>
        <input type="text" name="name" id="name" required>
    </label><br>
    <label for="lastname"><fmt:message key="page.registration.lastname"/>
        <input type="text" name="lastname" id="lastname" required>
    </label><br>
    <label for="birthday"><fmt:message key="page.registration.birthday"/>
        <input type="date" name="birthday" id="birthday" required>
    </label><br>
    <label for="telephoneNumber"><fmt:message key="page.registration.telephoneNumber"/>
        <input type="tel" name="telephoneNumber" placeholder="+375 (29) 123-45-67"
               value="${param.telephoneNumber}" id="telephoneNumber" required>
    </label><br>
    <label for="email"><fmt:message key="page.registration.email"/>
        <input type="text" name="email" placeholder="email@gmail.com" id="email" required>
    </label><br>
    <label for="password"><fmt:message key="page.registration.password"/>
        <input type="password" name="password" id="password" required>
    </label><br><fmt:message key="page.registration.role"/>
    <select name="role" id="role">
        <c:forEach var="role" items="${requestScope.roles}">
            <option value="${role.id}">${role.rank}</option>
        </c:forEach>
    </select><br>
    <button type="submit"><fmt:message key="page.registration.submit.button"/></button>
    <c:if test="${param.telephoneNumber != null}">
        <div style="color: red">
            <span><fmt:message key="page.registration.telephone.number.or.email.is.not.correct"/></span>
        </div>
    </c:if>
</form>
</body>
</html>

<%--.floor(req.getParameter("floor"))--%>
<%--.dayPrice(req.getParameter("day_price"))--%>
<%--.status(req.getParameter("status"))--%>
<%--.image(req.getPart("image"))--%>
<%--.build()--%>
<%--<h1>Список комнат</h1>--%>
<%--<ul>--%>
<%--    <c:forEach var="room" items="${requestScope.roomlist}">--%>
<%--        <li>--%>
<%--            <img width="252" height="252" src="${pageContext.request.contextPath}/images/users${room.image}" alt="User image"><br>--%>
<%--                &lt;%&ndash;            <img width="210" height="170" src="${pageContext.request.contextPath}/images${car.image}" alt="No image">&ndash;%&gt;--%>
<%--            <a href="/room?id=${room.id}">Описание(номер комнаты, статус): ${room.number}- ${room.status}</a>--%>
<%--        </li> <br--%>
<%--    </c:forEach>--%>
<%--</ul>--%>