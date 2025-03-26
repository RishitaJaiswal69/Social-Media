<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>## Profile Details Form ##</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

        <style>
            .nav_img {
                max-width: 100%;
                height: auto;
            }

            body {
                background-color: rgb(133, 6, 252);
            }
        </style>
    </head>

    <body>
        <!--------------------------------------------------------------------------------->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Profile Logo</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="logo_upload.do" class="dropzone" id="profile_logo"></form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="upload_btn">Upload</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModa2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Background Logo</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="logo_upload.do" class="dropzone" id="background_logo"></form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="upload_btn1">Upload</button>
                    </div>
                </div>
            </div>
        </div>
        <!--------------------------------------------------------------------------------->

        <div class="container">
            <div class="row">
                <div class="col">
                    <%@ include file="header.jsp" %>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-6 mt-5 border border-secondary rounded p-5 pb-4"
                    style="background-color:  rgb(246, 242, 245);">
                    <h3 class="text-secondary">
                        Pic section
                    </h3>
                    <small class="text-secondary">Please submit details before you login</small>
                    <form action="profile.do" method="get" class="mt-4" id="myform">
                        <input type="hidden" name="par" value="${param.par}">
                        <div class="mb-4">
                            <img src="static/media/image/profilepic.png" alt="error" height="50px">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                                Upload Profile pic logo
                            </button>
                            <button type="button" class="btn btn-primary btn-lg" id="btn"
                                onclick="myFunction()">Save</button>
                            <br>
                            <img src="static/media/image/profilepic.png" alt="error" height="50px">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModa2">
                                Upload Background pic logo
                            </button>
                            <button type="button" class="btn btn-primary btn-lg" id="btn"
                                onclick="myFunction()">Save</button>
                            <br><br>
                            
                                <c:choose>
                                    <c:when test="${param.par == 'update'}">
                                        <div>
                                            <button type="submit" class="btn btn-primary btn-lg" id="btn">Update
                                                Details</button>
                                        </div>
                                    </c:when>
                                    <c:when test="${param.par != 'update'}">
                                        <div>
                                            <button type="submit" class="btn btn-primary btn-lg"  id="btn">Submit</button>
                                        </div>
                                    </c:when>
                                </c:choose>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>

        <script>

            let success_tick = document.querySelector('#success_tick');
            let success_tick1 = document.querySelector('#success_tick1');
            Dropzone.autoDiscover = false;

            let dropzone = new Dropzone('#profile_logo', {
                maxFiles: 1,
                maxFilesize: 1,
                acceptedFiles: '.png,.jpg',
                autoProcessQueue: false,
                paramName: 'profilepic'
            });

            const upload_btn = document.querySelector('#upload_btn');
            upload_btn.addEventListener('click', () => {
                dropzone.processQueue();
            });

            dropzone.on('complete', () => {
                success_tick.classList.replace('d-none', 'd-inline');
            });

            let dropzone1 = new Dropzone('#background_logo', {
                maxFiles: 1,
                maxFilesize: 1,
                acceptedFiles: '.png,.jpg',
                autoProcessQueue: false,
                paramName: 'backgroundpic'
            });

            dropzone1.on('complete', () => {
                success_tick.classList.replace('d-none', 'd-inline');
            });

            const upload_btn1 = document.querySelector('#upload_btn1');
            upload_btn1.addEventListener('click', () => {
                dropzone1.processQueue();
            });


            function myFunction() {
                alert("Are you sure to save this details");
            }


        </script>
    </body>

    </html>