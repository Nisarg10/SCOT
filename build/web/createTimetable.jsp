<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Timetable</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/containerCss.css">
        <link rel="stylesheet" type="text/css" href="css/containerCss.css">

        <script src="jQuery/jquery-1.11.0.js"></script>
        <script src="../jQuery/jquery-1.11.0.js"></script>
        <script src="jQuery/jquery-ui-1.10.4.min.js"></script>
        <script src="../jQuery/jquery-ui-1.10.4.min.js"></script>

        <script>
            function middleDiv() {
                var heightDiv = (document.documentElement.clientHeight) - 120 + "px";
                var heightDiv2 = (document.documentElement.clientHeight) - 193 + "px";
                document.getElementById('middleDiv').style.height = heightDiv;
                document.getElementById('detailPanelDiv').style.height = heightDiv2;
            }
        </script>

        <script>
            $(function() {


                var dropBoxLeft;
                var dropBoxTop;
                var droppedSubjectId;
                var droppedRegistration_SubjectId;
                var droppedCellClass;
                var droppedRegistraitonId;
                var dropBoxId;
                var dropBoxLeft;
                var dropBoxTop;
                var tempWorkload;


                $(".teacherDiv , .breakDiv").draggable({
                    containment: "#middleDiv",
                    start: function(event, ui) {
                        dropBoxId = $(this).attr('id');
                        //alert(dropBoxId);
                        droppedSubjectId = dropBoxId.substring(dropBoxId.indexOf("_") + 1, dropBoxId.lastIndexOf("_"));
                        droppedRegistraitonId = dropBoxId.substring(dropBoxId.indexOf("a") + 1, dropBoxId.indexOf("_"));
                        droppedRegistration_SubjectId = dropBoxId.substring(dropBoxId.indexOf("a") + 1, dropBoxId.lastIndexOf("_"));
                       // alert(dropBoxId + " " + droppedRegistraitonId+ " " +droppedSubjectId);

                        if ($("#initialPositionLeft_" + droppedSubjectId).val() === "empty") {
                            dropBoxLeft = $(this).position().left;
                            dropBoxTop = $(this).position().top;
                            $("#initialPositionTop_" + droppedSubjectId).val(dropBoxTop);
                            $("#initialPositionLeft_" + droppedSubjectId).val(dropBoxLeft);
                        }
                    },
                    stop: function(event, ui) {
                        if (droppedCellClass === "droppable ui-droppable") {
                            droppedCellClass = null;
                        }
                        else {
                            $(this).animate({
                                top: $("#initialPositionTop_" + droppedSubjectId).val(),
                                left: $("#initialPositionLeft_" + droppedSubjectId).val()
                            });
                        }
                    }
                });


                $(".droppable").droppable({
                    tolerance: 'fit',
                    hoverClass: 'droppableHover',
                    drop: function(event, ui) {
                        droppedCellClass = $(this).attr('class');
                        
                        var droppableCellID = $(this).attr('id');
                        var dropppableBoxLeft = $(this).position().left;
                        var dropppableBoxTop = $(this).position().top;
                        
                        var FirstBreak = $(this).attr('id');
                        var LastBreak;
                        
                        var cellAboveBelowBreakID;
                        var cellAboveBreakID;
                        var cellBelowBreakID;
                        
                        FirstBreak = FirstBreak.substring(FirstBreak.indexOf("_") + 1);
                        LastBreak = parseInt(FirstBreak);
                        
                        cellAboveBelowBreakID = parseInt(droppableCellID.substring(droppableCellID.indexOf("_") + 1));
                        
                        cellAboveBreakID = cellAboveBelowBreakID - 1; 
                        cellAboveBreakID = droppableCellID.substring(droppableCellID.indexOf("z") + 1, droppableCellID.indexOf("_"))+"_"+cellAboveBreakID;
                        
                        cellBelowBreakID = cellAboveBelowBreakID + 1; 
                        cellBelowBreakID = droppableCellID.substring(droppableCellID.indexOf("z") + 1, droppableCellID.indexOf("_"))+"_"+cellBelowBreakID;
                        
/////////////////////////////// First Break and Last Break///////////////////////////////////////////////////                        
                        if (FirstBreak === '1' && droppedRegistraitonId === '0') {
                            alert("Break is not allowed at the beginning of day!");
                            $("#" + dropBoxId).animate({
                                top: $("#initialPositionTop_" + droppedSubjectId).val(),
                                left: $("#initialPositionLeft_" + droppedSubjectId).val()
                            });
                        }
                        else if(LastBreak === parseInt($("#lastHour").val()) && droppedRegistraitonId === '0'){
                            alert("Break is not allowed at the end of day!");
                            $("#" + dropBoxId).animate({
                                top: $("#initialPositionTop_" + droppedSubjectId).val(),
                                left: $("#initialPositionLeft_" + droppedSubjectId).val()
                            });
                        }
/////////////////////////////// First Break and Last Break///////////////////////////////////////////////////



                        
/////////////////////////////// Above and Below Break ///////////////////////////////////////////////////                        
                        else if(parseInt($("#"+cellAboveBreakID+"_text").val()) === 0 && droppedRegistraitonId === '0'){
                            alert("It it not valid to allocate two BREAKS consecutively! Please check ABOVE");
                            $("#" + dropBoxId).animate({
                                top: $("#initialPositionTop_" + droppedSubjectId).val(),
                                left: $("#initialPositionLeft_" + droppedSubjectId).val()
                            });
                        }
                        else if(parseInt($("#"+cellBelowBreakID+"_text").val()) === 0 && droppedRegistraitonId === '0'){
                            alert("It it not valid to allocate two BREAKS consecutively! Please check BELOW");
                            $("#" + dropBoxId).animate({
                                top: $("#initialPositionTop_" + droppedSubjectId).val(),
                                left: $("#initialPositionLeft_" + droppedSubjectId).val()
                            });
                        }
/////////////////////////////// Above and Below Break ///////////////////////////////////////////////////                        



                        else if ($("#" + $(this).attr('id') + "_text").val() === "") {
                            if (droppedRegistraitonId === '0') {
                                $("#" + dropBoxId).animate({left: dropppableBoxLeft + 2, top: dropppableBoxTop + 2});
                                $("#" + $(this).attr('id') + "_text").val(droppedRegistraitonId);
                                $("#" + $(this).attr('id') + "_compare").val(dropBoxId);
                            }
                            else {
                                tempWorkload = parseInt($("#remain_workload_" + droppedRegistraitonId).val());
                                tempWorkload = tempWorkload - 1;
                                if (tempWorkload < 0) {
                                    $("#label_" + droppedRegistraitonId).addClass("alertWorkload");
                                }
                                $("#remain_workload_" + droppedRegistraitonId).val(tempWorkload);
                                $("#label_" + droppedRegistraitonId).html(tempWorkload);

                                $("#" + dropBoxId).animate({left: dropppableBoxLeft + 2, top: dropppableBoxTop + 2});
                                $("#" + $(this).attr('id') + "_text").val(droppedRegistration_SubjectId);
                                $("#" + $(this).attr('id') + "_compare").val(dropBoxId);
                            }
                        }
                        else {
                            $("#" + dropBoxId).animate({
                                top: $("#initialPositionTop_" + droppedSubjectId).val(),
                                left: $("#initialPositionLeft_" + droppedSubjectId).val()
                            });
                        }
                    },
                    out: function(event, ui) {
                        if (dropBoxId === $("#" + $(this).attr('id') + "_compare").val()) {
                            $("#" + $(this).attr('id') + "_text").val("");
                            tempWorkload = parseInt($("#remain_workload_" + droppedRegistraitonId).val());
                            tempWorkload = tempWorkload + 1;
                            if (tempWorkload > 0) {
                                $("#label_" + droppedRegistraitonId).removeClass("alertWorkload");
                            }
                            $("#remain_workload_" + droppedRegistraitonId).val(tempWorkload);
                            $("#label_" + droppedRegistraitonId).html(tempWorkload);
                        }
                    }
                });
            });
        </script>

        <style>
            .droppableHover{
                background: rgba(81,205,246,0.4);
            }
            .disDiv
            {
                background-color: rgba(180,180,180,0.7);
                height: ${sizeCol}px;
                width: 100%;
            }
            .breakDiv{
                background-color: yellowgreen;
                border: 1px solid brown;
                width: 120px;
                height: 40px
            }
            .teacherDiv
            {
                background-color: #05a2d0;
                border: 1px solid brown;
                width: 140px;
                height: 40px;
            }
            .droppable
            {
                height: ${sizeCol}px;
                width: 100%;
            }
            @font-face
            {
                font-family: Bebas Neue;
                src: url('../css/fonts/BebasNeue-webfont.ttf');
            }

            #panelLabel{
                white-space: nowrap;
                font-family: 'Bebas Neue';
                text-transform: uppercase;
                font-weight: normal;
                color: white;
                font-size: 20px;
                font-style: normal;
                text-shadow: 0 0 1px rgba(0,0,0,0.01);
                text-decoration: none;
                text-align: center;
            }
            .alertWorkload{
                color:red; 
                font-weight: 900;
            }

        </style>
    </head>
    <body style="background-color: #F1F4F9" onload="middleDiv()">
        <div>
            <c:import url="header.jsp"/>
            <c:import url="navMenu.jsp"/>
        </div>
        <div id="middleDiv" class="container" style="background-color: white; overflow: auto;">
            <div id="timeTableDiv">
                <form>
                    <table style="border: 1px solid black; width: 80%; margin-top: 10px">
                        
