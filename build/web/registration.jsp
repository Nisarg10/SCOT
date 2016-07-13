<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" type="text/css" href="../css/containerCss.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.4.custom.css"/>

        <script src="/jQuery/jquery-1.11.0.js"></script>
        <script src="../jQuery/jquery-1.11.0.js"></script>


        <link rel="stylesheet" type="text/css" href="css/fv.css">
        <script src="jQuery/jquery-1.11.0.js"></script>
        <script src="jQuery/multifield.js"></script>
        <script src="jQuery/validator.js"></script>

        <link rel="stylesheet" type="text/css" href="../css/fv.css">
        <script src="../jQuery/jquery-1.11.0.js"></script>
        <script src="../jQuery/multifield.js"></script>
        <script src="../jQuery/validator.js"></script>

        <script>
            $(document).ready(function() {
                $("#secondStep").hide();

                $("#firstButton").click(function() {
                    $("#firstStep").slideUp();
                    $("#secondStep").slideDown();
                });
                $("#previousButton").click(function() {
                    $("#secondStep").slideUp();
                    $("#firstStep").slideDown();
                });
            });

        </script>
        <script>
            function middleDiv() {
                var heightDiv = (document.documentElement.clientHeight) - 120 + "px";
                document.getElementById('middleDiv').style.height = heightDiv;
            }
        </script>
        <style>
            @font-face
            {
                font-family: Bebas Neue;
                src: url('../css/fonts/BebasNeue-webfont.ttf');
            }

            #headerDetail{
                white-space: nowrap;
                font-family: 'Bebas Neue';
                text-transform: uppercase;
                font-weight: normal;
                color: white;
                font-size: 40px;
                font-style: normal;
                text-shadow: 0 0 1px rgba(0,0,0,0.01);
                text-decoration: none;
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
            .labelDetailGender{
                padding-top: 10px;
            }
        </style>
    </head>
    <body style="background-color: #F1F4F9; overflow: hidden" onload="middleDiv()">
        <div>
            <c:import url="header.jsp"/>
            <div id="headerDetail" class="col-md-12" style="z-index: 10000; margin-top: -55px">
                <center>Registration Detail</center>
            </div>
        </div>

        <div id="middleDiv" class="container" style="background-color: white; overflow: auto;">


            <form class="formLabel" name="registrationUser" method="post" action="${pageContext.request.contextPath}/UserController/registration" novalidate>
                <div class="row" name="firstStep" id="firstStep">
                    <table class="col-md-offset-3" style="margin-top: 30px"> 
                        <tr>
                            <td align="right">
                                <label class="labelDetail">
                                    Enter Name
                                </label>
                            </td>
                            <td class="col-md-1"></td>
                            <td class="form-inline item" data-validate-length-range="6" data-validate-words="2">
                                <input data-validate-length-range="6" data-validate-words="2"  required="required" type="text" name="fname" id="fname" placeholder="First Name" class="form-control" style="width: 140px; text-align: center;" >
                                <input data-validate-length-range="6" data-validate-words="2"  required="required" type="text" name="mname" id="mname" placeholder="Middle Name" class="form-control" style="width: 140px; text-align: center;" >
                                <input data-validate-length-range="6" data-validate-words="2"  required="required" type="text" name="lname" id="lname" placeholder="Last Name" class="form-control" style="width: 140px; text-align: center;" >
                            </td>
                        </tr>
                        <tr style="height:20px;"></tr>
                        <tr>
                            <td align="right">
                                <label class="labelDetail">
                                    Enter Email Address
                                </label>
                            </td>
                            <td class="col-md-1"></td>
                            <td class="item">
                                <input required="required" type="email" name="email" id="email" class="form-control" placeholder="abc@gmail.com" style="text-align: center;width: 423px;"> 
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
                            <td class="form-inline item">
                                <input data-validate-length="6,8" required='required' type="password" name="password" id="password" class="form-control" placeholder="Enter Password" style="text-align: center; width: 211px">
                                <input data-validate-linked='password' required='required' type="password" name="passwordConfirm" id="passwordConfirm" class="form-control" placeholder="Confirm Password" style="text-align: center; width: 211px"> 
                            </td>
                        </tr>
                        <tr style="height:20px;"></tr>
                        <tr>
                            <td style="text-align: right">
                                <label class="labelDetail">
                                    Gender
                                </label>
                            </td>
                            <td class="col-md-1"></td>
                            <td class="form-inline">
                                <table style="position: relative; width: 100%">
                                    <tr>
                                        <td>
                                            <input type="radio" name="gender" id="gender" value="m" class="form-control" style="text-align: center;" checked></td>
                                        <td><label class="labelDetail">
                                                Male
                                            </label></td>

                                        <td> <input type="radio" name="gender" id="gender" value="f" class="form-control" style="text-align: center"></td>
                                        <td><label class="labelDetail">
                                                Female
                                            </label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:20px;"></tr>
                        <tr>
                            <td align="right">
                                <label class="labelDetail">
                                    Enter Date Of Birth
                                </label>
                            </td>
                            <td class="col-md-1"></td>
                            <td class="form-inline item">
                                <input required="required" type="date" name="dob" size="30" placeholder="Select Date of Birth" class="form-control" style="width: 200px;"/>
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
                            <td class="item">
                                <select name="userTypeId" class="required form-control">
                                    <option value="">-- none --</option>
                                    <c:forEach var="tableDropDownUserType" items="${tableDropDownUserType}"> 
                                        <option value="${tableDropDownUserType.user_type_id}">${tableDropDownUserType.user_type}</option>   
                                    </c:forEach>
                                </select> 
                            </td>
                        </tr>
                        <tr style="height:20px;"></tr>
                        <tr>
                            <td colspan="2">
                            </td>
                            <td colspan="2">
                                <input id="firstButton" type="button" class="btn btn-primary" value="Next" style="width: 300px;">
                            </td>
                            
                        </tr>
                    </table>
                </div>

                <div class="row" name="secondStep" id="secondStep">
                    <table border="0" class="col-md-offset-2">
                        <tr>
                            <td align="right">
                                <label class="labelDetail">
                                    Contact Number
                                </label>
                            </td>
                            <td class="col-md-1"></td>
                            <td class="item">
                                <input type="tel" name="mobileNumber" id="mobileNumber" data-validate-length-range="10,10" required='required' class="tel form-control" placeholder="Enter Contact Number i.e (9** *** ****)" style="text-align: center;width: 423px;"> 
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
                            <td>
                                <textarea name="address" rows="3" cols="45" class="form-control" style="width: 423px;"></textarea>
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
                                <table style="position: relative; width: auto;">
                                    <tr class="">
                                        <td class="item">
                                            <input required="required" type="text" name="city" id="city" class="form-control" style="text-align: center; width:120px" placeholder="Enter City">
                                            <input required="required" type="text" name="state" id="state" class="form-control" style="text-align: center; width:120px" placeholder="Enter State">
                                            <select name="country" class="required form-control" style="width: 170px">
                                                <option value="">--- none ---</option>
                                                <c:forEach var="tableDropDownCountry" items="${tableDropDownCountry}"> 
                                                    <option value="${tableDropDownCountry.country_id}">${tableDropDownCountry.country_name}</option>   
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
                                <table style="position: relative; width: fit-content">
                                    <tr class="item form-inline">
                                        <td> 
                                            <select name="institute" class="required form-control" style="">
                                                <option value="">--- None ---</option>
                                                <c:forEach var="tableDropDownInstituteDetail" items="${tableDropDownInstituteDetail}"> 
                                                    <option value="${tableDropDownInstituteDetail.institute_id}">${tableDropDownInstituteDetail.institute_name}</option>   
                                                </c:forEach>
                                            </select> 
                                        </td>
                                        <td style="padding-left: 5px"> 
                                            <select name="department" class="required form-control" style="">
                                                <option value="">--- None ---</option>
                                                <c:forEach var="tableDropDownDepartmentDetail" items="${tableDropDownDepartmentDetail}"> 
                                                    <option value="${tableDropDownDepartmentDetail.department_id}">${tableDropDownDepartmentDetail.department_name}</option>   
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
                            <td class="item">
                                <input required="required" type="text" name="degree" id="degree" class="form-control" placeholder="Enter your acdemic details i.e. B.Tech, PHd, etc." style="text-align: center;width: 423px;"> 
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
                            <td class="item">
                                <textarea required="required" style="width: 423px;" name="professional_detail" rows="3" cols="45" class="form-control" placeholder="Enter details such as your acedemic background, institutes or organizations you have worked with, work-experience, current on-going projects or reasearch if any"></textarea>
                            </td>
                        </tr>

                        <tr style="height:20px;"></tr>
                        <tr>
                            <td>
                                <input type="button" class="btn btn-primary " value="Previous" style="width: 250px" id="previousButton">
                            </td>
                            <td colspan="2">
                                <input type="submit" class="btn btn-primary col-md-offset-4 " value="SUBMIT" style="width: 250px">
                            </td>

                        </tr>
                    </table>
                </div>
            </form>
            <script>
                // initialize the validator function
                validator.message['date'] = 'not a real date';

                // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
                $('form')
                        .on('blur', 'input[required], input.optional, select.required', validator.checkField)
                        .on('change', 'select.required', validator.checkField)
                        .on('keypress', 'input[required][pattern]', validator.keypress);


                $('.multi.required')
                        .on('keyup blur', 'input', function() {
                            validator.checkField.apply($(this).siblings().last()[0]);
                        });

                // bind the validation to the form submit event
                //$('#send').click('submit');//.prop('disabled', true);

                $('form').submit(function(e) {
                    e.preventDefault();
                    var submit = true;
                    // evaluate the form using generic validaing
                    if (!validator.checkAll($(this))) {
                        submit = false;
                    }

                    if (submit)
                        this.submit();
                    return false;
                });

                /* FOR DEMO ONLY */
                $('#vfields').change(function() {
                    $('form').toggleClass('mode2');
                }).prop('checked', false);

                $('#alerts').change(function() {
                    validator.defaults.alerts = (this.checked) ? false : true;
                    if (this.checked)
                        $('form .alert').remove();
                }).prop('checked', false);
            </script>



        </div>
        <div>
            <c:import url="footer.jsp"/>
        </div>
    </body>
</html>