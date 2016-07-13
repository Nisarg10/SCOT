<%-- 
    Document   : Customer
    Created on : Aug 7, 2015, 7:18:59 PM
    Author     : Nisarg
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Details</title>
        <c:choose>
            <c:when test='${msg != null}'>
                <link rel="stylesheet" type="text/css" href="../css/LayoutMain.css" />
                <link rel="stylesheet" type="text/css" href="../css/style.css" />
            </c:when>
            <c:otherwise>
                <link rel="stylesheet" type="text/css" href="css/LayoutMain.css" />
                <link rel="stylesheet" type="text/css" href="css/style.css" />
            </c:otherwise>
        </c:choose>
    </head>
    <body style="overflow: hidden;">
        <div id="header">
            <c:choose>
                <c:when test='${msg != null}'>
                    <img id="widh" src="../Images/Login Page Header.png" alt="header">
                </c:when>
                <c:otherwise>
                    <img id="widh" src="Images/Login Page Header.png" alt="header">
                </c:otherwise>
            </c:choose>
        </div>
        <div id="body" style="margin-top: 100px">		
            <div id="wrapper">
                <div id="login" class="animate form">
                    <form  name="loginForm" action="${pageContext.request.contextPath}/UserController/CarType" method="post" autocomplete="on"> 
                        <h1 id="h1Size">Update Rates</h1>
                                                
                        <label for="Type" class="Type">Car Type:</label>
                        <select id="Type" name="Type" class="form-control">
                            <option value="Compact">Compact</option>
                            <option value="Large">Large</option>
                            <option value="Medium">Medium</option>
                            <option value="SUV">SUV</option>
                            <option value="Truck">Truck</option>
                            <option value="Van">Van</option>
                        </select>
                        <p> 
                            <label for="DailyRate" class="DailyRate"> Vehicle ID</label>
                            <input id="DailyRate" name="DailyRate" required="required" type="text" placeholder="40"/>
                        </p>
                        <p> 
                            <label for="WeeklyRate" class="WeeklyRate"> Car Model: </label>
                            <input id="WeeklyRate" name="WeeklyRate" required="required" type="text" placeholder="100" /> 
                        </p>
                        <p class="login button"> 
                            <input type="submit" value="Update" />
                        </p>
                        <br>
                        <br>
                        <br>
                        <div align="right" style="margin-top: -50px; color: red;" <c:if test='${msg == null or msg == " "}'>hidden</c:if>>
                                <img src="../Images/Error.png" alt="error" height="15px" width="15px">
                            <c:if test='${msg !=null}'>
                                ${msg}
                            </c:if>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div>
            <c:import url="footer.jsp"/>
        </div>
    </body>
</html>

