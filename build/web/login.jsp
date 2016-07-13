<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login SCOT</title>
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
                <script>
                    function registerPage()
                    {
                        document.loginForm.action = "${pageContext.request.contextPath}/UserController/raw_data";
                        document.loginForm.submit();
                    }
                </script>
    </head>
    <body style="overflow:hidden;">
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
                    <form  name="loginForm" action="${pageContext.request.contextPath}/UserController/userLogin" method="post" autocomplete="on"> 
                        <h1 id="h1Size">User Login</h1>
                        <p> 
                            <label for="email" class="uname" data-icon="u"> Your email</label>
                            <input id="email" name="email" required="required" type="text" placeholder="Email"/>
                        </p>
                        <p> 
                            <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                            <input id="password" name="passWord" required="required" type="password" placeholder="Password" /> 
                        </p>
                        <p class="login button"> 
                            <input type="submit" value="Login" />
                            <input type="button" value="Register Here" onclick="registerPage()"/>
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
</html>