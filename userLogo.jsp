<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          

          <c:choose>
            <c:when test="${not empty user}">
                <img src="logo.do?pic=${user.profilePicPath}"  alt="hugenerd" width="50px" height="50px" class="rounded-circle">
            </c:when>
            <c:otherwise>
                <img src="static/media/image/download.png" alt="error!" height="50px">
            </c:otherwise>
        </c:choose>