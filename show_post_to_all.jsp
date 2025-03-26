<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .fa {
                font-size: 30px;
                cursor: pointer;
                user-select: none;
            }

            .fa-thumbs-up:hover {
                color: darkblue;
            }

            .fa-thumbs-down:hover {
                color: darkblue;
            }

            .card {
                cursor: pointer;
            }

            body {
                background-color: rgb(133, 6, 252);
            }


            #aa {
                border: 0px solid;
                width: 600px;
                height: 400px;
            }

            #pic_profile {
                position: absolute;
                border-radius: 50%;
                z-index: 3;
                width: 90px;
                height: 90px;
            }
        </style>
    </head>

    <body>


        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <ol class="breadcrumb">
                    <li><a href="started.do" class="btn-lg form-control fs-5"
                            style="background-color:rgb(133,6,252);color:aliceblue;text-align: center;text-decoration-line: none;"
                            id="btn">Home</a>
                    </li>

                    <li><a href="contact.do" class="btn-lg form-control fs-5"
                            style="background-color:rgb(133,6,252);color:aliceblue;text-align:center;text-decoration-line: none;">Back</a>
                    </li>
                </ol>
            </div>
        </nav>

        <div class="container" id="aa"><br><br>
            <div class="row justify-content-center">
                <c:choose>
                    <c:when test="${empty posts}">
                        <h1 class="alert alert-primary" role="alert">No posts is posted here!</h1>
                    </c:when>
                    <c:otherwise>

                        <c:forEach var="post" items="${posts}" varStatus="recs">
                            <div class="col-lg-12 mb-5 rounded" style="margin-left: 20px;">

                                <div class="card mb-4" style="border:none" id="${post.postId}">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-2">
                                                <c:choose>
                                                    <c:when test="${not empty post}">
                                                        <a href="view_profile.do?user_id=${post.user.userId}">
                                                            <img src="logo.do?pic=${post.user.profilePicPath}&email=${post.user.email}"
                                                                alt="hugenerd" width="70px" id="pic_profile"></a>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <img src="static/media/image/download.png" alt="error!"
                                                            height="70px" id="pic_profile">
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>

                                            <div class="col-sm-6">
                                                <c:choose>
                                                    <c:when test="${not empty post}">
                                                        <span class="text-primary fs-5"
                                                            id="uname">${post.user.userName}</span><br>
                                                        <span class="text-dark" id="email">${post.user.email}</span>
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <c:choose>
                                                    <c:when test="${not empty post.mainHeading}">
                                                        <p class="mb-0 text-dark">${post.mainHeading}</p>

                                                    </c:when>
                                                    <c:otherwise></c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${not empty post.textarea}">
                                                        <p class="mb-0">${post.textarea}</p>
                                                    </c:when>
                                                    <c:otherwise></c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12" style="margin-left:30px">
                                                <c:choose>
                                                    <c:when test="${post.mediaType.mediaTypeId == 1}">
                                                        <audio controls>
                                                            <source
                                                                src="pic_post.do?pic=${post.pic}&userId=${param.user_id}"
                                                                type="audio/mp3" width="300px" height="300vh">

                                                        </audio>
                                                    </c:when>
                                                    <c:when test="${post.mediaType.mediaTypeId ==2}">
                                                        <video width="500px" height="240" controls>
                                                            <source
                                                                src="pic_post.do?pic=${post.pic}&userId=${param.user_id}"
                                                                type="video/mp4" width="200px" height="300vh">
                                                        </video>
                                                    </c:when>
                                                    <c:when
                                                        test="${post.mediaType.mediaTypeId ==3 || post.mediaType.mediaTypeId ==4}">
                                                        <img src="pic_post.do?pic=${post.pic}&userId=${param.user_id}"
                                                            width="500px" height="300vh">

                                                    </c:when>
                                                    <c:otherwise></c:otherwise>

                                                </c:choose>

                                            </div>
                                            <span>${post.mainHeading}</span>
                                            <span>${post.creationTime}</span>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-left: 30px;">
                                        <div class="col-sm-3">
                                            <button class="btn" id="${post.postId}" name="${post.postId}"
                                                style="background-color:white;border:none;"><i
                                                    class="fa fa-thumbs-up"></i></button>
                                            <span id="_${post.postId}">${post.likeCount}</span>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="comment.do?postId=${post.postId}&user_id=${param.user_id}"
                                                style="background-color:white;border:none;">
                                                <img src="static/media/image/comment.png" width="30px"></a>
                                            <span>${post.commentsCount}</span>
                                        </div>
                                        <div class="col-sm-3">
                                            <img src="static/media/image/share.png" class="share" width="30px">
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button"  class="btn btn-primary bg-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                             >Report</button>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
            </div>
        </div>
        </c:otherwise>
        </c:choose>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Report On post</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-3">
                                <select class="form-select form-select-lg mb-3" aria-label="Large select example">
                                    <option selected>select</option>
                                    <option value="1">Spam or misleading</option>
                                    <option value="2">Verbal abuse</option>
                                    <option value="3">Hateful or abusive content</option>
                                    <option value="4">Sexual content</option>
                                    <option value="5">Violent or repulsive content</option>
                                  </select>
                            </div>
                            <div class="mb-3">
                                <label for="message-text" class="col-form-label">Message:</label>
                                <textarea class="form-control" id="message-text"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Send message</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            let cards = document.querySelectorAll('.btn');


            cards.forEach((card) => {
                card.addEventListener('click', (e) => {
                    console.log(card.id);
                    console.log("like hello world");

                    let req = new XMLHttpRequest();

                    let url = 'like.do?post_id=' + card.id;
                    console.log("like");

                    req.open('GET', url, true);
                    req.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
                    req.addEventListener('readystatechange', () => {
                        if (req.readyState == 4 && req.status == 200) {
                            let resp = JSON.parse(req.responseText);
                            console.log(resp);
                            let likeCount = document.querySelector('#_' + resp.postId);
                            console.log(likeCount);
                            let count = parseInt(likeCount.innerText);
                            console.log(resp.flag, typeof resp.flag, count);
                            if (resp.flag) {
                                likeCount.innerText = count + 1;
                            } else {
                                likeCount.innerText = count - 1;
                            }
                        }

                    });

                    req.send(null);
                });

            });

            const shareData = {
                title: "SMA",
                text: "Share post",
                url: window.location.href,

            };


            let shares = document.querySelectorAll(".share");
            const resultPara = document.querySelector(".result");

            // Share must be triggered by "user activation"

            shares.forEach((share) => {
                share.addEventListener("click", async () => {
                    try {
                        await navigator.share(shareData);
                        resultPara.textContent = "SMA shared successfully";
                    } catch (err) {
                        resultPara.textContent = `Error: ${err}`;
                    }
                });

            });


        </script>

    </body>

    </html>