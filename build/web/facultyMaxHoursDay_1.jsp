
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Max Hours Per Day</title>
        
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        
        <script>
            function validateData()
            {
                var max_hours_day = document.faculty_maxhours_dayForm.max_hours_day.value;
                var va = /^[0-9]+$/;

                if (va.test(max_hours_day))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(faculty_maxhours_day_id)
            {
                document.faculty_maxhours_dayForm.id_UD.value = faculty_maxhours_day_id;
                document.faculty_maxhours_dayForm.action = "${pageContext.request.contextPath}/UserTableDeleteController";
                document.faculty_maxhours_dayForm.submit();
            }
            function updateContent(faculty_maxhours_day_id)
            {
                var max_hours_day = document.getElementById(faculty_maxhours_day_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var degree_id = document.getElementById(faculty_maxhours_day_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;


                document.faculty_maxhours_dayForm.id_UD.value = faculty_maxhours_day_id;
                document.faculty_maxhours_dayForm.max_hours_day_UD.value = max_hours_day;
                document.faculty_maxhours_dayForm.degree_id_UD.value = degree_id;
                document.faculty_maxhours_dayForm.action = "${pageContext.request.contextPath}/UserTableUpdateController/faculty_maxhours_day";
                document.faculty_maxhours_dayForm.submit();
            }
        </script>
    </head>
    <body>
        <form methd="post" name="faculty_maxhours_dayForm" action="${pageContext.request.contextPath}/UserTableInsertController/faculty_maxhours_day" ondblclick="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="max_hours_day_UD" id="max_hours_day_UD">
            <input type="hidden" value="" name="degree_id_UD" id="degree_id_UD">
            <input type="hidden" value="faculty_maxhours_day" name="table_name" id="table_name">
            
            <div class="panel panel-primary panel-facultyMaxHoursDay">
                <div class="panel-heading">Faculty Max Hours Day Content</div>
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
                    <tr id="${tableContent.faculty_maxhours_day_id}">
                        <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.faculty_maxhours_day_id}" name="${tableContent.faculty_maxhours_day_id}" disabled /></td>
                        <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.max_hours_day}" name="${tableContent.max_hours_day}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center">
                            <select id="tableDropDownDegree" name="tableDropDownDegree" class="form-control">
                                <c:forEach var="tableDropDownDegree" items="${tableDropDownDegree}"> 
                                    <option value="${tableDropDownDegree.degree_id}" <c:if test="${tableContent.degree_id == tableDropDownDegree.degree_id}">selected</c:if>>${tableDropDownDegree.degree_name}</option>   
                                </c:forEach>
                            </select>
                        </td>
                        <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.faculty_maxhours_day_id}')">Update</a></td>
                        <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.faculty_maxhours_day_id}')">Delete</a></td>   
                    </tr>
                </c:forEach>
                <tr>
                    <td style="text-align: center"><input type="text" class="form-control" value="null" name="continuous_hours_id}" disabled /></td>
                    <td style="text-align: center"><input type="text" class="form-control" required name="max_hours_day" readonly="true" ondblclick="this.readOnly = '';" /></td>
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
