
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
                var hours = document.class_type_hoursForm.hours.value;
                var va = /^[0-9]+$/;

                if (va.test(hours))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(class_type_hours_id)
            {
                document.class_type_hoursForm.id_UD.value = class_type_hours_id;
                document.class_type_hoursForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.class_type_hoursForm.submit();
            }
            function updateContent(class_type_hours_id)
            {
                var class_type_id = document.getElementById(class_type_hours_id).getElementsByTagName('td')[1].getElementsByTagName('select')[0].value;
                var hours = document.getElementById(class_type_hours_id).getElementsByTagName('td')[2].getElementsByTagName('input')[0].value;
                var degree_id = document.getElementById(class_type_hours_id).getElementsByTagName('td')[3].getElementsByTagName('select')[0].value;


                document.class_type_hoursForm.id_UD.value = class_type_hours_id;
                document.class_type_hoursForm.class_type_id_UD.value = class_type_id;
                document.class_type_hoursForm.hours_UD.value = hours;
                document.class_type_hoursForm.degree_id_UD.value = degree_id;
                document.class_type_hoursForm.action = "${pageContext.request.contextPath}/TableUpdateController/class_type_hours";
                document.class_type_hoursForm.submit();
            }
        </script>
    </head>
    <body>
        <form methd="post" name="class_type_hoursForm" action="${pageContext.request.contextPath}/TableInsertController/class_type_hours" ondblclick="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="class_type_id_UD" id="class_type_UD">
            <input type="hidden" value="" name="hours_UD" id="hours_UD">
            <input type="hidden" value="" name="degree_id_UD" id="degree_id_UD">
            <input type="hidden" value="class_type_hours" name="table_name" id="table_name">

            <div class="panel panel-primary panel-classTypeHoursContent">
                <div class="panel-heading">Class Type Hours Content</div>
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
                        <tr id="${tableContent.class_type_hours_id}">
                            <td><input type="text" class="form-control" value="${tableContent.class_type_hours_id}" name="${tableContent.class_type_hours_id}" disabled /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownClassType" name="tableDropDownClassType" class="form-control">
                                    <c:forEach var="tableDropDownClassType" items="${tableDropDownClassType}"> 
                                        <option value="${tableDropDownClassType.class_type_id}" <c:if test="${tableContent.class_type_id == tableDropDownClassType.class_type_id}">selected</c:if>>${tableDropDownClassType.class_type}</option>   
                                    </c:forEach>
                                </select> 

                            </td>
                            <td><input type="text" class="form-control" value="${tableContent.hours}" name="${tableContent.hours}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownDegree" name="tableDropDownDegree" class="form-control">
                                    <c:forEach var="tableDropDownDegree" items="${tableDropDownDegree}"> 
                                        <option value="${tableDropDownDegree.degree_id}" <c:if test="${tableContent.degree_id == tableDropDownDegree.degree_id}">selected</c:if>>${tableDropDownDegree.degree_name}</option>   
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.class_type_hours_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.class_type_hours_id}')">Delete</a></td>   
                        </tr>
                    </c:forEach>
                    <tr>
                        <td><input type="text" class="form-control" value="null" name="class_type_hours_id}" disabled /></td>
                        <td style="text-align: center">
                            <select  name="class_type_id" id="class_type_id" required class="form-control">
                                <c:forEach var="tableDropDownClassType" items="${tableDropDownClassType}"> 
                                    <option value="${tableDropDownClassType.class_type_id}">${tableDropDownClassType.class_type}</option>   
                                </c:forEach>
                            </select>    
                        </td>
                        <td><input type="text" class="form-control" required name="hours" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center">
                            <select name="degree_id" required class="form-control">
                                <c:forEach var="tableDropDownDegree" items="${tableDropDownDegree}"> 
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
