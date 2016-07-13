<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Degree Type Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var degree_type = document.degree_typeForm.degree_type.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(degree_type))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(degree_type_id)
            {
                document.degree_typeForm.id_UD.value = degree_type_id;
                document.degree_typeForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.degree_typeForm.submit();
            }
            function updateContent(degree_type_id)
            {
                var degree_type = document.getElementById(degree_type_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;


                document.degree_typeForm.id_UD.value = degree_type_id;
                document.degree_typeForm.degree_type_UD.value = degree_type;
                document.degree_typeForm.action = "${pageContext.request.contextPath}/TableUpdateController/degree_type";
                document.degree_typeForm.submit();
            }
        </script>
    </head>
    <body>
        <form method="post" name="degree_typeForm" action="${pageContext.request.contextPath}/TableInsertController/degree_type" onsubmit="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="degree_type_UD" id="degree_type_UD">
            <input type="hidden" value="degree_type" name="table_name" id="table_name">

            <div class="panel panel-primary panel-degreeTypeContent">
                <div class="panel-heading">Degree Type Content</div>
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
                        <tr id="${tableContent.degree_type_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.degree_type_id}" name="${tableContent.degree_type_id}" disabled /></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.degree_type}" name="${tableContent.degree_type}" readonly="true" ondblclick="this.readOnly = '';" /></td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.degree_type_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.degree_type_id}')">Delete</a></td>  
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="degree_type_id" disabled /></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="degree_type" readonly="true" ondblclick="this.readOnly = '';" /></td>

                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
