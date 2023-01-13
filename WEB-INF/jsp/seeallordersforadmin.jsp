<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
  <title>See all orders for admin</title>
</head>
<body>
<%@ include file="header.jsp" %><br>
_____________________________________________________________________________
<h1><fmt:message key="page.seeallordersforadmin.orders"/></h1>
<ul>
  <c:forEach var="order" items="${requestScope.order}">
    <li>
      <a href="${pageContext.request.contextPath}/checkorderexisting?orderId=${order.id}">
        Order id: ${order.id}, User id: ${order.userInfo}, Room id: ${order.room},
        Begin time: ${order.beginTimeOfTheOrder}, End time: ${order.endTimeOfTheOrder},
        Condition: ${order.condition}, Message: ${order.message}
      </a>
    </li>
  </c:forEach>
</ul>
</form>

_____________________________________________________________________________
<%@include file="footer.jsp" %>
</body>
</html>