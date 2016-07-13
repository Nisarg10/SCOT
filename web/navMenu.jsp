<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/navBar.css">
        <link rel="stylesheet" type="text/css" href="css/navBar.css">
    </head>
    <body>
        <div class="nav-wrapper" style="position: absolute; top:20px; left: 200px">
            <nav class="nav-main">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home.jsp">User Detail</a></li>
                    <li><a href="#">Time Table</a></li>
                    <li><a href="${pageContext.request.contextPath}/TimetableController/data_required">Create Time Table</a></li>
                    <li><a href="#">Faculty Time Table</a></li>
                    <c:if test="${user_type_id eq '1' or user_type_id eq '2'}"><li><a href="${pageContext.request.contextPath}/UserTableController/showTableNames" >Database</a></li></c:if>
                    <c:if test="${user_type_id eq '1' or user_type_id eq '2'}"><li><a href="${pageContext.request.contextPath}/UserController/notification">Notification</a></li></c:if>
                    <li><a href="${pageContext.request.contextPath}/help.jsp">Help</a></li>
                </ul>
            </nav>
        </div>
    </body>
</html>
