<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Country Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var country_name = document.countryForm.country_name.value;
                var va = /^[a-zA-Z]+$/;

                if (va.test(country_name))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(country_id)
            {
                document.countryForm.id_UD.value = country_id;
                document.countryForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.countryForm.submit();
            }
            function updateContent(country_id)
            {
                var country_name = document.getElementById(country_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                document.countryForm.id_UD.value = country_id;
                document.countryForm.country_name_UD.value = country_name;
                document.countryForm.action = "${pageContext.request.contextPath}/TableUpdateController/country";
                document.countryForm.submit();
            }
        </script>

    </head>
    <body>
        <form name="countryForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/country" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="country_name_UD" id="country_name_UD">
            <input type="hidden" value="country" name="table_name" id="table_name">

            <div class="panel panel-primary panel-countryContent">
                <div class="panel-heading">Country Content</div>
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
                        <tr id='${tableContent.country_id}'>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.country_id}" name="${tableContent.country_id}" disabled></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.country_name}" name="${tableContent.country_name}" readonly="true" ondblclick="this.readOnly = '';"></td>

                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.country_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.country_id}')">Delete</a></td>   
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="country_id" disabled></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="country_name" readonly="true" ondblclick="this.readOnly = '';"></td>
                        <td colspan="2" style="text-align: center"><input type="submit" value="Add" class="btn btn-primary"></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
