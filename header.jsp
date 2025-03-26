<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand-lg">
    <div class="container-fluid bg-light" >
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <a class="navbar-brand fs-3 form-control" style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20);text-align: center;" href="#" >Chatroom</a>
        
        </ul>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <button type="button" class="btn-lg form-control"  style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20);text-align: center;text-decoration-line:none;"><a href="index.jsp" style="text-decoration-line:none ;">Home</a></button>
                <button type="button" class="btn-lg form-control" style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20); text-align: center;text-decoration-line:none;"><a href="profile_dashboard.jsp" style="text-decoration-line:none ;">Back</a></button>
               
                <button type="button" class="form-control" style="background-color:rgb(243, 240, 245);margin-right:10px;color:rgb(19, 20, 20); text-align: center;" ><a href="signin.jsp" style="text-decoration:none;">Login</a></button>
                <button type="button" class="form-control" style="background-color:rgb(243, 240, 245);color:rgb(19, 20, 20); text-align: center;"><a href="signout.do" style="text-decoration:none;">SignOut</a></button>
                    
            </ul>   
            <c:choose>
                <c:when test="${not empty user}">
                    <img src="logo.do?pic=${user.profilePicPath}"  alt="hugenerd" width="50px" style="border-radius: 50%;">
                </c:when>
                <c:otherwise>
                    <img src="static/media/image/download.png" alt="error!" height="50px">
                </c:otherwise>
            </c:choose>
                <!--li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        dropdown
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                </li>-->
                    
        </div>
    </div>
</nav>

