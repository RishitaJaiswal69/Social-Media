<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>## Post Dashboard. ##</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <style>
            body{
                background-color:rgb(133, 6, 252);
            }
        </style>
    </head>
       
    <body>

        <div class="modal" id="post_details_modal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content p-4">
                    <div class="modal-header">
                        <h3 class="modal-title">Create Post</h3>
                        <button class="btn btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form action="post.do" method="post" id="post_details_form" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="name" class="form-label">Title of content</label>
                                <input type="text" name="mainHeading" id="mainHeading" autocomplete="off"
                                    class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="details" class="form-label">Textarea</label>
                                <textarea name="textarea" rows="5" id="textarea" class="form-control"
                                    placeholder="maximum 5000 character at a time"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="file" class="form-label">File upload</label>
                                <input type="file" accept="application/pdf" name="pic" id="pic" class="form-control">
                                <h6>one file at a time can upload</h6>
                            </div>
                            <input type="submit" class="btn btn-primary mt-3" value="Save Details">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="colcontainer-fluid bg-light">
                    <nav class="navbar navbar-expand-lg">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <a class="btn-lg form-control fs-5" style="background-color:rgb(232, 229, 236);margin-right:10px;color:rgb(23, 23, 23);text-align : center;text-decoration-line: none;" href="index.jsp">Home</a>
                                    <a class="btn-lg form-control fs-5"  style="background-color:rgb(232, 229, 236);color:rgb(23, 23, 23);text-align : center;text-decoration-line: none;" href="profile_dashboard.jsp">Back</a>
                                   
                                </ul>
                        </div>
                       <h4>Createpost</h4> 
                    </nav>
                
            </div>
         </div>
            
           
        
            <div class="row">
                <div class="col">
                    <div class="tab-content">
                        <div class="tab-pane show fade active" id="post_pane">
                            <div class="text-end mt-4 pe-5">
                                <button class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#post_details_modal">&plus; Add Post</button>

                            </div>

                            <div class="row justify-content-around mt-3">
                                <c:choose>
                                    <c:when test="${not empty posts}">
                                <c:forEach var="post" items="${posts}" varStatus="recs">
                                    <div class="col-lg-6" style="margin-left: 20px;">
                                        <div class="card mb-4" id="${post.postId}">
                                            <div class="card-body border">
                                                <div class="row">
                                                    <div class="col-sm-11">
                                                        <p class="mb-0">Title</p>
                                                        <a href="edit_post.do?postId=${post.postId}"><img
                                                                src="static/media/image/edit.png"
                                                                style="margin-left: 310px;" width="20px"></a>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a href="delete_post.do?postId=${post.postId}" onclick="myfunction()"><img
                                                                src="static/media/image/delete.png" width="20px"></a>
                                                        <c:choose>
                                                            <c:when test="${not empty post.mainHeading}">
                                                                <p class="mb-0">${post.mainHeading}</p>
                                                            </c:when>
                                                            <c:otherwise></c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <c:choose>
                                                            <c:when test="${not empty post.textarea}">
                                                                <p class="mb-0">${post.textarea}</p>
                                                            </c:when>
                                                            <c:otherwise></c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12" style="margin-left:15px">
                                                        <c:choose>
                                                            <c:when test="${post.mediaType.mediaTypeId == 1}">
                                                                <audio controls>
                                                                    <source src="show_post_pic.do?pic=${post.pic}"
                                                                        type="audio/mp3" width="200px" height="300vh">
                                                                </audio>
                                                            </c:when>
                                                            <c:when test="${post.mediaType.mediaTypeId ==2}">
                                                                <video width="465px" height="240" controls>
                                                                    <source src="show_post_pic.do?pic=${post.pic}"
                                                                        type="video/mp4" width="200px" >
                                                                </video>
                                                            </c:when>
                                                            <c:when
                                                                test="${post.mediaType.mediaTypeId ==3 || post.mediaType.mediaTypeId ==4}">
                                                                <img src="show_post_pic.do?pic=${post.pic}"
                                                                    width="480px" height="300vh">
                                                            </c:when>
                                                            <c:otherwise></c:otherwise>
                                                        </c:choose>
                                                        <span>${post.creationTime}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise></c:otherwise>
                          </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

         <script>
            function myfunction(){
                alert("Are you sure to want to delete");
            }
         </script>
    </body>

    </html>