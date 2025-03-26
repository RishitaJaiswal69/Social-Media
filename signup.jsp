<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
        body {
            background-color: rgb(133, 6, 252);
            width: 100%;
            height: 100%;

        }

        .err_msg {
            color: rgb(236, 69, 69);
            font-size: 12px;
            display: none;
        }

        #btn {
            color: white;
            font-weight: bold;
            padding: 14px 25px;
            font-size: 15px;
            border-radius: 11px;
        }

        #error_message {
                margin: 20px auto;
                width: 50%;
                border: 2px solid red;
                background-color: rgb(235, 217, 217);
                color: red;
                padding: 10px;
                text-align: center;
            }

            form {
                border: 1px solid black;
                border-style: none;
                width: 750px;
                height: 90vh;
                margin: auto;
                margin-top: 30px;
                background-color: rgb(237, 235, 238);
            }
        </style>
</head>
<body>
    <form action="signup.do" method="post">
        <c:if test="${not empty err_msg}">
            <div id="error_message">
                ${err_msg}
            </div>
        </c:if>

        <h1 style="margin-left:270px;">Registration</h1>
        <div class="row">
            <div class="col-5" style="margin-left: 40px;">
                <div class="mb-3">
                    <label for="name" class="form-label fs-5 fw-semibold">Name<sup class="text-danger">*</sup></label>
                    <input type="text" name="uname" id="uname" class="form-control fs-5" autocomplete="off">
                    <!--img src="static/media/image/person.png" height="20px"><br>
                    <small class="err_msg" id="uname_err_msg">Enter valid Name...</small-->
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label fs-5 fw-semibold">Email<sup class="text-danger">*</sup></label>
                    <input type="text" name="email" id="email" class="form-control fs-5" autocomplete="off">
                    <!--img src="static/media/image/mail.png" height="20px"><br>
                    <small class="err_msg" id="email_err_msg">Enter valid Email...</small-->
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label fs-5 fw-semibold">Password<sup class="text-danger">*</sup></label>
                    <input type="password" name="password" class="form-control fs-5" id="password">
                    <!--img src="static/media/image/lock.png" width="20" align="bottom" id="eye"> <br>
                    <small class="err_msg" id="password_err_msg">Enter valid Password...</small-->
                </div>
                <div>
                    <div class="g-recaptcha" data-sitekey="6Lck62giAAAAANgdVOV21cqh9HDi-i2-pYSJHbBi"></div>
                </div><br> 
                <div class="mb-3" style="margin-top: 15px;">
                    <input type="submit" class="btn-lg form-control fs-5" style="background-color:rgb(133,6,252);color:aliceblue;" value="Register" id="btn"></input><br>
                   
                </div>
                
            </div>
            <div class="col-5">
                <div class="mb-3">
                    <label for="name" class="form-label fs-5 fw-semibold">Mobile<sup class="text-danger">*</sup></label>
                        <input type="number" name="phone" class="form-control fs-5" id="phone" autocomplete="off">
                        <!--img src="static/media/image/phone.png" height="20px"><br>
                        <small class="err_msg" id="phone_err_msg">Enter valid Phone...</small-->
                </div>
                
                <div class="mb-3">
                    <label for="city_id" class="form-label fs-5 fw-semibold">City<sup class="text-danger">*</sup></label>
                    <select name="city_id" id="city_id" class="form-select fs-5">
                        <c:forEach var="city" items="${cities}">
                            <option value="0">Select the city</option>
                            <option value="${city.cityId}">${city.name}(${city.state.name})</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label fs-5 fw-semibold">User type<sup class="text-danger">*</sup></label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="1">
                        <label class="form-check-label fs-5 fw-semibold" for="flexRadioDefault1">General User</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2"  value="2">
                        <label class="form-check-label fs-5 fw-semibold" for="flexRadioDefault2">Admin User</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label fs-5 fw-semibold">Confirm Password<sup class="text-danger">*</sup></label>
                    <input type="password" name="password" class="form-control fs-5" id="password">

                </div>
                <div class="mb-3">
                    <a href="signin.jsp" class="btn-lg form-control fs-5" style="background-color:rgb(133,6,252);color:aliceblue;text-align: center;text-decoration-line: none;"id="btn">Login</a>

                </div>
            </div>
        </div>
    
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>

</body>
</html>