<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>State Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var state_name = document.stateForm.state_name.value;
                var va = /^[a-zA-Z ]+$/;

                if (va.test(state_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(state_id)
            {
                document.stateForm.id_UD.value = state_id;
                document.stateForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.stateForm.submit();
            }
            function updateContent(state_id)
            {
                var state_name = document.getElementById(state_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var country_id = document.getElementById(state_id).getElementsByTagName('td')[2].getElementsByTagName('select')[0].value;
                document.stateForm.id_UD.value = state_id;
                document.stateForm.state_name_UD.value = state_name;
                document.stateForm.country_id_UD.value = country_id;
                document.stateForm.action = "${pageContext.request.contextPath}/TableUpdateController/state";
                document.stateForm.submit();
            }
        </script>
    </head>
    <body>
        <form name="stateForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/state" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="state_name_UD" id="state_name_UD">
            <input type="hidden" value="" name="country_id_UD" id="country_id_UD">
            <input type="hidden" value="state" name="table_name" id="table_name">


            <div class="panel panel-primary panel-stateContent">
                <div class="panel-heading">State Content</div>
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
                        <tr id="${tableContent.state_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.state_id}" name="${tableContent.state_id}" disabled></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.state_name}" name="${tableContent.state_name}" readonly="true" ondblclick="this.readOnly = '';"></td>
                            <td style="text-align: center">
                                <select id="tableDropDownCountry" name="tableDropDownCountry" class="form-control">
                                    <c:forEach var="tableDropDownCountry" items="${tableDropDownCountry}"> 
                                        <option value="${tableDropDownCountry.country_id}" <c:if test="${tableContent.country_id == tableDropDownCountry.country_id}">selected</c:if>>${tableDropDownCountry.country_name}</option>   
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.state_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.state_id}')">Delete</a></td>
                        </tr>

                    </c:forEach>

                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="state_id" disabled></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="state_name" readonly="true" ondblclick="this.readOnly = '';"></td>
                        <td style="text-align: center">
                            <select name="country_id" required class="form-control">
                                <c:forEach var="tableDropDownCountry" items="${tableDropDownCountry}"> 
                                    <option value="${tableDropDownCountry.country_id}">${tableDropDownCountry.country_name}</option>   
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
