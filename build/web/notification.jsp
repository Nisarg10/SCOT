<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notificaion</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/containerCss.css">
        <link rel="stylesheet" type="text/css" href="css/containerCss.css">
        <link rel="stylesheet" type="text/css" href="../css/simpletable.css"/>
        <link rel="stylesheet" type="text/css" href="css/simpletable.css"/>

        <script>
            function middleDiv() {
                var heightDiv = (document.documentElement.clientHeight) - 119 + "px";
                document.getElementById('middleDiv').style.height = heightDiv;
            }
        </script>
        <script type="text/javascript"><!--
       div = {
            show: function(elem) {
                document.getElementById(elem).style.visibility = 'visible';
            },
                    hide: function(elem) {
                        document.getElementById(elem).style.visibility = 'hidden';
                    }
}
--></script>
        <style>
            .box {
                width:70%;
                height:166px;
                background:#FFF;
                margin:40px auto;
            }

            .effect8
            {   
                -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
                -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
                box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            }

            .labelDetail{
                white-space: nowrap;
                font-family: 'Bebas Neue';
                text-transform: uppercase;
                font-weight: normal;
                color: white;
                font-size: 15px;
                color:black;
                padding-top: 6px;
            }

        </style>

    </head>
    <body style="background-color: #F1F4F9; border: menutext " onload="middleDiv()">
        <div>
            <c:import url="header.jsp"/>
            <c:import url="navMenu.jsp"/>
        </div>
        <div class="container">
            <div id="middleDiv" style="background-color: white; overflow: auto; ">
                <div style="width: 100%; height: 50%;">
                    <form name="notificationSet" method="post" action="${pageContext.request.contextPath}/UserController/setNotify">
                        <table class="table col-md-offset-4" style="margin-top: 10px; width: auto; height: auto; ">
                            <thead>
                                <tr class="labelDetail" onMouseOver="div.show('div1')" onMouseOut="div.hide('div1')">
                                    <td align="center">Index</td>
                                    <td align="center">Detail</td>
                                    <td align="center">Activate</td>
                                    <td align="center">Deactivate</td>
                                </tr>
                            </thead>
                            <c:forEach var="notificationList" items="${notificationList}" varStatus="count">
                                <tr>
                                    <td align="center">${count.count}</td>
                                    <td align="center" style="cursor: pointer" onMouseOver="div.show('div1')" onMouseOut="div.hide('div1')">${notificationList.fName} ${notificationList.mName} ${notificationList.lName}</td>
                                    <td align="center"><input type="radio" required name="${notificationList.registration_id}" id="${notificationList.registration_id}" value="true"></td>
                                    <td align="center"><input type="radio" required name="${notificationList.registration_id}" id="${notificationList.registration_id}" value="false"></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <table style="position: relative; margin-top: -7px; width: auto;" class="col-lg-offset-9">
                            <tr>
                                <td><input align="center" type="submit" value="Submit" class="btn btn-primary"></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="box effect8 col-md-8 col-md-offset-2">
                    <div id="div1" >
                        <table  align="center" style="width: 100%; height: auto; margin-top: 10px;">
                            <thead>
                                <tr class="labelDetail">
                                    <td align="center">Index</td>
                                    <td align="center">Name</td>
                                    <td align="center">Email</td>
                                    <td align="center">Gender</td>
                                    <td align="center">DOB</td>
                                    <td align="center">Department</td>
                                    <td align="center">Institute</td>
                                </tr>
                            </thead>
                            <c:forEach var="notificationList" items="${notificationList}" varStatus="count">
                                <tr>
                                    <td align="center">${count.count}</td>
                                    <td align="center">${notificationList.fName} ${notificationList.mName} ${notificationList.lName}</td>
                                    <td align="center">${notificationList.email}</td>
                                    <td align="center">${notificationList.gender}</td>
                                    <td align="center">${notificationList.dateOfBirth}</td>
                                    <c:forEach var="tableDropDownDepartmentDetail" items="${tableDropDownDepartmentDetail}">              
                                        <c:if test="${notificationList.department_id eq tableDropDownDepartmentDetail.department_id}"><td align="center">${tableDropDownDepartmentDetail.department_name}</td></c:if>
                                    </c:forEach>
                                    <c:forEach var="tableDropDownInstituteDetail" items="${tableDropDownInstituteDetail}">              
                                        <c:if test="${notificationList.institute_id eq tableDropDownInstituteDetail.institute_id}"><td align="center">${tableDropDownInstituteDetail.institute_name}</td></c:if>
                                    </c:forEach>
                                </tr> 
                            </c:forEach>
                        </table>                                    
                    </div>
                </div>
            </div>
        </div>
        <div>
            <c:import url="footer.jsp"/>
        </div>

    </body>
</html>