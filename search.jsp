<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

        <style>
            /* On mouse-over, add a deeper shadow */
            .card-new:hover {
                box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            }

            .card-new {
                margin-top: 20px;
                margin-left: 30px;
                padding: 2px 12px;
            }

            /* Add some padding inside the card container */
            .card-new {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                transition: 0.3s;
                border-radius: 5px;
                /* 5px rounded corners */
                width: 30%;
            }

            /* Add rounded corners to the top left and the top right corner of the image */
            img {
                border-radius: 5px 5px 0 0;
            }

            #pic_profile {
                position: absolute;
                top: 25px;
                left: 25px;
                z-index: 2;
            }

            #x {
                position: relative;
            }

            #b {
                border: 3px solid #ccc;
                font-size: 22px;
                position: absolute;
                left: 0px;
                top: 45px;
                display: none;
            }

            #b div {
                padding: 5px 12px;
            }

            #b div:hover {
                background-color: #555;
                color: #fff;
            }
            body{
                background-color: rgb(133, 6, 252);
            }

            #pic_profile {
                position: absolute;
                border-radius: 50%;
                z-index:3;
                width:90px;
                height:90px;
            }
           
        </style>
    </head>

    <body>
       
        
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <a href="profile_dashboard.jsp" class="navbar-brand  fs-3" style="margin-right:10px;color:rgb(19, 20, 20);text-align: center;">Back</a>
               
                <form action="search.do" method="POST" class="d-flex" id="x">
               
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="name">
                        <label class="form-check-label" for="flexRadioDefault1">name</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked value="email">
                        <label class="form-check-label" for="flexRadioDefault2">email</label>
                    </div>
                           &nbsp;
                    <input class="form-control" type="search" placeholder="Search" name="a" id="a" aria-label="Search">
                    <div id="b"></div>

                    <button class="btn btn-outline-success" id="btn" type="submit">Search</button>
                    
                </form>
            </div>
        </nav>
    
            <c:choose>
                <c:when test="${not empty filterdata}">
                    <div class="mt-4 ms-5" style="padding-left: 400px;">
                        <div class="card mb-3" id="${filterdata.userId}" style="max-width: 500px;">
                           
                            <div class="row">
                                <div class="col-md-4" style="height:20vh">
                                    <c:choose>
                                        <c:when test="${not empty filterdata.profilePicPath}">
                                            <img src="pic.do?pic=${filterdata.profilePicPath}&email=${filterdata.email}"
                                                id="pic_profile">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="static/media/image/person.png" 
                                                style="width:40px;" id="pic_profile">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">${filterdata.userName}</h5>
                                        <p class="card-text">${filterdata.email}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    
                        <c:forEach var="usr" items="${users}" varStatus="recs">
                            <div class="mt-4 ms-5" style="padding-left: 400px;">
                                <div class="card mb-3" id="${usr.userId}" style="width:500px;">
                                    <div class="row">
                                        <div class="col-md-4" style="height:20vh;">
                                            <c:choose>
                                                <c:when test="${not empty usr.profilePicPath}">
                                                    <img src="pic.do?pic=${usr.profilePicPath}&email=${usr.email}"
                                                        id="pic_profile">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="static/media/image/person.png"
                                                    id="pic_profile">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card-body">
                                                <h5 class="card-title">${usr.userName}</h5>
                                                <p class="card-text">${usr.email}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    
        <script>
            let x = document.querySelector('#x');
            let a = document.querySelector('#a');
            let b = document.querySelector('#b');
            let btn = document.querySelector('#btn');
            let userId = document.querySelector('#userId');

            let flexRadioDefault1 = document.querySelector('#flexRadioDefault1');
            let flexRadioDefault2 = document.querySelector('#flexRadioDefault2');

            const collectSearchResult = async (url) => {
                let resp = await fetch(url);
                let rest = await resp.json();

                return rest;
            };

            a.addEventListener('keyup', () => {
                b.innerHTML = '';
                b.style.display = 'none';
                if (a.value.length > 0) {
                    console.log(flexRadioDefault1.checked, "+++++++++++++");
                    if (flexRadioDefault1.checked) {
                        let url = 'search.do?key=' + a.value + '&which=' + flexRadioDefault1.value;
                        collectSearchResult(url).then((data) => {
                            b.style.display = 'block';
                            for (let next of data) {
                                console.log(next);
                                let dv = document.createElement('div');
                                dv.innerText = next.userName;
                                dv.style.cursor = 'pointer';
                                dv.addEventListener('click', (e) => {
                                    a.value = e.target.innerText;
                                    b.style.display = 'none';
                                });
                                b.append(dv);
                            }
                        }).catch((err) => {
                            console.log(err);
                        });
                    } else if (flexRadioDefault2.checked) {
                        let url = 'search.do?key=' + a.value + '&which=' + flexRadioDefault2.value;
                        collectSearchResult(url).then((data) => {
                            b.style.display = 'block';
                            for (let next of data) {
                                console.log(next);
                                let dv = document.createElement('div');
                                dv.innerText = next.userName;
                                dv.style.cursor = 'pointer';
                                dv.addEventListener('click', (e) => {
                                    a.value = e.target.innerText;
                                    b.style.display = 'none';
                                });
                                b.append(dv);
                            }
                        }).catch((err) => {
                            console.log(err);
                        });
                    }
                }

            });

            
            const cards = document.querySelectorAll('.card');
        
            // ------------------- show posts -----------------------
            cards.forEach((card) => {
                card.addEventListener('click', (e) => {
                    window.location = 'show_post_to_all.do?user_id='+card.id;
                });
            });


        </script>
        
    </body>
    </html>