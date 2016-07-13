<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proxy Table Content</title> 

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

    </head>
    <body>
        <form name="check">

            <div class="panel panel-primary panel-proxyTableContent">
                <div class="panel-heading">Proxy Table Content</div>
                <table border='0' align='center' class="table table-striped">
                    <tr>
                        <c:forEach var="tableContent" items="${tableContent}">
                            <c:if test="${tableContent.columnName != null}">
                                <th style="text-align: center">${tableContent.columnName}</th>
                                </c:if>
                            </c:forEach>   
                    </tr>
                    <c:forEach var="tableContent" items="${tableContent}">
                        <tr>
                            <td style="text-align: center">${tableContent.proxy_table_id}</td>
                            <td style="text-align: center">${tableContent.timetable_id}</td>
                            <td style="text-align: center">${tableContent.proxy_date}</td>
                            <td style="text-align: center">${tableContent.room_allocation_id}</td>
                            <td style="text-align: center">${tableContent.faculty_allocation_subject_id}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>

    </body>
</html>
