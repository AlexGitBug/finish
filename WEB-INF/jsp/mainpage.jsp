<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Главная страница/Страница ожидания</title>
</head>
<body>
<%@include file="header.jsp" %><br>
_____________________________________________________________________________
<h1><fmt:message key="page.mainpage.main page"/></h1>
<ul>
    Вы на главной странице. Спасибо, что с нами
</ul>
<br>
<form action="${pageContext.request.contextPath}/userorderlist" method="get">
    <button type="submit"><fmt:message key="page.mainpage.submit.button.list.of.my.orders"/></button>
</form>
<br>
_____________________________________________________________________________
<%@include file="footer.jsp" %>
</body>
</html>