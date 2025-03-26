<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Education</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        
        <style>
         body{
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
                <div class="col-6 mt-5 border border-secondary rounded p-5 pb-4" style="background-color:  rgb(246, 242, 245);">
                    <h3 class="text-secondary">
                        Education Details Form
                    </h3>
                    <small class="text-secondary">Please submit details before you login</small>
                    <form action="education.do" method="post" class="mt-4">
                        <input type="hidden" name="par" value="${param.par}">
                        <div class="mb-4">
                            <label for="institute_id" class="form-label fs-5 fw-semibold text-primary">Institutes<sup
                                    class="text-danger">*</sup></label>
                            <select name="institute_id" id="institute_id" class="form-select fs-5">
                                <c:choose>
                                    <c:when test="${not empty education.institute.instituteId}">
                                        <option value="${institute.instituteId}">${education.institute.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">select the institutes</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="institute" items="${institutes}">
                                    <option value="${institute.instituteId}">${institute.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="course_id" class="form-label fs-5 fw-semibold text-primary">Courses<sup
                                    class="text-danger">*</sup></label>
                            <select name="course_id" id="course_id" class="form-select fs-5">
                                <c:choose>
                                    <c:when test="${not empty education.course.courseId}">
                                        <option value="${education.course.courseId}">${education.course.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">select the courses</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="course" items="${courses}">
                                    <option value="${course.courseId}">${course.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="city_id" class="form-label fs-5 fw-semibold text-primary">City<sup
                                    class="text-danger">*</sup></label>
                            <select name="city_id" id="city_id" class="form-select fs-5">
                                <c:choose>
                                    <c:when test="${not empty education.city.cityId}">
                                        <option value="${education.city.cityId}">${education.city.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">select the city</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="city" items="${cities}">
                                    <option value="${city.cityId}">${city.name}(${city.state.name})</option>
                                </c:forEach>
                            </select><br>
                        </div>
                        <div class="mb-4">
                            <label for="established_on" class="form-label fs-5 fw-semibold text-primary">Batch<sup
                                    class="text-danger">*</sup></label>
                            <input type="text" class="form-control" name="batch" value="${education.batch}">
                        </div>
                        <c:choose>
                        <c:when test="${param.par == 'update'}">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg" id="btn">Update Details</button>
                            </div>
                        </c:when>
                        <c:when test="${param.par != 'update'}">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg" id="btn">Save Details</button>
                            </div>
                        </c:when>
                    </c:choose>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>
        </div>

    </html>
    </body>

    </html>