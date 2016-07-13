<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Type Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var class_type = document.class_typeForm.class_type.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(class_type))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(class_type_id)
            {
                document.class_typeForm.id_UD.value = class_type_id;
                document.class_typeForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.class_typeForm.submit();
            }
            function updateContent(class_type_id)
            {
                var class_type = document.getElementById(class_type_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;


                document.class_typeForm.id_UD.value = class_type_id;
                document.class_typeForm.class_type_UD.value = class_type;
                document.class_typeForm.action = "${pageContext.request.contextPath}/TableUpdateController/class_type";
                document.class_typeForm.submit();
            }
        </script>
    </head>
    <body>
        <form methd="post" name="class_typeForm" action="${pageContext.request.contextPath}/TableInsertController/class_type" ondblclick="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="class_type_UD" id="class_type_UD">
            <input type="hidden" value="class_type" name="table_name" id="table_name">

            <div class="panel panel-primary panel-classTypeContent">
                <div class="panel-heading">Class Type Content</div>
                <table border='0' align='center' class="table table-striped">
                    <tr>
                        <c:forEach var="tableContent" items="${tableContent}">
                            <c:if test="${tableContent.columnName != null}">
                                <th>${tableContent.columnName}</th>
                                </c:if>
                            </c:forEach>
                        <th style="text-align: center">Update</th>
                        <th style="text-align: center">Delete</th>  
                    </tr>
                    <c:forEach var="tableContent" items="${tableContent}">
                        <tr id="${tableContent.class_type_id}">
                            <td><input type="text" class="form-control" value="${tableContent.class_type_id}" name="${tableContent.class_type_id}" disabled /></td>
                            <td><input type="text" class="form-control" value="${tableContent.class_type}" name="${tableContent.class_type}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.class_type_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.class_type_id}')">Delete</a></td>   
                        </tr>
                    </c:forEach>
                    <tr>
                        <td><input type="text" class="form-control" value="null" name="class_type_id}" disabled /></td>
                        <td><input type="text" class="form-control" required name="class_type" readonly="true" ondblclick="this.readOnly = '';" /></td>

                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
