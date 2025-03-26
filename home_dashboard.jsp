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
                background-color:rgb(133, 6, 252);;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col">

                    <nav class="navbar navbar-expand-lg">
                        <div class="container-fluid bg-light">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <a class="navbar-brand fs-3 form-control"
                                    style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20);text-align: center;"
                                    href="#">Chatroom</a>

                            </ul>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <button type="button" class="btn-lg form-control"
                                        style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20);text-align: center;text-decoration-line:none;"><a
                                            href="index.jsp" style="text-decoration-line:none ;">Home</a></button>
                                    <button type="button" class="btn-lg form-control"
                                        style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20); text-align: center;text-decoration-line:none;"><a
                                            href="contact.do" style="text-decoration-line:none ;">Search</a></button>
                                    <button type="button" class="btn-lg form-control"
                                        style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20); text-align: center;text-decoration-line:none;"><a
                                            href="profile_dashboard.jsp"
                                            style="text-decoration-line:none ;">Profile(Dashboard)</a></button>

                                    <button type="button" class="form-control"
                                        style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20); text-align: center;"><a
                                            href="signin.jsp" style="text-decoration:none;">Login</a></button>
                                    <button type="button" class="form-control"
                                        style="background-color:rgb(243, 240, 245);color:rgb(19, 20, 20); text-align: center;"><a
                                            href="signout.do" style="text-decoration:none;">SignOut</a></button>

                                </ul>
                                <%@ include file="userLogo.jsp" %>

                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    
            <div class="row">
                
                    <c:forEach var="post" items="${posts}" varStatus="recs">
                        <div class="col-4 mt-2 mb-2" style="padding: auto;">
                        <div class="pt-4 ps-5" style="width: 27rem;">
                            <c:choose>
                                <c:when test="${post.mediaType.mediaTypeId == 1}">
                                    <audio width="350px" height="300vh" controls>
                                        <source src="show_post_pic.do?pic=${post.pic}&email=${post.user.email}"
                                            type="audio/mp3" >
                                    </audio>
                                </c:when>
                                <c:when test="${post.mediaType.mediaTypeId ==2}">
                                    <video width="350px" height="200" controls>
                                        <source src="show_post_pic.do?pic=${post.pic}&email=${post.user.email}"
                                            type="video/mp4" width="300px" height="200vh">
                                    </video>
                                </c:when>
                                <c:when test="${post.mediaType.mediaTypeId ==3 || post.mediaType.mediaTypeId ==4}">
                                    <img src="show_post_pic.do?pic=${post.pic}&email=${post.user.email}" width="350px"
                                        height="200vh">
                                </c:when> 
                                
                                <c:otherwise></c:otherwise>
                            </c:choose>
                            
                            
                            <div>
                                <img src="logo.do?pic=${post.user.profilePicPath}&email=${post.user.email}" width="30px"  class="rounded-circle"
                                    height="30px" alt="avatar">
                                    <c:choose>
                                        <c:when test="${not empty post.mainHeading}">
                                            <span class="text-light">${post.mainHeading}</span>
                                        </c:when>
                                        <c:otherwise>         </c:otherwise>
                                    </c:choose> 
                                <!--span class="text-primary">${post.user.userName}</span><br>
                                <span style="margin-left: 35px;">${post.user.email}</span-->
                            </div>
                        </div>
                     </div>
                    </c:forEach>
                
            </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


    </body>

    </html>