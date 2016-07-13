<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>City Content</title>
        <script src="jQuery/jquery-1.11.0.js"></script>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var city_name = document.cityForm.city_name.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(city_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(city_id)
            {
                document.cityForm.id_UD.value = city_id;
                document.cityForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.cityForm.submit();
            }
            function updateContent(city_id)
            {
                var city_name = document.getElementById(city_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var state_id = document.getElementById(city_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;

                document.cityForm.id_UD.value = city_id;
                document.cityForm.city_name_UD.value = city_name;
                document.cityForm.state_id_UD.value = state_id;
                document.cityForm.action = "${pageContext.request.contextPath}/TableUpdateController/city";
                document.cityForm.submit();
            }
        </script>
    </head>
    <body>
        <form method="post" name="cityForm" action="${pageContext.request.contextPath}/TableInsertController/city" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="city_name_UD" id="city_name_UD">
            <input type="hidden" value="" name="state_id_UD" id="state_id_UD">
            <input type="hidden" value="city" name="table_name" id="table_name">

            <div class="panel panel-primary panel-city">
                <div class="panel-heading">City Content</div>
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
                        <tr id="${tableContent.city_id}">
                            <td><input type="text" class="form-control" value="${tableContent.city_id}" name="${tableContent.city_id}" disabled></td>
                            <td><input type="text" class="form-control" value="${tableContent.city_name}" name="${tableContent.city_name}" readonly="true" ondblclick="this.readOnly = '';"></td>
                            <td style="text-align: center">
                                <select id="tableDropDownState" name="tableDropDownState" class="form-control">
                                    <c:forEach var="tableDropDownState" items="${tableDropDownState}"> 
                                        <option value="${tableDropDownState.state_id}" <c:if test="${tableContent.state_id == tableDropDownState.state_id}">selected</c:if>>${tableDropDownState.state_name}</option>   
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.city_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.city_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td><input type="text" class="form-control" value="null" name="city_id" id="city_id" disabled></td>
                        <td><input type="text" class="form-control" required name="city_name" readonly="true" ondblclick="this.readOnly = '';"></td>
                        <td style="text-align: center">
                            <select name="state_id" id="state_id" required class="form-control">
                                <c:forEach var="tableDropDownState" items="${tableDropDownState}"> 
                                    <option value="${tableDropDownState.state_id}">${tableDropDownState.state_name}</option>   
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