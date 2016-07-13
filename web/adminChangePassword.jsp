<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/AdminHomeCSS.css">
        <style>
            .overlay{
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
                background: white;
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
                border: solid 1px #f3efac;
                padding: 0.4em;
                background-color: #eaeae3;
                box-shadow: inset 0 2px 3px rgba(0,0,0,0.2);
            }
            input[type="submit"]{
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
            input[type="submit"]:hover{
                background:#ee6557;
            }
            input[type="submit"]:active{
                background:rgba(255,51,0,1);
            }
        </style>
        <script>
            function validationData()
            {
                var userName = document.changePassword.userName.value;
                var passWord = document.changePassword.passWord.value;
                var confirmPassWord = document.changePassword.confirmPassWord.value;

                if (userName === "admin") {
                    document.getElementById("error").innerHTML = "Change Username";
                    return false;
                }
                else if (passWord === "123") {
                    document.getElementById("error").innerHTML = "Change Password";
                    return false;
                }
                else if (passWord !== confirmPassWord) {
                    document.getElementById("error").innerHTML = "Password doens't match";
                    return false;
                }
                else
                    return true;
            }
        </script>
    </head>
    <body>
        <div>
            <c:import url="header.jsp"/>
        </div>
        <div class="overlay"  style="display: block;">
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
                                    <td colspan="2" align="right">
                                        <input type="submit" value="Submit">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <label id="error"></label>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <c:import url="footer.jsp"/>
        </div>
    </body>
</html>
