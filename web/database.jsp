<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/AdminHomeCSS.css">
        <link rel="stylesheet" type="text/css" href="../css/jquery.ui.theme.css">
        <link rel="stylesheet" type="text/css" href="../css/containerCss.css"/>

        <script src="../jQuery/jquery-1.11.0.js"></script>
        <script src="../jQuery/jquery-ui-1.10.4.js"></script>

        <link rel="stylesheet" type="text/css" href="css/AdminHomeCSS.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.ui.theme.css">
        <link rel="stylesheet" type="text/css" href="css/containerCss.css"/>

        <script src="jQuery/jquery-1.11.0.js"></script>
        <script src="jQuery/jquery-ui-1.10.4.js"></script>


        <title>Database</title>

        <script>
            function middleDiv() {
                var heightDiv = (document.documentElement.clientHeight) - 154 + "px";
                document.getElementById('middleDiv').style.height = heightDiv;
                document.getElementById('middleDiv2').style.height = heightDiv;
            }
            function goTo(tableNames) {
                var x = "/UserTableController/" + tableNames;
                window.location.assign("${pageContext.request.contextPath}" + x);
            }
        </script>
        <script>
            $(function() {
                $("#accordion").accordion({
                    heightStyle: "content"
                });
            });
        </script>
    </head>
    <c:choose>
        <c:when test="${userName != null}">
            <body style="overflow: hidden; background-color: #F1F4F9;" onload="middleDiv();">
                <div>
                    <c:choose>
                        <c:when test = "${msg != null}">
                            <c:import url="header_1.jsp"/>
                        </c:when>
                        <c:otherwise>
                            <c:import url="header.jsp"/>
                        </c:otherwise>
                    </c:choose>
                    <c:import url="navMenu.jsp"/>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4" style="height: 35px; background-color: #018fbe; font-size: 20px; font-family: 'Bebas Neue';  color:#FFFFFF;"><div style="text-align: center; padding-top: 8px">TABLES</div></div>
                        <div class="col-md-8" style="height: 35px; background-color: #018fbe; font-size: 20px; font-family: 'Bebas Neue';  color:#FFFFFF;"><div style="text-align: center; padding-top: 8px">DETAILS</div></div>
                    </div>

                    <div class="row">
                        <div class="col-md-4" style="overflow: auto; background-color: white" id="middleDiv">		
                            <div id="accordion">

                                <h5>Institute Information</h1>
                                    <div>
                                        <ul style="list-style-type:square">
                                            <c:forEach var="tableNames" items="${tableNames}">
                                                <c:if test="${(tableNames eq 'institute_detail')}">
                                                    <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px">
                                                            <c:choose>
                                                                <c:when test="${tableNames eq 'institute_detail'}">
                                                                    Institute Detail
                                                                </c:when>
                                                            </c:choose>
                                                        </a></li>
                                                    </c:if>
                                                </c:forEach> 
                                        </ul>
                                    </div>

                                    <h5>Department Information</h5>
                                    <div>
                                        <ul style="list-style-type:square">
                                            <c:forEach var="tableNames" items="${tableNames}">
                                                <c:if test="${tableNames eq 'department_detail'}">
                                                    <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px;">
                                                            <c:choose>
                                                                <c:when test="${tableNames eq 'department_detail'}">
                                                                    Department Detail
                                                                </c:when>
                                                            </c:choose>
                                                        </a></li>
                                                    </c:if>
                                                </c:forEach> 
                                        </ul>
                                    </div>
                                    <h5>Constraint Tables</h5>
                                    <div>
                                        <ul style="list-style-type:square">
                                            <c:forEach var="tableNames" items="${tableNames}">
                                                <c:if test="${(tableNames eq 'class_type_hours' or tableNames  eq 'continuous_hours' or tableNames eq 'faculty_maxhours_day' or tableNames eq 'subject_continuous')}">
                                                    <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px;">
                                                            <c:choose>
                                                                <c:when test="${tableNames eq 'class_type_hours'}">
                                                                    Class Duration 
                                                                </c:when>
                                                                <c:when test="${tableNames eq 'continuous_hours'}">
                                                                    Continuous Hours of Study
                                                                </c:when>
                                                                <c:when test="${tableNames eq 'faculty_maxhours_day'}">
                                                                    Faculty's Teaching Hours per Day
                                                                </c:when>
                                                                <c:when test="${tableNames eq 'subject_continuous'}">
                                                                    Continuous Subject Teaching Hours 
                                                                </c:when>
                                                            </c:choose>
                                                        </a></li>
                                                    </c:if>
                                                </c:forEach> 
                                        </ul>
                                    </div>
                            </div>
                        </div>
                        <div class="col-md-8" style="background-color: white;overflow: auto;" id="middleDiv2">
                            <c:if test="${tableName eq 'institute_detail'}">
                                <c:import url="instituteDetailContent_1.jsp"/>
                            </c:if>
                            <c:if test="${tableName eq 'department_detail'}">
                                <c:import url="departmentDetailContent_1.jsp"/>
                            </c:if>
                            <c:if test="${tableName eq 'class_type_hours'}">
                                <c:import url="classTypeHoursContent_1.jsp"/>
                            </c:if>
                            <c:if test="${tableName eq 'continuous_hours'}">
                                <c:import url="continuousHours_1.jsp"/>
                            </c:if>
                            <c:if test="${tableName eq 'faculty_maxhours_day'}">
                                <c:import url="facultyMaxHoursDay_1.jsp"/>
                            </c:if>
                            <c:if test="${tableName eq 'subject_continuous'}">
                                <c:import url="subjectContinuous_1.jsp"/>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div>
                    <c:import url="footer.jsp"/>
                </div>
                <div class="passOpen" id="passChange" style="display: none;">
                    <div class="inner" > 
                        <div class="innerText" style="text-align: center">
                            <p style="font-weight: bold">Change Username and Password</p>
                            <br>
                            <div align="center">
                                <form name="changePassword" method="post" onsubmit="return validationData()" action="${pageContext.request.contextPath}/AdminController/changePassword">
                                    <table style="text-align: left">
                                        <tr>
                                            <td style="font-weight: bold">Username:</td>
                                            <td><input type="textbox" required="required" placeholder="Username" name="userName"></td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold">Password:</td>
                                            <td><input type="password" required="required" placeholder="Password" name="passWord"></td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold">Confirm Password:</td>
                                            <td><input type="password" required="required" placeholder="Confirm password" name="confirmPassWord"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td align="center">
                                                <input type="button" value="Cancel" onclick="passChange()">
                                                <input type="submit" value="Submit">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">                                    
                                                <label id="error">${error}</label>                                   
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="overlay overlay-contentscale">
                    <div id="notificationInner">
                        <div id="notificationInnerPanel" align="center">NOTIFICATION</div>
                        <div id="notificationMain" style="overflow: auto">
                            <form name="notificationSet" method="post" action="${pageContext.request.contextPath}/AdminController/notificationSet">
                                <table class="table" style="width: 100%; height: 100%">
                                    <thead>
                                        <tr>
                                            <th>Index</th>
                                            <th>Detail</th>
                                            <th>Activate</th>
                                            <th>Deactivate</th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="notificationList" items="${notificationList}" varStatus="count">
                                        <tr>
                                            <td align="center">${count.count}</td>
                                            <td align="center">${notificationList.fName} ${notificationList.mName} ${notificationList.lName}</td>
                                            <td align="center"><input type="radio" required name="${notificationList.registration_id}" id="${notificationList.registration_id}" value="activate"></td>
                                            <td align="center"><input type="radio" required name="${notificationList.registration_id}" id="${notificationList.registration_id}" value="deactivate"></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                        </div>
                        <div id="notificationBottomPanel">
                            <input type="submit" value="Submit" style="width: 49.8%; height: 100%">
                            <button type="button" class="overlay-close" value="Close" style="width: 49.8%; height: 100%">Close</button>
                        </div>
                        </form>
                    </div>
                </div>
                <script src="../jQuery/classie.js"></script>
                <script src="../jQuery/demo7.js"></script>
            </body>
        </c:when>
        <c:otherwise>
            <c:redirect url="admin.jsp"/>
        </c:otherwise>
    </c:choose>
</html>
