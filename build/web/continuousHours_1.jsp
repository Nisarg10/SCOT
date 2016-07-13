
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
                var max_continuous = document.class_type_hoursForm.max_continuous.value;
                var va = /^[0-9]+$/;

                if (va.test(max_continuous))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(continuous_hours_id)
            {
                document.continuous_hoursForm.id_UD.value = continuous_hours_id;
                document.continuous_hoursForm.action = "${pageContext.request.contextPath}/UserTableDeleteController";
                document.continuous_hoursForm.submit();
            }
            function updateContent(continuous_hours_id)
            {
                var max_continuous = document.getElementById(continuous_hours_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var degree_id = document.getElementById(continuous_hours_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;


                document.continuous_hoursForm.id_UD.value = continuous_hours_id;
                document.continuous_hoursForm.max_continuous_UD.value = max_continuous;
                document.continuous_hoursForm.degree_id_UD.value = degree_id;
                document.continuous_hoursForm.action = "${pageContext.request.contextPath}/UserTableUpdateController/continuous_hours";
                document.continuous_hoursForm.submit();
            }
        </script>
    </head>
    <body>
        <form methd="post" name="continuous_hoursForm" action="${pageContext.request.contextPath}/UserTableInsertController/continuous_hours" ondblclick="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="max_continuous_UD" id="max_continuous_UD">
            <input type="hidden" value="" name="degree_id_UD" id="degree_id_UD">
            <input type="hidden" value="continuous_hours" name="table_name" id="table_name">

            <div class="panel panel-primary panel-continuousHoursContent">
                <div class="panel-heading">Continuous Hours</div>
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
                        <tr id="${tableContent.continuous_hours_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.continuous_hours_id}" name="${tableContent.continuous_hours_id}" disabled /></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.max_continuous}" name="${tableContent.max_continuous}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownDegree" name="tableDropDownDegree" class="form-control">
                                    <c:forEach var="tableDropDownDegree" items="${tableDropDownDegree}"> 
                                        <option value="${tableDropDownDegree.degree_id}" <c:if test="${tableContent.degree_id == tableDropDownDegree.degree_id}">selected</c:if>>${tableDropDownDegree.degree_name}</option>   
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.continuous_hours_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.continuous_hours_id}')">Delete</a></td>   
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="continuous_hours_id}" disabled /></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="max_continuous" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center">
                            <select name="degree_id" required class="form-control">
                                <c:forEach var="tableDropDownDegree" items="${tableDropDownDegree}" > 
                                    <option value="${tableDropDownDegree.degree_id}">${tableDropDownDegree.degree_name}</option>   
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
