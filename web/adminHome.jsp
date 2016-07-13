<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="../css/AdminHomeCSS.css"/>

        <link rel="stylesheet" type="text/css" href="../css/style8.css"/>
        <link rel="stylesheet" type="text/css" href="../css/simpletable.css"/>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

        <link rel="stylesheet" type="text/css" href="css/AdminHomeCSS.css"/>
        <link rel="stylesheet" type="text/css" href="../css/jquery.ui.theme.css"/>
        <link rel="stylesheet" type="text/css" href="css/jquery.ui.theme.css"/>
        <link rel="stylesheet" type="text/css" href="css/style8.css"/>
        <link rel="stylesheet" type="text/css" href="css/simpletable.css"/>

        <script src="../jQuery/jquery-1.11.0.js"></script>
        <script src="../jQuery/jquery-ui-1.10.4.js"></script>
        <script src="../jQuery/modernizr.custom.js"></script>

        <script src="jQuery/jquery-1.11.0.js"></script>
        <script src="jQuery/jquery-ui-1.10.4.js"></script>
        <script src="jQuery/modernizr.custom.js"></script>

        <title>Admin Home</title>
        <style>
            .passOpen{
                position:absolute;
                left: 0;
                top:0;
                z-index: 100;  
                width:100%;  
                height:100%;
                background-color: rgba(0,0,0,0.5); /*dim the background*/
            }
            .inner{
                position: relative;
                top: 50%;
                left: 50%;
                margin: -150px 0 0 -300px;
                width: 600px;
                height: 300px;
                z-index: 101;
                background-color: white;
                padding-top: 2px;
                padding-bottom: 3px;
                padding-left: 3px;
                padding-right: 3px;
            }
            .innerText{
                position: relative;
                margin:15px;
                padding: 5px;
                width:560px; 
                height: 260px;
                border: 1px solid lightblue;
                overflow: auto;
            }
            input{              
                padding: 0.4em;
                background-color: #eaeae3;              
            }
            input[type="submit"],[type="button"]{
                padding: 0.4em 0.7em;
                color: white;
                border: solid 1px #000;
                -webkit-transition: all 200ms linear;
                -moz-transition: all 200ms linear;
                -o-transition: all 200ms linear;
                -ms-transition: all 200ms linear;
                transition: all 200ms linear;
                background-color: #16a6b6;
                cursor: pointer;
                text-align: center;
            }
            input[type="submit"]:hover,[type="button"]:hover{
                background:#ee6557;
            }
            input[type="submit"]:active,[type="button"]:active{
                background:rgba(255,51,0,1);
            }
            #name{
                color: white;
            }
            #name:hover{
                color: black;
            }
            #notificationInner{
                position: relative;
                top: 50%;
                left: 50%;
                margin: -10% 0 0 -25%;
                width: 50%;
                height: 30%;
                z-index: 101;
                background-color: white;
            }
            #notificationInnerPanel{
                position: relative;
                width: 100%;
                height: 10%;
                font-size: 13px;
                padding: 10px 0 10px 0;
                color: #aaa;
                background: transparent url(../Images/stripes_black.png) repeat-x bottom left;
            }
            #notificationMain{
                position: relative;
                padding: 0 20px 0 20px;
                height: 64.2%;
            }
            #notificationBottomPanel{
                background: transparent url(../Images/stripes_black.png) repeat-x top left;
                padding-top: 10px;
                position: relative;
                width: 100%;
                font-size: 13px;
                color: #aaa;
            }
        </style>

        <script>
            function middleDiv() {
                var heightDiv = (document.documentElement.clientHeight) - 154 + "px";
                document.getElementById('middleDiv').style.height = heightDiv;
                document.getElementById('middleDiv2').style.height = heightDiv;
            }
            function goTo(tableNames) {
                var x = "/TableController/" + tableNames;
                window.location.assign("${pageContext.request.contextPath}" + x);
            }
            function passChange() {
                if (document.getElementById('passChange').style.display === "none") {
                    document.getElementById('passChange').style.display = "block";
                } else {
                    document.getElementById('passChange').style.display = "none";
                    document.getElementById("error").innerHTML = "";
                    document.changePassword.userName.value = "";
                    document.changePassword.passWord.value = "";
                    document.changePassword.confirmPassWord.value = "";
                }
            }
            function validationData()
            {
                var passWord = document.changePassword.passWord.value;
                var confirmPassWord = document.changePassword.confirmPassWord.value;

                if (passWord !== confirmPassWord) {
                    document.getElementById("error").innerHTML = "Password doens't match";
                    return false;
                }
                else
                    return true;
            }
            function set()
            {
                document.getElementById("trigger-overlay").src = "../Images/NotificationOn.png";
            }
            function setx()
            {
                document.getElementById("trigger-overlay").src = "../Images/NotificationOff.png";
            }
        </script>
        <script>
            $(function() {
                $("#accordion").accordion({
                    heightStyle: "content"
                });
            });
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
    </head>
    <c:choose>
        <c:when test="${userName != null}">
            <c:choose>
                <c:when test="${error != null}">
                    <body style="overflow: hidden;" onload="middleDiv();
                            passChange();">
                    </c:when>
                    <c:when test="${tableNames == null}">
                    <body style="overflow: hidden;" onload="middleDiv();
                                    showTable();">
                    </c:when>
                    <c:otherwise>
                    <body style="overflow: hidden;" onload="middleDiv();">
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${msg != null}">
                        <div>
                            <c:import url="header_1.jsp"/>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div>
                            <c:import url="header.jsp"/>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${msg != null}">
                        <div style="position: absolute; top: 5px; right: 5px;">
                            <img id="trigger-overlay" onmouseover="set()" onmouseout="setx()" src="Images/NotificationOff.png" alt="notificationOff" height="25px" width="25px" style="cursor: pointer">
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div style="position: absolute; top: 5px; right: 5px;">
                            <img id="trigger-overlay" onmouseover="set()" onmouseout="setx()" src="../Images/NotificationOff.png" alt="notificationOff" height="25px" width="25px" style="cursor: pointer">
                        </div>
                    </c:otherwise>
                </c:choose>
                <div style="z-index: 100; right: 40px; position: absolute; top: 5px;">
                    <a id="name" style="text-decoration: none;" href="#" onclick="passChange()">Welcome, ${userName}</a>
                </div>
                <div class="row">
                    <div class="col-md-4" style="height: 35px; background-color: #018fbe; font-size: 30px; font-family: georgia, serif; font-weight: bold; color:#FFFFFF; text-shadow:2px 1px 1px rgba(10,8,20,1); text-align:center;">TABLES</div>
                    <div class="col-md-8" style="height: 35px; background-color: #018fbe; font-size: 30px; font-family: georgia, serif; font-weight: bold; color:#FFFFFF; text-shadow:2px 1px 1px rgba(10,8,20,1); text-align:center;">DETAILS</div>
                </div>
                <div class="row">
                    <div class="col-md-4" style="overflow: auto" id="middleDiv">		
                        <div id="accordion">

                            <h5>Locality</h5>
                            <div>
                                <ul style="list-style-type:square">
                                    <c:forEach var="tableNames" items="${tableNames}">
                                        <c:if test="${(tableNames eq 'city' or tableNames  eq 'country' or tableNames eq 'state')}">
                                            <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px">
                                                    <c:choose>
                                                        <c:when test="${tableNames eq 'city'}">
                                                            City
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'country'}">
                                                            Country
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'state'}">
                                                            State
                                                        </c:when>
                                                    </c:choose>
                                                </a></li>
                                            </c:if>
                                        </c:forEach> 
                                </ul>
                            </div>

                            <h5>Institute Information</h5>
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
                                        <c:if test="${(tableNames eq 'department_detail' or tableNames  eq 'division' or tableNames eq 'semester' or tableNames eq 'subject')}">
                                            <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px;">
                                                    <c:choose>
                                                        <c:when test="${tableNames eq 'department_detail'}">
                                                            Department Detail
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'division'}">
                                                            Division Detail
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'semester'}">
                                                            Semester Detail
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'subject'}">
                                                            Subject Detail
                                                        </c:when>
                                                    </c:choose>
                                                </a></li>
                                            </c:if>
                                        </c:forEach> 
                                </ul>
                            </div>

                            <h5>Faculty Related Information</h5>
                            <div>
                                <ul style="list-style-type:square">
                                    <c:forEach var="tableNames" items="${tableNames}">
                                        <c:if test="${(tableNames eq 'faculty_allocation_subject' or tableNames  eq 'faculty_workload' or tableNames eq 'user_type')}">
                                            <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px;">
                                                    <c:choose>
                                                        <c:when test="${tableNames eq 'faculty_allocation_subject'}">
                                                            Faculty Subject Allocation Detail
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'faculty_workload'}">
                                                            Faculty Workload Detail
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'user_type'}">
                                                            Faculty Type Detail
                                                        </c:when>
                                                    </c:choose>
                                                </a></li>
                                            </c:if>
                                        </c:forEach> 
                                </ul>
                            </div>

                            <h5>Classroom Information</h5>
                            <div>
                                <ul style="list-style-type:square">
                                    <c:forEach var="tableNames" items="${tableNames}">
                                        <c:if test="${(tableNames eq 'class_type' or tableNames  eq 'room_allocation')}">
                                            <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px;">
                                                    <c:choose>
                                                        <c:when test="${tableNames eq 'class_type'}">
                                                            Class Type Detail
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'room_allocation'}">
                                                            Room Allocation Detail
                                                        </c:when>
                                                    </c:choose>
                                                </a></li>
                                            </c:if>
                                        </c:forEach> 
                                </ul>
                            </div>

                            <h5>Degree Information</h5>
                            <div>
                                <ul style="list-style-type:square">
                                    <c:forEach var="tableNames" items="${tableNames}">
                                        <c:if test="${(tableNames eq 'degree' or tableNames  eq 'degree_type')}">
                                            <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px;">
                                                    <c:choose>
                                                        <c:when test="${tableNames eq 'degree'}">
                                                            Degree Detail
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'degree_type'}">
                                                            Degree Type Detail
                                                        </c:when>
                                                    </c:choose>
                                                </a></li>
                                            </c:if>
                                        </c:forEach> 
                                </ul>
                            </div>

                            <h5>Timetable Information</h5>
                            <div>
                                <ul style="list-style-type:square">
                                    <c:forEach var="tableNames" items="${tableNames}">
                                        <c:if test="${(tableNames eq 'day' or tableNames  eq 'proxy_table' or tableNames eq 'timeslot_template' or tableNames eq 'timetable_main')}">
                                            <li><a href="#" onclick="goTo('${tableNames}')" style="text-decoration: none;font-size:16px;">
                                                    <c:choose>
                                                        <c:when test="${tableNames eq 'day'}">
                                                            Day
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'proxy_table'}">
                                                            Proxy Table
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'timeslot_template'}">
                                                            Timeslot Templates
                                                        </c:when>
                                                        <c:when test="${tableNames eq 'timetable_main'}">
                                                            Timetable 
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
                        <c:if test="${tableName eq 'city'}">
                            <c:import url="cityContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'country'}">
                            <c:import url="countryContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'state'}">
                            <c:import url="stateContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'institute_detail'}">
                            <c:import url="instituteDetailContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'department_detail'}">
                            <c:import url="departmentDetailContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'division'}">
                            <c:import url="divisionContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'semester'}">
                            <c:import url="semesterContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'subject'}">
                            <c:import url="subjectContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'faculty_allocation_subject'}">
                            <c:import url="facultyAllocationSubjectContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'faculty_workload'}">
                            <c:import url="facultyWorkloadContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'user_type'}">
                            <c:import url="userTypeContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'class_type'}">
                            <c:import url="classTypeContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'room_allocation'}">
                            <c:import url="roomAllocationContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'degree'}">
                            <c:import url="degreeContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'degree_type'}">
                            <c:import url="degreeTypeContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'day'}">
                            <c:import url="dayContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'proxy_table'}">
                            <c:import url="proxyTableContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'timeslot_template'}">
                            <c:import url="timeslotTemplateContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'timetable_main'}">
                            <c:import url="timetableMainContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'class_type_hours'}">
                            <c:import url="classTypeHoursContent.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'continuous_hours'}">
                            <c:import url="continuousHours.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'faculty_maxhours_day'}">
                            <c:import url="facultyMaxHoursDay.jsp"/>
                        </c:if>
                        <c:if test="${tableName eq 'subject_continuous'}">
                            <c:import url="subjectContinuous.jsp"/>
                        </c:if>

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
                                            <td style="font-weight: bold;">Password:</td>
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
                                            <td align="center" style="cursor: pointer;" onMouseOver="div.show('div1')" onMouseOut="div.hide('div1')" >${notificationList.fName} ${notificationList.mName} ${notificationList.lName}</td>
                                            <td align="center"><input type="radio" required name="${notificationList.registration_id}" id="${notificationList.registration_id}" value="true"></td>
                                            <td align="center"><input type="radio" required name="${notificationList.registration_id}" id="${notificationList.registration_id}" value="false"></td>
                                        </tr> 
                                    </c:forEach>
                                </table>
                        </div>

                        <div id="notificationBottomPanel">
                            <table style="position: relative; margin-top: -7px; width: 100%;">
                                <tr>
                                    <td><input align="center" type="submit" value="Submit" style="width: 100%"></td>
                                    <td><button align="center" type="button" class="overlay-close" value="Close" style="width: 100%">Close</button></td>
                                </tr>
                            </table>
                        </div>
                        <div id="div1">
                            <table class="table" style="width: 100%; height: 100%">
                                <thead>
                                    <tr>
                                        <th>Index</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>DOB</th>
                                        <th>Department</th>
                                        <th>Institute</th>
                                    </tr>
                                </thead>
                                <c:forEach var="notificationList" items="${notificationList}" varStatus="count">
                                    <tr>
                                        <td align="center">${count.count}</td>
                                        <td align="center">${notificationList.fName} ${notificationList.mName} ${notificationList.lName}</td>
                                        <td>${notificationList.email}</td>
                                        <td>${notificationList.gender}</td>
                                        <td>${notificationList.dateOfBirth}</td>
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
                        </form>
                    </div>
                </div>
                <script src="../jQuery/classie.js"></script>
                <script src="../jQuery/demo7.js"></script>

                <script src="jQuery/classie.js"></script>
                <script src="jQuery/demo7.js"></script>
            </body>
        </c:when>
        <c:otherwise>
            <c:redirect url="admin.jsp"/>
        </c:otherwise>
    </c:choose>
</html>