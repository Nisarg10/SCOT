<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var subject_name = document.subjectForm.subject_name.value;
                var credit = document.subjectForm.credit.value;
                var va = /^[a-zA-Z]+$/;
                var v = /^[0-9]+$/;

                if (va.test(subject_name))
                {
                    if (v.test(credit)) {
                        return true;
                    }
                }
                else
                    return false;
            }
            function deleteContent(subject_id)
            {
                document.subjectForm.id_UD.value = subject_id;
                document.subjectForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.subjectForm.submit();
            }
            function updateContent(subject_id)
            {
                var subject_name = document.getElementById(subject_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var credit = document.getElementById(subject_id).getElementsByTagName('td')[2].getElementsByTagName('input')[0].value;
                var sem_id = document.getElementById(subject_id).getElementsByTagName('td')[3].getElementsByTagName('select')[0].value;

                document.subjectForm.id_UD.value = subject_id;
                document.subjectForm.subject_name_UD.value = subject_name;
                document.subjectForm.credit_UD.value = credit;
                document.subjectForm.sem_id_UD.value = sem_id;
                document.subjectForm.action = "${pageContext.request.contextPath}/TableUpdateController/subject";
                document.subjectForm.submit();
            }
        </script>
    </head>
    <body>
        <form name="subjectForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/subject" onsubmit="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD" />
            <input type="hidden" value="" name="subject_name_UD" id="subject_name_UD" />
            <input type="hidden" value="" name="credit_UD" id="credit_UD" />
            <input type="hidden" value="" name="sem_id_UD" id="sem_id_UD" />
            <input type="hidden" value="subject" name="table_name" id="table_name" />


            <div class="panel panel-primary panel-subjectContent">
                <div class="panel-heading">Subject Content</div>
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
                        <tr id="${tableContent.subject_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.subject_id}" name="${tableContent.subject_id}" disabled /></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.subject_name}" name="${tableContent.subject_name}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.credit}" name="${tableContent.credit}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownSemester" name="tableDropDownSemester" class="form-control">
                                    <c:forEach var="tableDropDownSemester" items="${tableDropDownSemester}"> 
                                        <option value="${tableDropDownSemester.sem_id}" <c:if test="${tableContent.sem_id == tableDropDownSemester.sem_id}">selected</c:if>>${tableDropDownSemester.sem_no}</option>   
                                    </c:forEach>
                                </select>    
                            </td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.subject_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.subject_id}')">Delete</a></td>   
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="subject_id" disabled /></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="subject_name" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="credit" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center">
                            <select  name="sem_id" id="sem_id" required class="form-control">
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
