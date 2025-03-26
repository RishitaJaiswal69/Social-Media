<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
      #pic_profile {
        position: absolute;
        right: 300px;
        top: 150px;
        border-radius: 50%;
        z-index: 3;
        width: 120px;
        height: 120px;
      }
    </style>

  </head>

  <body style="background-color:rgb(133, 6, 252);">
    <c:if test="${empty user}">
      <c:redirect url="signin.do" />
    </c:if>
    <div class="container-fluid">
      <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color: rgb(133, 6, 252);">
          <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
            <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
              <span class="fs-5 d-none d-sm-inline fw-bold">Menu</span>
            </a>
            <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
              <li class="nav-item">
                <a href="#" class="nav-link align-middle px-0">
                  <i class="fs-4 bi-house"></i><a href="index.jsp" class="nav-link px-0"><span
                      class="ms-1 d-none d-sm-inline text-light fw-bold">Home</span></a>
                </a>
              </li>
              <li class="nav-item"></li>
                <a href="#" class="nav-link align-middle px-0">
                  <i class="fs-4 bi-house"></i><a href="home_dashboard.do" class="nav-link px-0"><span
                      class="ms-1 d-none d-sm-inline text-light fw-bold">Home (Dashboard)</span></a>
                </a>
              </li>

              <li>
                <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                  <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline"><a
                      href="profile_dashboard.jsp" class="nav-link px-0 text-light fw-bold">Profile (Dashboard)</a></span> </a>
              </li>
              <ul class="collapse show nav flex-column ms-1" data-bs-parent="#menu">
                <li class="w-100">
                  <a href="post.do" class="nav-link px-0"> <span class="d-none d-sm-inline text-light fw-bold">Create
                      Post</span></a>
                </li>
                <li class="w-100">
                  <a href="delete.do" class="nav-link px-0" onclick="myFunction()"> <span
                      class="d-none d-sm-inline text-light fw-bold">Delete Profile</span></a>
                </li>
                <li class="w-100">
                  <a href="profile.jsp?par=update" class="nav-link px-0 align-middle"><span
                      class="ms-1 d-none d-sm-inline text-light fw-bold">Edit Profile</span></a>
                </li>
              </ul>
              <!--li>
                <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                  <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline text-dark">Contact</span></a>
                <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                  <li class="w-100">
                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-dark">Connection
                        request</span></a>
                  </li>
                  <li>
                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-dark">Contact
                        List</span></a>
                  </li>
                </ul>
              </li>

              <li>
                <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                  <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-dark">Message</span> </a>
                <ul class="collapse nav flex-column ms-1" id="submenu4" data-bs-parent="#menu">
                  <li class="w-100">
                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-dark">Message
                        profile</span></a>
                  </li>
                  <li>
                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-dark">member</span></a>
                  </li>
                  <li>
                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-dark">chat</span></a>
                  </li>
                </ul>
              </li>
              <li-->
                <a href="contact.do" class="nav-link px-0 align-middle">
                  <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline text-light fw-bold">Search</span> </a>
              </li>
              <li>
                <a href="personal_details_from.do" class="nav-link px-0 align-middle">
                  <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline text-light fw-bold">Create Profile</span>
                </a>
              </li>
            </ul>
            <hr>
            <div class="dropdown pb-4">
              <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">

                <img src="logo.do?pic=${user.profilePicPath}" alt="hugenerd" width="30" height="30"
                  class="rounded-circle">
                <span class="d-none d-sm-inline mx-1 fw-bold" style="text-transform: uppercase;"
                  id="uname">${user.userName}</span>
              </a>
              <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                <li><a class="dropdown-item" href="#">New project...</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="signout.do">Sign out</a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="col py-3">
          <section style="background-color: #eee;">
            <div class="container py-5">
              <div class="row">
                <div class="col-lg-8">
                  <div class="card mb-4">
                    <div class="card-body left-0px">
                      <img src="logo.do?pic=${user.backgroundPicPath}" alt="avatar" style="width: 100%;height:50vh">

                      <img src="logo.do?pic=${user.profilePicPath}" id="pic_profile" alt="avatar">

                      <div class="d-flex justify-content-center mb-2">
                        <button type="button" class="btn btn-primary position-relative">
                          Followers <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill text-bg-secondary">${user.followerCount} <span class="visually-hidden">unread messages</span></span>
                        </button>
                        
                        <button type="button" data-mdb-button-init data-mdb-ripple-init
                          class="btn btn-outline-primary ms-1"> <a href="message.jsp" style="text-decoration: none;color:black">Message</a></button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-12">
                          <p class="mb-0 fs-3" style="padding-left: 100px;">About</p>
                          <p class="text-muted mb-0" id="uname">UserName:${user.userName}</p>
                          <p class="text-muted mb-0" id="email">Email:${user.email}</p>
                          <p class="text-muted mb-0" id="mobile">Phone no:${user.mobile}</p>
                          <p class="text-muted mb-0" id="address">Address:${user.address}</p>
                          <p class="text-muted mb-0" id="address">Dob:${user.dob}</p>
                          <p class="text-muted mb-0" id="city">City:${user.city.name}</p>
                          <p class="text-muted mb-0" id="about">About:${user.about}</p>
                          <p class="text-muted mb-0" id="profession">Profession:${user.profession}</p>
                          <p class="text-muted mb-0" id="gender">
                            <c:choose>
                              <c:when test="${user.gender == 'f'}">
                                <p class="text-muted mb-0">Gender:Female</p>
                              </c:when>
                              <c:otherwise>
                                <p class="text-muted mb-0">Gender:Male</p>
                              </c:otherwise>
                            </c:choose>
                          <p class="text-muted mb-0" id="uname">GithubId:${user.github}</p>
                          <p class="text-muted mb-0" id="uname">LinkedinId:${user.linkedin}</p>
                          <p class="text-muted mb-0" id="uname">YoutubeId:${user.youtube}</p>
                          <p class="text-muted mb-0" id="uname">InstagramId:${user.instagram}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </section>
          <div class="row">
            <div class="col-lg-8">
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
                                        <source src="show_post_pic.do?pic=${post.pic}" type="audio/mp3" width="500px"
                                          height="200vh">
                                      </audio>
                                    </c:when>
                                    <c:when test="${post.mediaType.mediaTypeId ==2}">
                                      <video width="500px" height="240" controls>
                                        <source src="show_post_pic.do?pic=${post.pic}" type="video/mp4" width="500px"
                                          height="200vh">
                                      </video>
                                    </c:when>
                                    <c:when test="${post.mediaType.mediaTypeId ==3 || post.mediaType.mediaTypeId ==4}">
                                      <img src="show_post_pic.do?pic=${post.pic}" width="500px" height="200vh">
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
              </div>
            </div>
            <c:choose>
              <c:when test="${not empty follow}">
                <div class="col-4">
                  <div class="card mb-4">
                    <div class="card-body">
                      <p class="mb-0 fs-3" style="padding-left: 100px;">Follower</p>
                       
                      <c:forEach var="foll" items="${follow}" varStatus="recs">
                        <div class="card-body border rounded bg-light">
                          <img src="logo.do?pic=${foll.follower.email}&email=${foll.follower.password}" width="30px" height="40px" alt="avatar">
                          <span class="text-primary">${foll.follower.userName}</span><br>
                          <span style="margin-left: 35px;">${foll.follower.password}</span>
                        </div>
                      </c:forEach>
                      </c:when>
                      <c:otherwise>

                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
            </div>
            </div>

    <script>
      function myFunction() {
        alert("Are you sure you want to delete your profile");
      }

      function myPost() {
        alert("Are you sure you want to delete your post");
      }

    </script>


  </body>

  </html>