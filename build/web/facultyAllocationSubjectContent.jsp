<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Allocation Subject Content</title>
        
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>

            function deleteContent(faculty_allocation_subject_id)
            {
                document.facultyAllocationSubjectForm.id_UD.value = faculty_allocation_subject_id;
                document.facultyAllocationSubjectForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.facultyAllocationSubjectForm.submit();
            }
            function updateContent(faculty_allocation_subject_id)
            {
                var registration_id = document.getElementById(faculty_allocation_subject_id).getElementsByTagName('td')[1].getElementsByTagName('select')[0].value;
                var subject_id = document.getElementById(faculty_allocation_subject_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;
                document.facultyAllocationSubjectForm.id_UD.value = faculty_allocation_subject_id;
                document.facultyAllocationSubjectForm.registration_id_UD.value = registration_id;
                document.facultyAllocationSubjectForm.subject_id_UD.value = subject_id;
                document.facultyAllocationSubjectForm.action = "${pageContext.request.contextPath}/TableUpdateController/facultyAllocationSubject";
                document.facultyAllocationSubjectForm.submit();
            }
        </script>

    </head>
    <body>
        <form name="facultyAllocationSubjectForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/faculty_allocation_subject">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="registration_id_UD" id="registration_id_UD">
            <input type="hidden" value="" name="subject_id_UD" id="subject_id_UD">
            <input type="hidden" value="faculty_allocation_subject" name="table_name" id="table_name"> 

            <div class="panel panel-primary panel-facultyAllocationSubjectContent">
                <div class="panel-heading">Faculty Allocation Subject Content</div>
                <table border='0' align='center' class="table table-striped">
                    <tr>
                        <c:forEach var="tableContent" items="${tableContent}">
                            <c:if test="${tableContent.columnName != null}">
                                <th  style="text-align: center">${tableContent.columnName}</th>
                                </c:if>
                            </c:forEach>
                        <th style="text-align: left">Update</th>
                        <th style="text-align: left">Delete</th>

                    </tr>
                    <c:forEach var="tableContent" items="${tableContent}">
                        <tr id="${tableContent.faculty_allocation_subject_id}">
                            <td  style="text-align: center"><input type="text" class="form-control" value="${tableContent.faculty_allocation_subject_id}" name="${tableContent.faculty_allocation_subject_id}" disabled></td>
                            <td style="text-align: center">
                                <select id="tableDropDownRegistration" name="tableDropDownRegistration" class="form-control">
                                    <c:forEach var="tableDropDownRegistration" items="${tableDropDownRegistration}"> 
                                        <option value="${tableDropDownRegistration.registration_id}" <c:if test="${tableContent.registration_id == tableDropDownRegistration.registration_id}">selected</c:if>>${tableDropDownRegistration.fName} ${tableDropDownRegistration.mName} ${tableDropDownRegistration.lName}</option>   
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center" >
                                <select id="tableDropDownSubject" name="tableDropDownSubject" class="form-control">
                                    <c:forEach var="tableDropDownSubject" items="${tableDropDownSubject}"> 
                                        <option value="${tableDropDownSubject.subject_id}" <c:if test="${tableContent.subject_id == tableDropDownSubject.subject_id}">selected</c:if>>${tableDropDownSubject.subject_name}</option>   
                                    </c:forEach>
                                </select>
                            </td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.faculty_allocation_subject_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.faculty_allocation_subject_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="faclty_allocation_subject_id" disabled></td>
                        <td style="text-align: center">
                            <select name="registration_id" required class="form-control">
                                <c:forEach var="tableDropDownRegistration" items="${tableDropDownRegistration}"> 
                                    <option value="${tableDropDownRegistration.registration_id}">${tableDropDownRegistration.fName} ${tableDropDownRegistration.mName} ${tableDropDownRegistration.lName}</option>   
                                </c:forEach>
                            </select>
                        </td>
                        <td style="text-align: center">
                            <select name="subject_id" required class="form-control">
                                <c:forEach var="tableDropDownSubject" items="${tableDropDownSubject}"> 
                                    <option value="${tableDropDownSubject.subject_id}">${tableDropDownSubject.subject_name}</option>   
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