<!------------------------------------------Constraint------------------------------------------------------------>
                        <input type="hidden" id="lastHour" value="${track}">
                        
                        
                        
                        
                        
<!----------------------------------------------Constraint------------------------------------------------------>
                        
                        <tr style="border: 1px solid black; height: 25px;">
                            <th style="text-align: center">Monday</th>
                            <th style="text-align: center">Tuesday</th>
                            <th style="text-align: center">Wednesday</th>
                            <th style="text-align: center">Thursday</th>
                            <th style="text-align: center">Friday</th>
                            <th style="text-align: center">Saturday</th>
                            <th style="text-align: center">Sunday</th>
                        </tr>
                        <c:forEach var="totalClass" items="${totalClass}" varStatus="count">
                            <tr style="width: 100%; border: 1px solid black; height: ${sizeCol}px">
                                <td style="border-right: 1px solid black; width: 14.28%">
                                    <c:choose>
                                        <c:when test="${Monday eq 'Monday'}">
                                            <div  class="droppable" id="Monday_${count.count}"></div>
                                            <input type="hidden" id="Monday_${count.count}_text" value="">
                                            <input type="hidden" id="Monday_${count.count}_compare" value="">
                                        </c:when>
                                        <c:otherwise>
                                            <div  id="Monday_${count.count}" class="disDiv"></div> 
                                        </c:otherwise>
                                    </c:choose>                              
                                </td>
                                <td style="border-right: 1px solid black; width: 14.28%">
                                    <c:choose>
                                        <c:when test="${Tuesday eq 'Tuesday'}">
                                            <div class="droppable" id="Tuesday_${count.count}"></div>   
                                            <input type="hidden" id="Tuesday_${count.count}_text" value="">
                                            <input type="hidden" id="Tuesday_${count.count}_compare" value="">
                                        </c:when>
                                        <c:otherwise>
                                            <div  id="Tuesday_${count.count}" class="disDiv" ></div> 
                                        </c:otherwise>
                                    </c:choose> 
                                </td>
                                <td style="border-right: 1px solid black; width: 14.28%">
                                    <c:choose>
                                        <c:when test="${Wednesday eq 'Wednesday'}">
                                            <div  class="droppable" id="Wednesday_${count.count}"></div>   
                                            <input type="hidden" id="Wednesday_${count.count}_text" value="">
                                            <input type="hidden" id="Wednesday_${count.count}_compare" value="">
                                        </c:when>
                                        <c:otherwise>
                                            <div  id="Wednesday_${count.count}" class="disDiv" ></div> 
                                        </c:otherwise>
                                    </c:choose> 
                                </td>
                                <td style="border-right: 1px solid black; width: 14.28%">
                                    <c:choose>
                                        <c:when test="${Thursday eq 'Thursday'}">
                                            <div  class="droppable" id="Thursday_${count.count}"></div>   
                                            <input type="hidden" id="Thursday_${count.count}_text" value="">
                                            <input type="hidden" id="Thursday_${count.count}_compare" value="">
                                        </c:when>
                                        <c:otherwise>
                                            <div  id="Thursday_${count.count}" class="disDiv" ></div> 
                                        </c:otherwise>
                                    </c:choose> 
                                </td>
                                <td style="border-right: 1px solid black; width: 14.28%">
                                    <c:choose>
                                        <c:when test="${Friday eq 'Friday'}">
                                            <div  class="droppable" id="Friday_${count.count}"></div>   
                                            <input type="hidden" id="Friday_${count.count}_text" value="">
                                            <input type="hidden" id="Friday_${count.count}_compare" value="">
                                        </c:when>
                                        <c:otherwise>
                                            <div  id="Friday_${count.count}" class="disDiv" ></div> 
                                        </c:otherwise>
                                    </c:choose> 
                                </td>
                                <td style="border-right: 1px solid black; width: 14.28%">
                                    <c:choose>
                                        <c:when test="${Saturday eq 'Saturday'}">
                                            <div  class="droppable" id="Saturday_${count.count}"></div>   
                                            <input type="hidden" id="Saturday_${count.count}_text" value="">
                                            <input type="hidden" id="Saturday_${count.count}_compare" value="">
                                        </c:when>
                                        <c:otherwise>
                                            <div  id="Saturday_${count.count}" class="disDiv" ></div> 
                                        </c:otherwise>
                                    </c:choose> 
                                </td>
                                <td style="width: 14.28%">
                                    <c:choose>
                                        <c:when test="${Sunday eq 'Sunday'}">
                                            <div  class="droppable" id="Sunday_${count.count}"></div>   
                                            <input type="hidden" id="Sunday_${count.count}_text" value="">
                                            <input type="hidden" id="Sunday_${count.count}_compare" value="">
                                        </c:when>
                                        <c:otherwise>
                                            <div  id="Sunday_${count.count}" class="disDiv" ></div> 
                                        </c:otherwise>
                                    </c:choose> 
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </form>
            </div>
            <div id="teacherSubjectDiv">
                <c:forEach var="allocatedFacultyList" items="${allocatedFacultyList}" varStatus="count">
                    <c:forEach var="repeatSubject" begin="1" end="${allocatedFacultyList.credit}" varStatus="subjectCount">
                        <c:choose>
                            <c:when test="${count.count eq 1}">
                                <div class="teacherDiv" id="${allocatedFacultyList.registration_id}_${allocatedFacultyList.subject_id}_${subjectCount.count}" style="position:absolute;left: 150px ; bottom: 25px; text-align: center; cursor: pointer" title="${allocatedFacultyList.fName} ${allocatedFacultyList.lName}">
                                    ${allocatedFacultyList.fName}_
                                    <lable id="${allocatedFacultyList.fName}">${allocatedFacultyList.workload}</lable>
                                    <br>
                                    ${allocatedFacultyList.subject_name}_
                                    <lable id="${allocatedFacultyList.subject_name}">${allocatedFacultyList.credit}</lable>
                                    <input type="hidden" id="check_${allocatedFacultyList.registration_id}_${allocatedFacultyList.subject_id}_${subjectCount.count}" value="">
                                </div>
                            </c:when>
                            <c:when test="${allocatedFacultyList.credit eq dayTrackValue}">
                                <div class="breakDiv" id="${allocatedFacultyList.registration_id}_${allocatedFacultyList.subject_id}_${subjectCount.count}" style="position:absolute;left: ${(count.count) * 123 + 27}px  ; bottom: 25px; text-align: center; cursor: pointer">
                                    ${allocatedFacultyList.fName}
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="teacherDiv" id="${allocatedFacultyList.registration_id}_${allocatedFacultyList.subject_id}_${subjectCount.count}" style="position:absolute;left: ${(count.count) * 123 + 27}px  ; bottom: 25px; text-align: center; cursor: pointer" title="${allocatedFacultyList.fName} ${allocatedFacultyList.lName}">
                                    ${allocatedFacultyList.fName}_
                                    <lable id="${allocatedFacultyList.fName}">${allocatedFacultyList.workload}</lable>
                                    <br>
                                    ${allocatedFacultyList.subject_name}_
                                    <lable id="${allocatedFacultyList.subject_name}">${allocatedFacultyList.credit}</lable>
                                    <input type="hidden" id="check_${allocatedFacultyList.registration_id}_${allocatedFacultyList.subject_id}_${subjectCount.count}" value="">
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
<!------------------------------------------Workload------------------------------------------------------------>                    
                    <input type="hidden" id="total_workload_${allocatedFacultyList.registration_id}" value="${allocatedFacultyList.workload}">
                    <input type="hidden" id="remain_workload_${allocatedFacultyList.registration_id}" value="${allocatedFacultyList.workload}">
