<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Semester Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var semester_name = document.semesterForm.semester_name.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(semester_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(semester_id)
            {
                document.semesterForm.id_UD.value = semester_id;
                document.semesterForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.semesterForm.submit();
            }
            function updateContent(semester_id)
            {
                var semester_no = document.getElementById(semester_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var degree_id = document.getElementById(semester_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;

                document.semesterForm.id_UD.value = semester_id;
                document.semesterForm.semester_no_UD.value = semester_no;
                document.semesterForm.degree_id_UD.value = degree_id;
                document.semesterForm.action = "${pageContext.request.contextPath}/TableUpdateController/semester";
                document.semesterForm.submit();
            }
        </script>

    </head>
    <body>
        <form name="semesterForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/semester" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="semester_no_UD" id="semester_no_UD">
            <input type="hidden" value="" name="degree_id_UD" id="degree_id_UD">
            <input type="hidden" value="semester" name="table_name" id="table_name">


            <div class="panel panel-primary panel-semesterContent">
                <div class="panel-heading">Semester Content</div>
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
                        <tr id="${tableContent.sem_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.sem_id}" name="${tableContent.sem_id}" disabled></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.sem_no}" name="${tableContent.sem_no}" readonly="true" ondblclick="this.readOnly = '';"></td>
                            <td style="text-align: center">
                                <select id="tableDropDownDegree" name="tableDropDownDegree" class="form-control">
                                    <c:forEach var="tableDropDownDegree" items="${tableDropDownDegree}"> 
                                        <option value="${tableDropDownDegree.degree_id}" <c:if test="${tableContent.degree_id == tableDropDownDegree.degree_id}">selected</c:if>>${tableDropDownDegree.degree_name}</option>   
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.sem_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.sem_id}')">Delete</a></td>        
                        </tr>
                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="semester_id" disabled></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="sem_no" readonly="true" ondblclick="this.readOnly = '';"></td>
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
