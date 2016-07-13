
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Institute Detail Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var institute_name = document.instituteDetailForm.institute_name.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(institute_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(institute_id)
            {
                document.instituteDetailForm.id_UD.value = institute_id;
                document.instituteDetailForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.instituteDetailForm.submit();
            }
            function updateContent(institute_id)
            {
                var institute_name = document.getElementById(institute_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;

                document.instituteDetailForm.id_UD.value = institute_id;
                document.instituteDetailForm.institute_name_UD.value = institute_name;
                document.instituteDetailForm.action = "${pageContext.request.contextPath}/TableUpdateController/instituteDetail";
                document.instituteDetailForm.submit();
            }
        </script>

    </head>
    <body>   
        <form name="instituteDetailForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/institute_detail" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="institute_name_UD" id="institute_name_UD">
            <input type="hidden" value="institute_detail" name="table_name" id="table_name">


            <div class="panel panel-primary panel-instituteDetailContent">
                <div class="panel-heading">Institute Detail Content</div>
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
                        <tr id="${tableContent.institute_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.institute_id}" name="${tableContent.institute_id}" disabled></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.institute_name}" name="${tableContent.institute_name}" readonly="true" ondblclick="this.readOnly = '';"></td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.institute_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.institute_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="institute_id" disabled></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="institute_name" readonly="true" ondblclick="this.readOnly = '';"></td>
                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>