<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time slot Template Content</title>

        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

        <script>
            function validateData()
            {
                var time_slot_id = document.timeslotTemplateForm.time_slot_id.value;
                var va = /^[0-9]+$/;

                if (va.test(time_slot_id))
                {
                    return true;
                }
                else
                    return false;
            }
            function deleteContent(timeslot_template_id)
            {
                document.timeslotTemplateForm.id_UD.value = timeslot_template_id;
                document.timeslotTemplateForm.action = "${pageContext.request.contextPath}/TableDeleteController";
                document.timeslotTemplateForm.submit();
            }
            function updateContent(timeslot_template_id)
            {
                var timeslot_set_id = document.getElementById(timeslot_template_id).getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
                var start_time = document.getElementById(timeslot_template_id).getElementsByTagName('td')[2].getElementsByTagName('input')[0].value;
                var end_time = document.getElementById(timeslot_template_id).getElementsByTagName('td')[3].getElementsByTagName('input')[0].value;
                var day_id = document.getElementById(timeslot_template_id).getElementsByTagName('td')[4].getElementsByTagName('select')[0].value;

                document.timeslotTemplateForm.id_UD.value = timeslot_template_id;
                document.timeslotTemplateForm.timeslot_set_id_UD.value = timeslot_set_id;
                document.timeslotTemplateForm.start_time_UD.value = start_time;
                document.timeslotTemplateForm.end_time_UD.value = end_time;
                document.timeslotTemplateForm.day_id_UD.value = day_id;
                document.timeslotTemplateForm.action = "${pageContext.request.contextPath}/TableUpdateController/timeslot_template";
                document.timeslotTemplateForm.submit();
            }
        </script>

    </head>
    <body>
        <form name="timeslotTemplateForm" method="post" action="${pageContext.request.contextPath}/TableInsertController/timeslot_template" onsubmit="return validateData()">
            <input type="hidden" value="" name="id_UD" id="id_UD">
            <input type="hidden" value="" name="timeslot_set_id_UD" id="timeslot_set_id_UD">
            <input type="hidden" value="" name="start_time_UD" id="start_time_UD">
            <input type="hidden" value="" name="end_time_UD" id="end_time_UD">
            <input type="hidden" value="" name="day_id_UD" id="day_id_UD">
            <input type="hidden" value="timeslot_template" name="table_name" id="table_name">

            <div class="panel panel-primary panel-timeslotTemplateContent">
                <div class="panel-heading">Timeslot Template Content</div>
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
                        <tr id="${tableContent.timeslot_template_id}">
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.timeslot_template_id}" name="${tableContent.timeslot_template_id}" disabled /></td>
                            <td style="text-align: center"><input type="text" class="form-control" value="${tableContent.timeslot_set_id}" name="${tableContent.timeslot_set_id}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center"><input type="datetime" value="${tableContent.start_time}" name="${tableContent.start_time}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center"><input type="datetime" value="${tableContent.end_time}" name="${tableContent.end_time}" readonly="true" ondblclick="this.readOnly = '';" /></td>
                            <td style="text-align: center">
                                <select id="tableDropDownDay" class="form-control">
                                    <c:forEach var="tableDropDownDay" items="${tableDropDownDay}"> 
                                        <option value="${tableDropDownDay.day_id}" <c:if test="${tableContent.day_id == tableDropDownDay.day_id}">selected</c:if>>${tableDropDownDay.day}</option>   
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center"><a href="#" onclick="updateContent('${tableContent.timeslot_template_id}')">Update</a></td>
                            <td style="text-align: center"><a href="#" onclick="deleteContent('${tableContent.timeslot_template_id}')">Delete</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td style="text-align: center"><input type="text" class="form-control" value="null" name="timeslot_template_id" disabled /></td>
                        <td style="text-align: center"><input type="text" class="form-control" required name="timeslot_set_id" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center"><input type="datetime" required name="start_time" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center"><input type="datetime" required name="end_time" readonly="true" ondblclick="this.readOnly = '';" /></td>
                        <td style="text-align: center">
                            <select name="day_id" required class="form-control">
                                <c:forEach var="tableDropDownDay" items="${tableDropDownDay}"> 
                                    <option value="${tableDropDownDay.day_id}">${tableDropDownDay.day}</option>   
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
