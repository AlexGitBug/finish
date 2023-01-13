<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Добавление комнаты</title>
</head>
<body>
<%@ include file="header.jsp" %><br>
_____________________________________________________________________________
<h1><fmt:message key="page.addroom.addroom"/></h1>
<form action="${pageContext.request.contextPath}/addroom" method="post" enctype="multipart/form-data">
  <label for="number_room"><fmt:message key="page.addroom.roomNumber"/>:
    <select name="number_room" id="number_room">
      <c:forEach var="number_room" items="${requestScope.numbers}">
        <option value="${number_room}">${number_room}</option>
      </c:forEach>
    </select>
  </label><br>
  <label for="quantitybed"><fmt:message key="page.addroom.quantityBed"/>:
    <select name="quantity_bed_id" id="quantitybed">
      <c:forEach var="quantitybed" items="${requestScope.quantitybed}">
        <option value="${quantitybed.id}">${quantitybed.capacity}</option>
      </c:forEach>
    </select>
  </label><br>
  <label for="categoryroom"><fmt:message key="page.addroom.categoryRoom"/>:
    <select name="category_room_id" id="categoryroom">
      <c:forEach var="categoryroom" items="${requestScope.categoryroom}">
        <option value="${categoryroom.id}">${categoryroom.kind}</option>
      </c:forEach>
    </select>
  </label><br>
  <label for="floors"><fmt:message key="page.addroom.floor"/>:
    <select name="floor" id="floors">
      <c:forEach var="floors" items="${requestScope.floors}">
        <option value="${floors}">${floors}</option>
      </c:forEach>
    </select>
  </label><br>
  <label for="dayprice"><fmt:message key="page.addroom.dayprice"/>:
    <input type="dayprice" name="day_price" id="dayprice" required>
  </label><br>
  <label for="statuses"><fmt:message key="page.addroom.status"/>:
    <select name="status" id="statuses">
      <c:forEach var="statuses" items="${requestScope.statuses}">
        <option value="${statuses}">${statuses}</option>
      </c:forEach>
    </select>
  </label><br>
  <label for="imageid"><fmt:message key="page.addroom.image"/>:
    <input type="file" name="image" id="imageid" required>
  </label><br>
  <button type="submit"><fmt:message key="page.addroom.submit.button.send"/></button>
</form><br>
_____________________________________________________________________________
<%@ include file="footer.jsp" %>
</body>
</html>