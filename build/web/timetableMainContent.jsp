<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timetable Main Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

    </head>
    <body>
        <form>
            <div class="panel panel-primary panel-timetableMainContent">
                <div class="panel-heading">Faculty Workload Content</div>
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
                            <td style="text-align: center">${tableContent.timetable_main_id}</td>
                            <td style="text-align: center">${tableContent.timetable_id}</td>
                            <td style="text-align: center">${tableContent.day_id}</td>
                            <td style="text-align: center">${tableContent.start_time}</td>
                            <td style="text-align: center">${tableContent.end_time}</td>
                            <td style="text-align: center">${tableContent.div_id}</td>
                            <td style="text-align: center">${tableContent.room_allocation_id}</td>
                            <td style="text-align: center">${tableContent.faculty_allocation_subject_id}</td>  
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>
    </body>
</html>
