<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Заказ на обработке</title>
</head>
<body>
<%@include file="header.jsp" %><br>
_____________________________________________________________________________
<form action="${pageContext.request.contextPath}/orderdone" method="get">
  <fmt:message key="page.orderdone.message"/>
</form><br>
_____________________________________________________________________________
<%@include file="footer.jsp" %>
</body>
</html>