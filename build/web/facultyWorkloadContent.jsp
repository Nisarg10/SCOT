<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Workload Content</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var workload = document.faculty_workloadForm.workload.value;
                var va = /^[0-9]+$/;

                if (va.test(workload))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(faculty_workload_id)
            {
                document.faculty_workloadForm.id_UD.value = faculty_workload_id;
                document.faculty_workloadForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.faculty_workloadForm.submit();
            }
            function updateContent(faculty_workload_id)
            {
                var user_type_id = document.getElementById(faculty_workload_id).getElementsByTagName('td')[1].getElementsByTagName('select')[0].value;
                var department_id = document.getElementById(faculty_workload_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;
                var workload = document.getElementById(faculty_workload_id).getElementsByTagName('td')[3].getElementsByTagName('input')[0].value;

                document.faculty_workloadForm.id_UD.value = faculty_workload_id;
                document.faculty_workloadForm.user_type_id_UD.value = user_type_id;
                document.faculty_workloadForm.department_id_UD.value = department_id;
                document.faculty_workloadForm.workload_UD.value = workload;
                document.faculty_workloadForm.action = "${pageContext.request.contextPath}/TableUpdateController/faculty_workload";
                document.faculty_workloadForm.submit();
            }
        </script>
    </head>
    <body>     
        <form name="faculty_workloadForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/faculty_workload" onsubmit="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD" />
            <input type="hidden" value="" name="user_type_id_UD" id="user_type_id_UD" />
            <input type="hidden" value="" name="department_id_UD" id="department_id_UD" />
            <input type="hidden" value="" name="workload_UD" id="workload" />
            <input type="hidden" value="faculty_workload" name="table_name" id="table_name" />


            <div class="panel panel-primary panel-facultyWorkloadContent">
                <div class="panel-heading">Faculty Workload Content</div>
                <table border='0' class="table table-striped" style="text-align: center">
                    <tr style="text-align: center">
                        <c:forEach var="tableContent" items="${tableContent}">
                            <c:if test="${tableContent.columnName != null}">
                                <th style="text-align: center">${tableContent.columnName}</th>
                                </c:if>
                            </c:forEach>
                        <th style="text-align: center">Update</th>
                        <th style="text-align: center">Delete</th>
                    </tr>
                    <c:forEach var="tableContent" items="${tableContent}">
                        <tr id="${tableContent.faculty_workload_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.faculty_workload_id}" name="${tableContent.faculty_workload_id}" disabled /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownUserType" name="tableDropDownUserType" class="form-control">
                                    <c:forEach var="tableDropDownUserType" items="${tableDropDownUserType}"> 
                                        <option value="${tableDropDownUserType.user_type_id}" <c:if test="${tableContent.user_type_id == tableDropDownUserType.user_type_id}">selected</c:if>>${tableDropDownUserType.user_type}</option>   
                                    </c:forEach>
                                </select>    
                            </td>
                            <td style="text-align: center">
                                <select id="tableDropDownDepartmentDetail" name="tableDropDownDepartmentDetail" class="form-control">
                                    <c:forEach var="tableDropDownDepartmentDetail" items="${tableDropDownDepartmentDetail}"> 
                                        <option class="" value="${tableDropDownDepartmentDetail.department_id}" <c:if test="${tableContent.department_id == tableDropDownDepartmentDetail.department_id}">selected</c:if>>${tableDropDownDepartmentDetail.department_name}</option>   
                                    </c:forEach>
                                </select>
                            </td> 
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.workload}" name="${tableContent.workload}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.faculty_workload_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.faculty_workload_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="faculty_workload_id" disabled /></td>
                        <td style="text-align: center">
                            <select  name="user_type_id" id="degree_type_id" required class="form-control">
                                <c:forEach var="tableDropDownUserType" items="${tableDropDownUserType}"> 
                                    <option value="${tableDropDownUserType.user_type_id}">${tableDropDownUserType.user_type}</option>   
                                </c:forEach>
                            </select>    
                        </td>
                        <td style="text-align: center">
                            <select  name="department_id" id="department_id" required class="form-control">
                                <c:forEach var="tableDropDownDepartmentDetail" items="${tableDropDownDepartmentDetail}"> 
                                    <option class="" value="${tableDropDownDepartmentDetail.department_id}">${tableDropDownDepartmentDetail.department_name}</option>   
                                </c:forEach>
                            </select>
                        </td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="workload" readonly="true" ondblclick="this.readOnly = '';" class="" /></td>

                        <td colspan="2" style="text-align: center"><input type="submit" value="ADD" class="btn btn-primary" ></td>
                    </tr>
                </table>
            </div>



        </form>

    </body>
</html>