<!------------------------------------------Workload------------------------------------------------------------>


<!------------------------------------------Position------------------------------------------------------------>
                    <input type="hidden" id="initialPositionLeft_${allocatedFacultyList.subject_id}" value="empty">
                    <input type="hidden" id="initialPositionTop_${allocatedFacultyList.subject_id}" value="empty">
<!------------------------------------------Position------------------------------------------------------------>
                </c:forEach>
            </div>
            <div id="detailPanelDiv" class="panel panel-primary" style="position:absolute; right:170px; top:110px; width: 13%; border: 1px solid black">
                <p id="panelLabel" class="panel-heading">Workload</p>
                <table style="width: 100%" class="table table-striped">
                    <tr>
                        <th style="text-align: center" ><u>Name</u></th>
                    <th style="text-align: center"><u>Remain</u></th>
                    </tr>
                    <c:forEach var="allocatedFacultyList" items="${allocatedFacultyList}">
                        <c:choose>
                            <c:when test="${allocatedFacultyList.credit eq dayTrackValue}"></c:when>
                            <c:otherwise>
                                <tr>
                                    <td style="text-align: center"><label for="nameFaculty">${allocatedFacultyList.fName}</label></td>
                                    <td style="text-align: center"><label id="label_${allocatedFacultyList.registration_id}">${allocatedFacultyList.workload}</label></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div>
            <c:import url="footer.jsp"></c:import>
        </div>
    </body>
</html>
