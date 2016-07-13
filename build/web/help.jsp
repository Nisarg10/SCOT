<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">

        <link rel="stylesheet" type="text/css" href="css/containerCss.css">

        <script>
            function middleDiv() {
                var heightDiv = (document.documentElement.clientHeight) - 120 + "px";
                document.getElementById('middleDiv').style.height = heightDiv;
            }
        </script>
    </head>
    <body style="background-color: #F1F4F9" onload="middleDiv()">
        <div>
            <c:import url="header_1.jsp"/>
            <c:import url="navMenu.jsp"/>
        </div>
        <div id="middleDiv" class="container" style="background-color: white; overflow: auto;">

        </div>
        <div>
            <c:import url="footer.jsp"/>
        </div>
    </body>
</html>