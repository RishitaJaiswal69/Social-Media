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

            #pic_profile {
                position: absolute;
                right: 340px;
                top: 150px;
                border-radius: 50%;
                z-index: 3;
                width: 120px;
                height: 120px;
            }

            .follower-section {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            #follow-btn {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            #follow-btn.following {
                background-color: #007bff;;
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
                                                href="contact.do"
                                                style="text-decoration-line:none ;">Search</a></button>
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
        <br>

        <div class="col py-3">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body left-0px">
                                <div class="row-md-3" style="height:242px;">
                                    
                                    <c:choose>
                                        <c:when test="${not empty profile.profilePicPath}">
                                            
                                            <img src="pic.do?pic=${profile.profilePicPath}&email=${profile.email}"
                                                class="rounded-circle img-fluid"
                                                style="width:100px;height: 100px;margin-left: 90px;margin-top: 70px;">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="static/media/image/person.png" class="rounded-circle img-fluid"
                                                style="width:100px;margin-left: 90px;">
                                        </c:otherwise>
                                    </c:choose>
                                    <h5 class="card-title" style="margin-left: 100px;">${profile.userName}</h5>
                                    <p class="card-text" style="margin-left: 80px;">${profile.email}</p>
                                </div>

                                <div class="row-md-3">
                                    <div class="card-body">

                                        <button class="btn btn-primary" style="margin-left: 50px;"
                                            value="reject">Contact</button>
                                        <button class="btn btn-danger" value="accept">Message</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card mb-4">
                                    <div class="card-body left-0px">
                                        <img src="pic.do?pic=${profile.backgroundPicPath}&email=${profile.email}"
                                            style="width: 100%;height:37vh" alt="avatar">
                                        <img src="pic.do?pic=${profile.profilePicPath}&email=${profile.email}"
                                            alt="avatar" id="pic_profile">

                                        <div class="follower-section">
                                            <button id="follow-btn" style="margin-top: 40px;margin-left: 280px;">Following</button>
                                            <c:forEach var="foll" items="${follow}" varStatus="recs">
                                              <c:choose >
                                                <c:when test="${foll.follower.userId ==  param.user_id}">
                                                 
                                                 </c:when>
                                                 <c:otherwise>
                                                   
                                                 </c:otherwise>
                                              </c:choose>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8" style="margin-left: 385px;">
                        <div class="card mb-4">
                          <div class="card-body left-0px">
                            <c:choose>
                              <c:when test="${empty posts}">
                                <p class="mb-0">No posts here</p>
                              </c:when>
                              <c:otherwise>
                            <c:forEach var="post" items="${posts}" varStatus="recs">
                              <div class="col-lg-12" style="margin-left: 5px;">
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
                                                <source src="show_post_pic.do?pic=${post.pic}&email=${profile.email}" type="audio/mp3" width="500px"
                                                  height="200vh">
                                              </audio>
                                            </c:when>
                                            <c:when test="${post.mediaType.mediaTypeId ==2}">
                                              <video width="500px" height="240" controls>
                                                <source src="show_post_pic.do?pic=${post.pic}&email=${profile.email}" type="video/mp4" width="300px"
                                                  height="200vh">
                                              </video>
                                            </c:when>
                                            <c:when test="${post.mediaType.mediaTypeId ==3 || post.mediaType.mediaTypeId ==4}">
                                              <img src="show_post_pic.do?pic=${post.pic}&email=${profile.email}" width="500px" height="200vh">
                                            </c:when>
                                            <c:otherwise></c:otherwise>
                                          </c:choose>
                                          
                                        </div>
                                      </div>
                                      <span>${post.creationTime}</span>
                                    </div>
                                  </div>
                                </div>
                            </c:forEach>
                        </div>
                      </c:otherwise>
                    </c:choose>     


                    <script>
                        let btn = document.getElementById("#btn");
                        let isFollowing = false;
                        let followerCount = 100;
                        let button = document.getElementById('follow-btn');
                        

                        button.addEventListener('click', () => {
                            
                            let user_id =`${param.user_id}`;

                            let req = new XMLHttpRequest();
                            let params = 'userId=' + user_id;
                            
                            req.open('POST', 'follower.do', true);
                            req.setRequestHeader('content-type', 'application/x-www-form-urlencoded');

                            req.addEventListener('readystatechange', () => {
                                if (req.readyState == 4 && req.status == 200) {
                                    let resp = JSON.parse(req.responseText);
                                    console.log('under' + resp);
                                    console.log(resp.flag, typeof resp.flag);
                                    if (resp.flag) {
                                        button.textContent ='Following';
                                        button.classList.add('Following');
                                    } else {
                                        button.textContent ='UnFollow';
                                        button.classList.add('UnFollow');
                                    }
                                        
                                        }
                                    });
                            req.send(params);

                        });

                    </script>
    </body>

    </html>