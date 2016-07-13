<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Detail</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/containerCss.css">
        <link rel="stylesheet" type="text/css" href="css/containerCss.css">

        <script src="jQuery/bootstrap.js"></script>
        <script src="jQuery/jquery-1.11.0.js"></script>
        <script src="../jQuery/jquery-1.11.0.js"></script>
        <script src="../jQuery/bootstrap.js"></script>

        <script>
            function middleDiv() {
                var heightDiv = (document.documentElement.clientHeight) - 120 + "px";
                document.getElementById('middleDiv').style.height = heightDiv;
            }
        </script>

        <style>
            .box {
                width:70%;
                height:200px;
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
                font-size: 20px;
                color:black;
                padding-top: 6px;
            }

        </style>

    </head>
    <body style="background-color: #F1F4F9" onload="middleDiv()">
        <div>
            <c:choose>
                <c:when test="${msg != null}">
                    <c:import url="header.jsp"/>
                </c:when>
                <c:otherwise>
                    <c:import url="header_1.jsp"/>
                </c:otherwise>
            </c:choose>
            <c:import url="navMenu.jsp"/>
        </div>
        <div id="middleDiv" class="container" style="background-color: white; overflow: auto;">
            <div class="row" style="margin-top: 40px">
                <div class="col-md-8 col-md-offset-1">
                    <div class="col-md-1">
                        <c:choose>
                            <c:when test="${msg != null}">
                                <img src="../Images/UserIcon.png" style="width: 50px; height: 50px;" alt="userIcon">
                            </c:when>
                            <c:otherwise>
                                <img src="Images/UserIcon.png" style="width: 50px; height: 50px;" alt="userIcon">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-7">
                        <h3 style="margin-top: 5px">${userBean.fName} ${userBean.mName} ${userBean.lName}</h3>
                        <c:forEach var="user_type" items="${user_type}"> 
                            <c:if test="${user_type.user_type_id eq userBean.user_type_id}"><span><div style="margin-top: -12px; font-style: italic">${user_type.user_type}</div></span></c:if>          
                            </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="box effect8 col-md-8 col-md-offset-1" style="margin-top: 8%">
                    <div class="col-md-6">
                        <h4  class="labelDetail" style="margin-top: 10%; margin-left: 5%">Institute Detail</h4>
                        <div style="margin-top: 10px"><spna class="col-md-3">Institute: </spna>
                            <c:forEach var="institute" items="${institute}"> 
                                <c:if test="${institute.institute_id eq userBean.institute_id}"><span style="margin-left: 10%; font-style: italic">${institute.institute_name}</span></c:if>          
                            </c:forEach>                         
                        </div>
                        <div style="margin-top: 5px;"><spna class="col-md-3">Department: </spna>
                            <c:forEach var="department" items="${department}"> 
                                <c:if test="${department.department_id eq userBean.department_id}"><span style="margin-left: 10%; font-style: italic">${department.department_name}</span></c:if>          
                            </c:forEach>                         
                        </div>
                        <div style="margin-top: 5px"><spna class="col-md-3">Degree: </spna><span style="margin-left: 10%; font-style: italic">${userBean.degree_registration}</span></div>
                    </div>
                    <div class="col-md-6" style="height: 100%; width: 50%">
                        <h4 class="labelDetail" style="margin-top: 10%">Professional Detail</h4>
                        <span>${userBean.professionalDetail}</span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div style="margin-top: 45%">
                        <h4 class="labelDetail">Contact Detail</h4>
                    </div>
                    <div style="margin-top: 10px;"><span style="font-style: italic; text-decoration: underline">Address:</span><span> ${userBean.address}</span></div>
                    <div style="margin-top: 10px"><span style="font-style: italic; text-decoration: underline">City:</span><span> ${userBean.city}</span></div>
                    <div style="margin-top: 10px"><span style="font-style: italic; text-decoration: underline">Contact No:</span><span> ${userBean.mobileNo}</span></div>
                    <div style="margin-top: 10px"><span style="font-style: italic; text-decoration: underline">Email:</span><span> ${userBean.email}</span></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-offset-1">
                    <button class="btn btn-primary col-md-2" data-toggle="modal" data-target="#myModal">
                        EDIT
                    </button>
                </div>
            </div>
        </div>
        <div>
            <c:import url="footer.jsp"/>
        </div>

        <form name="updateRegistrationDetail" method="post" action="${pageContext.request.contextPath}/UserController/updateDetails">
            <input type="hidden" value="${userBean.registration_id}" name="registrationId" id="registrationId">
            <input type="hidden" value="${userBean.email}" name="emailId" id="emailId">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title " id="myModalLabel" align="center" style="font-size: 25px; font-family: Bebas Neue;">Registration Detail</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row" name="firstStep" id="firstStep" style="margin-top: -20px">
                                <table border="0" class="" style="margin-top: 30px">                      
                                    <tr>
                                        <td align="right">
                                            <label class="labelDetail">
                                                Name
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td class="form-inline">
                                            <input type="text" name="fname" id="fname" placeholder="First Name" class="form-control" style="width: 140px; text-align: center;" disabled value="${userBean.fName}">
                                            <input type="text" name="mname" id="mname" placeholder="Middle Name" class="form-control" style="width: 140px; text-align: center;" disabled value="${userBean.mName}">
                                            <input type="text" name="lname" id="lname" placeholder="Last Name" class="form-control" style="width: 140px; text-align: center;" disabled value="${userBean.lName}">
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td align="right">
                                            <label class="labelDetail">
                                                Email Address
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td>
                                            <input type="email" name="email" id="email" class="form-control" placeholder="abc@gmail.com" style="text-align: center" disabled value="${userBean.email}"> 
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <label class="labelDetail">
                                                Password
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td class="form-inline">
                                            <input type="password" name="password" id="password" required class="form-control" placeholder="Enter Password" style="text-align: center; width: 211px">
                                            <input type="password" name="confirmPassword" id="confirmPassword" required class="form-control" placeholder="Confirm Password" style="text-align: center; width: 211px"> 
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <label class="labelDetail">
                                                User Type ID
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td>
                                            <select name="userTypeId" class="form-control" disabled>
                                                <c:forEach var="tableDropDownUserType" items="${user_type}"> 
                                                    <option value="${tableDropDownUserType.user_type_id}" <c:if test="${userBean.user_type_id == tableDropDownUserType.user_type_id}">selected</c:if>>${tableDropDownUserType.user_type}</option>   
                                                </c:forEach>
                                            </select> 
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td align="right">
                                            <label class="labelDetail">
                                                Contact Number
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td>
                                            <input type="text" name="mobileNumber" id="mobileNumber" class="form-control" placeholder="Enter Contact Number i.e (9** *** ****)" style="text-align: center" value="${userBean.mobileNo}"> 
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <label class="labelDetail">
                                                Address
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td class="">
                                            <textarea rows="3" cols="45" id="address" name="address" class="form-control" placeholder="Enter your address" >${userBean.address}</textarea>
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <label class="labelDetail">
                                                Locality
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td class="form-inline">
                                            <table style="position: relative; width: 100%">
                                                <tr>
                                                    <td>
                                                        <input type="text" name="city" id="city" class="form-control" style="text-align: center; width: 120px;" placeholder="Enter City" value="${userBean.city}">
                                                    </td>
                                                    <td style="padding-left: 5px"> 
                                                        <input type="text" name="state" id="state" class="form-control" style="text-align: center; width: 155px;" placeholder="Enter State/Province" value="${userBean.state}">
                                                    </td>
                                                    <td style="padding-left: 5px"> 
                                                        <select name="country" id="country" class="form-control">
                                                            <c:forEach var="tableDropDownCountry" items="${country}"> 
                                                                <option value="${tableDropDownCountry.country_id}" <c:if test="${userBean.country_id == tableDropDownCountry.country_id}">selected</c:if> >${tableDropDownCountry.country_name}</option>   
                                                            </c:forEach>                                                                                                                                
                                                        </select> 
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <label class="labelDetail">
                                                Institute Detail
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td>
                                            <table style="position: relative; width: 100%">
                                                <tr>
                                                    <td> 
                                                        <select name="institute" id="institute" class="form-control">
                                                            <c:forEach var="tableDropDownInstituteDetail" items="${institute}"> 
                                                                <option value="${tableDropDownInstituteDetail.institute_id}" <c:if test="${userBean.institute_id == tableDropDownInstituteDetail.institute_id}">selected</c:if>>${tableDropDownInstituteDetail.institute_name}</option>   
                                                            </c:forEach>
                                                        </select> 
                                                    </td>
                                                    <td style="padding-left: 5px"> 
                                                        <select name="department" id="department" class="form-control">
                                                            <c:forEach var="tableDropDownDepartmentDetail" items="${department}"> 
                                                                <option value="${tableDropDownDepartmentDetail.department_id}" <c:if test="${userBean.department_id == tableDropDownDepartmentDetail.department_id}">selected</c:if>>${tableDropDownDepartmentDetail.department_name}</option>   
                                                            </c:forEach>
                                                        </select> 
                                                    </td>
                                                </tr>
                                            </table> 
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td align="right">
                                            <label class="labelDetail">
                                                Educational Qualification
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td>
                                            <input type="text" name="educationQualification" id="educationQualification" class="form-control" placeholder="Enter your acdemic details i.e. B.Tech, PHd, etc." style="text-align: center" value="${userBean.degree_registration}"> 
                                        </td>
                                    </tr>
                                    <tr style="height:20px;"></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <label class="labelDetail">
                                                Professional Details
                                            </label>
                                        </td>
                                        <td class="col-md-1"></td>
                                        <td class="">
                                            <textarea rows="3" id="professionDetail" name="professionalDetail" id="professionalDetail" cols="45" class="form-control" placeholder="Enter details such as your acedemic background, institutes or organizations you have worked with, work-experience, current on-going projects or reasearch if any">
                                                ${userBean.professionalDetail}
                                            </textarea>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-primary" value="Save changes">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>