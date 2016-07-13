<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Degree Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var degree_name = document.degreeForm.degree_name.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(degree_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(degree_id)
            {
                document.degreeForm.id_UD.value = degree_id;
                document.degreeForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.degreeForm.submit();
            }
            function updateContent(degree_id)
            {
                var degree_name = document.getElementById(degree_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var degree_type_id = document.getElementById(degree_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;
                var department_id = document.getElementById(degree_id).getElementsByTagName('td')[3].getElementsByTagName('select')[0].value;

                document.degreeForm.id_UD.value = degree_id;
                document.degreeForm.degree_name_UD.value = degree_name;
                document.degreeForm.degree_type_id_UD.value = degree_type_id;
                document.degreeForm.department_id_UD.value = department_id;
                document.degreeForm.action = "${pageContext.request.contextPath}/TableUpdateController/degree";
                document.degreeForm.submit();
            }
        </script>
    </head>
    <body>
        <form method="post" name="degreeForm" action="${pageContext.request.contextPath}/TableInsertController/degree" onsubmit="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="degree_name_UD" id="degree_name_UD">
            <input type="hidden" value="" name="degree_type_id_UD" id="degree_type_id_UD">
            <input type="hidden" value="" name="department_id_UD" id="department_id_UD">
            <input type="hidden" value="degree" name="table_name" id="table_name">

            <div class="panel panel-primary panel-degreeContent">
                <div class="panel-heading">Degree Content</div>
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
                        <tr id="${tableContent.degree_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.degree_id}" name="${tableContent.degree_id}" disabled /></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.degree_name}" name="${tableContent.degree_name}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownDegreeType" name="tableDropDownDegreeType" class="form-control">
                                    <c:forEach var="tableDropDownDegreeType" items="${tableDropDownDegreeType}"> 
                                        <option value="${tableDropDownDegreeType.degree_type_id}" <c:if test="${tableContent.degree_type_id == tableDropDownDegreeType.degree_type_id}">selected</c:if>>${tableDropDownDegreeType.degree_type}</option>   
                                    </c:forEach>
                                </select>    
                            </td>
                            <td style="text-align: center">
                                <select id="tableDropDownDepartmentDetail" name="tableDropDownDepartmentDetail" class="form-control">
                                    <c:forEach var="tableDropDownDepartmentDetail" items="${tableDropDownDepartmentDetail}"> 
                                        <option value="${tableDropDownDepartmentDetail.department_id}" <c:if test="${tableContent.department_id == tableDropDownDepartmentDetail.department_id}">selected</c:if>>${tableDropDownDepartmentDetail.department_name}</option>   
                                    </c:forEach>
                            </td>                        
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.degree_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.degree_id}')">Delete</a></td>  
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="degree_id" disabled /></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="degree_name" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center">
                            <select  name="degree_type_id" id="degree_type_id" required class="form-control">
                                <c:forEach var="tableDropDownDegreeType" items="${tableDropDownDegreeType}"> 
                                    <option value="${tableDropDownDegreeType.degree_type_id}">${tableDropDownDegreeType.degree_type}</option>   
                                </c:forEach>
                            </select>    
                        </td>
                        <td style="text-align: center">
                            <select  name="department_id" id="department_id" required class="form-control">
                                <c:forEach var="tableDropDownDepartmentDetail" items="${tableDropDownDepartmentDetail}"> 
                                    <option value="${tableDropDownDepartmentDetail.department_id}">${tableDropDownDepartmentDetail.department_name}</option>   
                                </c:forEach>
                        </td>

                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>

                </table>
            </div>
        </form>
    </body>
</html>
