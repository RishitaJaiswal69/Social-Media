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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                ;
            }

            .commentinput>input {
                border: none;
                padding: 10px;
                padding-left: 0;
                outline: none;
                border-bottom: 2px solid blue;
                margin-bottom: 10px;
                width: 45%;

            }

            .container {
                border: 1px solid rgba(128, 128, 128, 0.475);
                width: 260px;
                height: 400px;
                overflow: scroll;
            }

            .highlight {
                background-color: rgb(221, 219, 241);

            }
        </style>
    </head>

    <body>

        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <ol class="breadcrumb">
                    <li><a href="started.do" class="btn-lg form-control fs-5"
                            style="background-color:rgb(133,6,252);color:aliceblue;text-align: center;text-decoration-line: none;"
                            id="btn">Home</a></li>

                    <li><a href="show_post_to_all.do?user_id=${param.user_id}" class="btn-lg form-control fs-5"
                            style="background-color:rgb(133,6,252);color:aliceblue;text-align:center;text-decoration-line: none;">Back</a>
                    </li>
                </ol>
            </div>
        </nav><br><br>

        <c:forEach var="post" items="${posts}" varStatus="recs">
            <input type="hidden" id="user" value="${user.email}">
            <div class="row justify-content-center">
                <div class="col-md-6 rounded" style="margin-left: 20px;">
                    <div class="card mb-4" id="${post.postId}">
                        <div class="card-body border">
                            <div class="row">
                                <div class="col-sm-11">
                                    <c:choose>
                                        <c:when test="${not empty post.mainHeading}">
                                            <p class="mb-0">${post.mainHeading}</p>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

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
                                <div class="col-sm-12" style="margin-left:30px">
                                    <c:choose>
                                        <c:when test="${post.mediaType.mediaTypeId == 1}">
                                            <audio controls>
                                                <source src="one_post_pic.do?pic=${post.pic}&email=${param.email}"
                                                    type="audio/mp3" width="500px" height="200vh">
                                            </audio>
                                        </c:when>
                                        <c:when test="${post.mediaType.mediaTypeId ==2}">
                                            <video width="500px" height="240" controls>
                                                <source src="one_post_pic.do?pic=${post.pic}&email=${param.email}"
                                                    type="video/mp4" width="500px" height="200vh">
                                            </video>
                                        </c:when>
                                        <c:when
                                            test="${post.mediaType.mediaTypeId ==3 || post.mediaType.mediaTypeId ==4}">
                                            <img src="one_post_pic.do?pic=${post.pic}&email=${param.email}"
                                                width="500px" height="200vh">
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                            <span>${post.creationTime}</span>
                        </div>
                        <div class="row" style="margin-left: 30px;">
                            <div class="col-sm-3">
                                <button class="btn" id="${post.postId}" name="${post.postId}"
                                    style="background-color:white;border:none;"><i class="fa fa-thumbs-up"></i></button>
                                <span id="_${post.postId}">${post.likeCount}</span>
                            </div>
                            <div class="col-sm-3">
                                <img src="static/media/image/comment.png" width="30px"><span
                                    id="_${post.postId}">${post.commentsCount}</span>
                            </div>
                            <div class="col-sm-3">
                                <img src="static/media/image/share.png" class="share" width="30px">
                            </div>
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-primary bg-secondary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal22">Report</button>

                            </div>
                        </div>

                        <div class="container" style="width: 660px;">
                            <div class="card">
                                <div class="card-body text-bg-light">
                                    <img src="static/media/image/profilepic.png" width="25px">
                                    <form action="#">
                                        <div class="commentinput">
                                            <input type="hidden" id="postId" value="${post.postId}">
                                            <input type="text" id="textarea" placeholder="Enter comment">
                                            <button type="button" id="publish"
                                                class="btn btn-secondary">Publish</button>
                                        </div>
                                        <button type="button" class="btn btn-secondary" id="show"
                                            onclick="collectComment()">showAllReply</button>
                                    </form>
                                </div>
                            </div>
                            <div id="card-container">

                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Comment As</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                        onclick="callUpdate()"></button>
                                </div>
                                <div class="modal-body">
                                    <img src="static/media/image/profilepic.png" width="25px">
                                    <form action="#">
                                        <div class="commentinput">
                                            <input type="hidden" id="postId2" value="${post.postId}">
                                            <input type="hidden" id="cmtid">
                                            <input type="text" id="textarea2" placeholder="Enter comment">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
        </c:forEach>
        <!--button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"></button-->
        <div class="modal fade" id="exampleModal22" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
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

        </div>
        <div class="modal fade" id="exampleModal23" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Report On Comment</h1>
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

        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            let user = document.querySelector('#user');
            console.log(user.value);
            let postId2 = document.querySelector('#postId2');
            let textarea2 = document.querySelector('#textarea2');
            let update = document.querySelector('#update');
            let postId = document.querySelector('#postId');
            let textarea = document.querySelector('#textarea');
            let publish = document.querySelector('#publish');
            let container = document.getElementById('card-container');

            const cmtid = document.querySelector('#cmtid');

            let form = document.forms[0];

            publish.addEventListener('click', () => {

                let req = new XMLHttpRequest();
                console.log(postId.value + "*********" + textarea.value);
                let params = 'textarea=' + textarea.value + '&postId=' + postId.value;

                req.open('POST', 'comment.do', true);
                req.setRequestHeader('content-type', 'application/x-www-form-urlencoded');

                req.addEventListener('readystatechange', () => {
                    if (req.readyState == 4 && req.status == 200) {
                        let resp = req.responseText;
                        console.log('under' + resp);
                        if (resp == 'true') {
                            console.log("jsddsj");
                            form.reset();
                            collectComment();
                        }
                    }
                });
                req.send(params);

            });


            let collectComment = () => {
                $('#card-container').empty();
                let req = new XMLHttpRequest();

                let url = 'show_comment.do?postId=' + postId.value;

                req.open('GET', url, true);

                req.addEventListener('readystatechange', () => {
                    if (req.readyState == 4 && req.status == 200) {
                        let resp = req.responseText;
                        let arr = JSON.parse(req.responseText);

                        for (let obj of arr) {

                            let card = document.createElement('div');
                            card.classList.add('card');
                            card.classList.add('text-bg-light');

                            let cardBody = document.createElement('div');
                            cardBody.classList.add('card-body');

                            let cardImg = document.createElement('img');
                            cardImg.classList.add('rounded-circle');
                            cardImg.classList.add('img-fluid');
                            cardImg.src = 'one_post_pic.do?pic=' + obj.user.email + '&email=' + obj.user.password;
                            cardImg.alt = 'avatar';
                            cardImg.style.width = '30px';
                            cardBody.appendChild(cardImg);
                            let cardTitle = document.createElement('span');
                            cardTitle.textContent = obj.user.password;
                            cardTitle.style.marginLeft = '20px';
                            cardBody.appendChild(cardTitle);

                            if (user.value == obj.user.password) {
                                let edit = document.createElement('button');
                                edit.classList.add('btn', 'btn-secondary');
                                edit.style.marginLeft = '200px';
                                edit.textContent = 'Edit';
                                edit.setAttribute('id', 'comment_id');
                                edit.commentId = obj.commentId;
                                edit.value = obj.commentId;
                                console.log(edit.value);
                                edit.addEventListener('click', (e) => {
                                    console.log(e.target.commentId + ' ~~~~~~~ ####');
                                    const myModal = new bootstrap.Modal('#exampleModal');
                                    myModal.show();
                                    cmtid.value = e.target.commentId;
                                });
                                cardBody.appendChild(edit);

                                let delet = document.createElement('button');
                                delet.classList.add('btn', 'btn-secondary');
                                delet.textContent = 'remove';
                                delet.setAttribute('id', 'comment_id');
                                delet.commentId = obj.commentId;
                                delet.value = obj.commentId;
                                delet.onclick = function () {
                                    deletComment(delet.value);
                                }
                                cardBody.appendChild(delet);

                            } else {
                                let report = document.createElement('button');
                                report.classList.add('btn', 'btn-secondary');
                                report.textContent = 'report on this comment';
                                report.style.marginLeft = '100px';
                                report.addEventListener('click', () => {
                                    const myModal = new bootstrap.Modal('#exampleModal23');
                                    myModal.show();
                                });

                                cardBody.appendChild(report);
                            }

                            let cardText = document.createElement('p');
                            cardBody.appendChild(cardText);
                            cardText.textContent = obj.comment;
                            card.appendChild(cardBody);

                            let cardfooter = document.createElement('span');
                            cardBody.appendChild(cardfooter);
                            cardfooter.textContent = obj.commentTime;
                            card.appendChild(cardBody);

                            container = document.getElementById('card-container');
                            container.appendChild(card);


                        }

                    }
                });
                req.send(null);

            }


            function callUpdate() {
                console.log("jsdncsdj");

                let req = new XMLHttpRequest();

                let params = 'textarea=' + textarea2.value + '&postId=' + postId2.value + '&commentId=' + cmtid.value;

                req.open('POST', 'edit_comment.do', true);
                req.setRequestHeader('content-type', 'application/x-www-form-urlencoded');

                req.addEventListener('readystatechange', () => {
                    if (req.readyState == 4 && req.status == 200) {
                        if (req.responseText == 'true') {

                            collectComment();
                        }
                    }

                });

                req.send(params);

            }



            let deletComment = (val) => {
                let req = new XMLHttpRequest();

                let params = '&postId=' + postId2.value + '&commentId=' + val;

                req.open('POST', 'delete_comment.do', true);
                req.setRequestHeader('content-type', 'application/x-www-form-urlencoded');

                req.addEventListener('readystatechange', () => {
                    if (req.readyState == 4 && req.status == 200) {
                        if (req.responseText == 'true') {
                            collectComment();
                        }
                    }

                });

                req.send(params);
            }

            let reportComment = () => {

            }

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
                text: "Share comment",
                url: window.location.href,
            };

            let shares = document.querySelectorAll(".share");
            const resultPara = document.querySelector(".result");

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