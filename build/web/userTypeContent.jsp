<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Type Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var user_type = document.userTypeForm.user_type.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(user_type))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(user_type_id)
            {
                document.userTypeForm.id_UD.value = user_type_id;
                document.userTypeForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.userTypeForm.submit();
            }
            function updateContent(user_type_id)
            {
                var user_type = document.getElementById(user_type_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var isActive = document.getElementById(user_type_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;
                document.userTypeForm.id_UD.value = user_type_id;
                document.userTypeForm.user_type_UD.value = user_type;
                document.userTypeForm.isActive.value = isActive;
                document.userTypeForm.action = "${pageContext.request.contextPath}/TableUpdateController/userType";
                document.userTypeForm.submit();
            }
        </script>

    </head>
    <body>
        <form name="userTypeForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/user_type" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="user_type_UD" id="user_type_UD">
            <input type="hidden" value="" name="isActive" id="isActive">
            <input type="hidden" value="user_type" name="table_name" id="table_name">

            <div class="panel panel-primary panel-userTypeContent">
                <div class="panel-heading">User Type Content</div>
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
                        <tr id="${tableContent.user_type_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.user_type_id}" name="${tableContent.user_type_id}" disabled></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.user_type}" name="${tableContent.user_type}" readonly="true" ondblclick="this.readOnly = '';"></td>
                            <td style="text-align: center">
                                <select id="tableDropDownisActive" name="tableDropDownisActive" class="form-control">
                                    <option value="true" <c:if test="${tableContent.isActive == true }">selected</c:if>>TRUE</option>
                                    <option value="false" <c:if test="${tableContent.isActive == false }">selected</c:if>>FALSE</option>
                                    </select>
                                </td>

                                <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.user_type_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.user_type_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="user_type_id" disabled></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="user_type" readonly="true" ondblclick="this.readOnly = '';"></td>
                        <td style="text-align: center">
                            <select id="tableDropDownisActive" name="tableDropDownisActive" class="form-control">
                                <option value="true">TRUE</option>
                                <option value="false">FALSE</option>
                            </select>
                        </td>
                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>

                </table>
            </div>
        </form>

    </body>
</html>
