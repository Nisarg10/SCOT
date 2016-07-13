<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Division Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var div_name = document.divisionForm.div_name.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(div_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(division_id)
            {
                document.divisionForm.id_UD.value = division_id;
                document.divisionForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.divisionForm.submit();
            }
            function updateContent(division_id)
            {
                var div_name = document.getElementById(division_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var sem_id = document.getElementById(division_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;

                document.divisionForm.id_UD.value = division_id;
                document.divisionForm.div_name_UD.value = div_name;
                document.divisionForm.sem_id_UD.value = sem_id;
                document.divisionForm.action = "${pageContext.request.contextPath}/TableUpdateController/division";
                document.divisionForm.submit();
            }
        </script>

    </head>
    <body>
        <form name="divisionForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/division" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="div_name_UD" id="div_name_UD">
            <input type="hidden" value="" name="sem_id_UD" id="sem_id_UD">
            <input type="hidden" value="division" name="table_name" id="table_name">
            <div class="panel panel-primary panel-divisionContent">
                <div class="panel-heading">Division Content</div>
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
                        <tr id="${tableContent.div_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.div_id}" name="${tableContent.div_id}" disabled></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.div_name}" name="${tableContent.div_name}" readonly="true" ondblclick="this.readOnly = '';"></td>
                            <td style="text-align: center">
                                <select id="tableDropDownSemester" name="tableDropDownSemester" class="form-control">
                                    <c:forEach var="tableDropDownSemester" items="${tableDropDownSemester}"> 
                                        <option value="${tableDropDownSemester.sem_id}" <c:if test="${tableContent.sem_id == tableDropDownSemester.sem_id}">selected</c:if>>${tableDropDownSemester.sem_no}</option>   
                                    </c:forEach>
                                </select>
                            </td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.div_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.div_id}')">Delete</a></td>    
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="div_id" disabled></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="div_name" readonly="true" ondblclick="this.readOnly = '';"></td>
                        <td style="text-align: center">
                            <select name="sem_id" required class="form-control">
                                <c:forEach var="tableDropDownSemester" items="${tableDropDownSemester}"> 
                                    <option value="${tableDropDownSemester.sem_id}">${tableDropDownSemester.sem_no}</option>   
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
