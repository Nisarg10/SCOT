<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Detail Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var department_name = document.departmentDetailForm.department_name.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(department_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(department_id)
            {
                document.departmentDetailForm.id_UD.value = department_id;
                document.departmentDetailForm.action = "${pageContext.request.contextPath}/UserTableDeleteController";
                document.departmentDetailForm.submit();
            }
            function updateContent(department_id)
            {
                var department_name = document.getElementById(department_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var institute_id = document.getElementById(department_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;
                document.departmentDetailForm.id_UD.value = department_id;
                document.departmentDetailForm.department_name_UD.value = department_name;
                document.departmentDetailForm.institute_id_UD.value = institute_id;
                document.departmentDetailForm.action = "${pageContext.request.contextPath}/UserTableUpdateController/departmentDetail";
                document.departmentDetailForm.submit();
            }
            function dataGet()
            {
                window.location.assign("${pageContext.request.contextPath}" + "/UserTableController/department_detail");
            }
        </script>

    </head>
    <c:choose>
        <c:when test="${tableContent != null}">
            <body>
        </c:when>
        <c:otherwise>
                <body onload="dataGet()">
        </c:otherwise>
    </c:choose>
        <form name="departmentDetailForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/department_detail" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="department_name_UD" id="department_name_UD">
            <input type="hidden" value="" name="institute_id_UD" id="institute_id_UD">
            <input type="hidden" value="department_detail" name="table_name" id="table_name">

            <div class="panel panel-primary panel-departmentDetailContent">
                <div class="panel-heading">Department Detail Content</div>
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
                        <tr id="${tableContent.department_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.department_id}" name="${tableContent.department_id}" disabled></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.department_name}" name="${tableContent.department_name}" readonly="true" ondblclick="this.readOnly = '';"></td>
                            <td style="text-align: center">
                                <select id="tableDropDownInstitute" class="form-control">
                                    <c:forEach var="tableDropDownInstitute" items="${tableDropDownInstitute}"> 
                                        <option value="${tableDropDownInstitute.institute_id}" <c:if test="${tableContent.institute_id == tableDropDownInstitute.institute_id}">selected</c:if>>${tableDropDownInstitute.institute_name}</option>   
                                    </c:forEach>
                                </select>
                            </td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.department_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.department_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="department_id" disabled></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="department_name" readonly="true" ondblclick="this.readOnly = '';"></td>
                        <td style="text-align: center">
                            <select name="institute_id" required class="form-control">
                                <c:forEach var="tableDropDownInstitute" items="${tableDropDownInstitute}"> 
                                    <option value="${tableDropDownInstitute.institute_id}">${tableDropDownInstitute.institute_name}</option>   
                                </c:forEach>
                            </select>
                        </td>
                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>

                </table>
            </div>
        </form>

    </body>
</html>
