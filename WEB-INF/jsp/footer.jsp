<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Переход на главную страницу</title>
</head>
<body>
<%--ADMIN--%>
<c:if test="${sessionScope.user.role.id == 2}">
    <div id="main page">
        <form action="${pageContext.request.contextPath}/mainpage" method="post">
            <button type="submit"><fmt:message key="page.footer.back.to.main.page"/></button>
        </form>
        <form action="${pageContext.request.contextPath}/adminpage" method="get">
            <button type="submit"><fmt:message key="page.footer.back.to.admin.page"/></button>
        </form>
    </div>
</c:if>
<%--USER--%>
<c:if test="${sessionScope.user.role.id == 1}">
    <div id="main page">
        <form action="${pageContext.request.contextPath}/mainpage" method="post">
            <button type="submit"><fmt:message key="page.footer.back.to.main.page"/></button>
        </form>
        <form action="${pageContext.request.contextPath}/order" method="get">
            <button type="submit"><fmt:message key="page.footer.back.to.order.page"/></button>
        </form>
    </div>
</c:if>
</body>
</html>