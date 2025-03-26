<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <style>
            body {
                background-color: rgb(133, 6, 252);
            }
        </style>
    </head>

    <body>

        <div class="container">
            <div class="row">
                <div class="col">
                    <%@ include file="header.jsp" %>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-10 mt-5 border border-secondary rounded p-5 pb-4"
                    style="background-color:  rgb(246, 242, 245);">
                    <h3 class="text-secondary" style="text-align: center;">
                        Profile Details Form<br>
                        <span class="text-secondary fs-6 text-muted">Please submit details before you login</span>
                    </h3>

                    <form action="personal_details_from.do?" id="myform" method="post" class="mt-4">
                        <input type="hidden" name="par" value="${param.par}">
                        <div class="mb-3">
                            <label for="uname" class="form-label fs-5 fw-semibold text-primary">UserName</label>
                            <input type="text" class="form-control fs-5" name="uname" id="uname"
                                value="${user.userName}">
                        </div>
                        <div class="mb-3">
                            <label for="about" class="form-label fs-5 fw-semibold text-primary">About Us<sup
                                    class="text-danger">*</sup></label>
                            <textarea name="about" id="about rows=" 7" col="80" class="form-control"
                                required>${user.about}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label fs-5 fw-semibold text-primary">Address<sup
                                    class="text-danger">*</sup></label>
                            <textarea name="address" id="about rows=" 7" col="80" class="form-control"
                                required>${user.address}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="profession" class="form-label fs-5 fw-semibold text-primary">Profession<sup
                                    class="text-danger">*</sup></label>
                            <textarea name="profession" id="about rows=" 7" col="80" class="form-control"
                                required>${user.profession}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="city_id" class="form-label fs-5 fw-semibold text-primary">City<sup
                                    class="text-danger">*</sup></label>
                            <select name="city_id" id="city_id" class="form-select fs-5">
                                <c:choose>
                                    <c:when test="${not empty user.city.cityId}">
                                        <option value="${user.city.cityId}">${user.city.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">Select the city</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="city" items="${cities}">
                                    <option value="${city.cityId}">${city.name}(${city.state.name})</option>
                                </c:forEach>
                            </select><br>
                        </div>
                        <div class="mb-3">
                            <label for="dob" class="form-label fs-5 fw-semibold text-primary">Birthday<sup
                                    class="text-danger">*</sup></label>
                            <input type="date" class="form-control fs-5" name="dob" id="dob" required
                                value="${user.dob}">
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label fs-5 fw-semibold text-primary">Choose your Gender:<sup
                                    class="text-danger">*</sup></label>
                            <br>
                            <c:choose>
                                <c:when test="${user.gender == 'f'}">
                                    <input type="radio" name="gender" checked class="form-check-input" value="f">
                                    <label for="gender">Female</label><br>
                                </c:when>
                                <c:otherwise>
                                    <input type="radio" name="gender" class="form-check-input" value="f">
                                    <label for="gender">Female</label><br>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${user.gender == 'm'}">
                                    <input type="radio" name="gender" checked class="form-check-input" value="m">
                                    <label for="gender">Male</label><br>
                                </c:when>
                                <c:otherwise>
                                    <input type="radio" name="gender" class="form-check-input" value="m">
                                    <label for="gender">Male</label><br>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${user.gender == 'o'}">
                                    <input type="radio" name="gender" checked class="form-check-input" value="o">
                                    <label for="gender">Other</label><br>
                                </c:when>
                                <c:otherwise>
                                    <input type="radio" name="gender" class="form-check-input" value="o">
                                    <label for="gender">Other</label><br>
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div class="mb-3">
                            <label for="dob"
                                class="form-label fs-5 fw-semibold text-primary">SocialMediaDetails(Optional)<sup
                                    class="text-danger">*</sup></label>
                            <br>
                            <div class="row">
                                <div class="col-6">
                                    <img src="static/media/image/GitHub-Logo.png" alt="error" height="50px">
                                    <input type="text" name="github" class="form-control fs-5" autocomplete="off"
                                        id="github" value="${user.github}"><br>

                                    <img src="static/media/image/ink.png" alt="error" height="50px">
                                    <input type="text" name="link" class="form-control fs-5" autocomplete="off"
                                        id="link" value="${user.linkedin}"><br>
                                    <button type="button" style="background-color:rgb(133,6,252);"
                                        class="btn btn-primary btn-lg" id="btn" onclick="myFunction()">Save</button>
                                    <br>
                                </div>
                                <div class="col-6">
                                    <img src="static/media/image/inst.png" alt="error" height="50px">
                                    <input type="text" name="inst" class="form-control fs-5
                                        autocomplete=" off" id="inst" value="${user.instagram}"><br>

                                    <img src="static/media/image/youtube.png" alt="error" height="50px">
                                    <input type="text" name="youtube" class="form-control fs-5" autocomplete="off"
                                        id="youtube" value="${user.youtube}">
                                    <br>

                                    <c:choose>
                                        <c:when test="${param.par == 'update'}">
                                            <div>
                                                <button type="submit" style="background-color:rgb(133,6,252);margin-left: 320px;"
                                                    class="btn btn-primary btn-lg" id="btn">Update</button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div>
                                                <button type="submit" style="background-color:rgb(133,6,252);margin-left: 320px;"
                                                    class="btn btn-primary btn-lg" id="btn">Submit</button>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>

        <script>
            function myFunction() {
                alert("Are you sure to save this details");
            }
        </script>

    </body>

    </html>