<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
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
    <body style="overflow:hidden;" class="Bodynoscroll">
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
        <div style="margin-top: -144px">
            <c:choose>
                <c:when test='${msg != null}'>
                    <img id="symbolScot" src="../Images/SCOT.png" alt="symbol">
                </c:when>
                <c:otherwise>
                    <img id="symbolScot" src="Images/SCOT.png" alt="symbol">
                </c:otherwise>
            </c:choose>
        </div>
        <div id="body" style="margin-top: 180px">		
            <div id="wrapper">
                <div id="login" class="animate form">
                    <form  action="${pageContext.request.contextPath}/AdminController/adminLogin" method="post" autocomplete="on"> 
                        <h1 id="h1Size">Admin Login</h1> 
                        <p> 
                            <label for="username" class="uname" data-icon="u">Your username </label>
                            <input id="username" name="userName" required="required" type="text" placeholder="Username"/>
                        </p>
                        <p> 
                            <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                            <input id="password" name="passWord" required="required" type="password" placeholder="Password" /> 
                        </p>
                        <p class="login button"> 
                            <input type="submit" value="Login" /> 
                        </p>
                        <div style="margin-top: -50px; color: red" <c:if test='${msg == null}'>hidden</c:if>>
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