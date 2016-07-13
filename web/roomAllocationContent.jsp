<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Allocation Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var room_no = document.room_allocationForm.room_no.value;
                var va = /^[0-9]+$/;

                if (va.test(room_no))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(room_allocation_id)
            {
                document.room_allocationForm.id_UD.value = room_allocation_id;
                document.room_allocationForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.room_allocationForm.submit();
            }
            function updateContent(room_allocation_id)
            {
                var class_type_id = document.getElementById(room_allocation_id).getElementsByTagName('td')[1].getElementsByTagName('select')[0].value;
                var room_no = document.getElementById(room_allocation_id).getElementsByTagName('td')[2].getElementsByTagName('input')[0].value;

                document.room_allocationForm.id_UD.value = room_allocation_id;
                document.room_allocationForm.class_type_id_UD.value = class_type_id;
                document.room_allocationForm.room_no_UD.value = room_no;
                document.room_allocationForm.action = "${pageContext.request.contextPath}/TableUpdateController/room_allocation";
                document.room_allocationForm.submit();
            }
        </script>
    </head>
    <body>
        <form method="post" name="room_allocationForm" action="${pageContext.request.contextPath}/TableInsertController/room_allocation" onsubmit="return validateData">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="class_type_id_UD" id="class_type_id_UD">
            <input type="hidden" value="" name="room_no_UD" id="room_no_UD">
            <input type="hidden" value="room_allocation" name="table_name" id="table_name">


            <div class="panel panel-primary panel-roomAllocationContent">
                <div class="panel-heading">Room Allocation Content</div>
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
                        <tr id="${tableContent.room_allocation_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.room_allocation_id}" name="${tableContent.room_allocation_id}" disabled /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownClassType" name="tableDropDownClassType" class="form-control">
                                    <c:forEach var="tableDropDownClassType" items="${tableDropDownClassType}"> 
                                        <option value="${tableDropDownClassType.class_type_id}" <c:if test="${tableContent.class_type_id == tableDropDownClassType.class_type_id}">selected</c:if>>${tableDropDownClassType.class_type}</option>   
                                    </c:forEach>
                                </select> 

                            </td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.room_no}" name="${tableContent.room_no}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.room_allocation_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.room_allocation_id}')">Delete</a></td> 
                        </tr>
                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="room_allocation_id" disabled /></td>
                        <td style="text-align: center">
                            <select  name="class_type_id" id="class_type_id" required class="form-control">
                                <c:forEach var="tableDropDownClassType" items="${tableDropDownClassType}"> 
                                    <option value="${tableDropDownClassType.class_type_id}">${tableDropDownClassType.class_type}</option>   
                                </c:forEach>
                            </select>    
                        </td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="room_no" readonly="true" ondblclick="this.readOnly = '';" /></td>

                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
