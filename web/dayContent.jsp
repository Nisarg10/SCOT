<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Day Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var day = document.dayForm.day.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(degree_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(day_id)
            {
                document.dayForm.id_UD.value = day_id;
                document.dayForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.dayForm.submit();
            }
            function updateContent(day_id)
            {
                var day = document.getElementById(day_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;

                document.dayForm.id_UD.value = day_id;
                document.dayForm.day_UD.value = day;

                document.dayForm.action = "${pageContext.request.contextPath}/TableUpdateController/day";
                document.dayForm.submit();
            }
        </script>
    </head>
    <body>
        <form method="post" name="dayForm" action="${pageContext.request.contextPath}/TableInsertController/day" onsubmit="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="day_UD" id="day_UD">
            <input type="hidden" value="day" name="table_name" id="table_name">

            <div class="panel panel-primary panel-dayContent">
                <div class="panel-heading">Day Content</div>
                <table border='0' align='center' class="table table-striped">
                    <tr>
                        <c:forEach var="tableContent" items="${tableContent}">
                            <c:if test="${tableContent.columnName != null}">
                                <th style="text-align: center">${tableContent.columnName}</th>
                                </c:if>
                            </c:forEach>
                        <th style="text-align: center">Update</th>
                        <th style="text-align: center">Delete</th>

                    </tr>
                    <c:forEach var="tableContent" items="${tableContent}">
                        <tr id="${tableContent.day_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.day_id}" name="${tableContent.day_id}" disabled /></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.day}" name="${tableContent.day}" readonly="true" ondblclick="this.readOnly = '';"  /></td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.day_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.day_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="day_id" disabled /></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="day" readonly="true" ondblclick="this.readOnly = '';"  /></td>

                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>
                </table>
            </div>

        </form>

    </body>
</html>
