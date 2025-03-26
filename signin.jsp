
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

    <style>
        body{
            background-color: rgb(133,6,252);
             width: 100%;
             height: 100%;

         }

         .err_msg {
            color: rgb(236, 69, 69);
            font-size: 12px;  
            display: none;          
        }
        
        form{
            border:1px solid black;
            border-style:none;
            width:550px;
            
            margin:auto;
            margin-top: 100px;
            background-color: rgb(237, 235, 238);
        }

        #bb{
           
            width:300px;
            margin-bottom: 300px;
        }
       

    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-2">
                <a href="index.jsp" class="btn-lg form-control fs-3" style="background-color:rgb(243, 240, 245);color:rgb(19, 20, 20);text-align: center;text-decoration-line:none;"id="btn">Back</a>

            </div>
            
            <div class="col">
                <form action="signin.do" method="post">
      
                    <h1 style="margin-left:230px;">Login</h1>
                    <div class="row">
                        
                        <div class="col-5" style="margin-left: 20px;">
                            <div class="mb-3">
                                <label for="name" class="form-label fs-5 fw-semibold">Email</label>
                                <input type="text" class="form-control fs-5" name="email" id="email">
                                
                               <br>
                                <!--small class="err_msg" id="email_err_msg">Enter valid Email...</small -->
                            </div>

                            
                            <div class="mb-3">
                                <label for="name" class="form-label fs-5 fw-semibold">Password</label>
                                <input type="password" class="form-control fs-5"  name="password" id="password">
                                
                                <br>
                                <small class="err_msg" id="password_err_msg">Enter valid Password...</small>
                            </div>
                        </div>
                        <div class="col-1">
                            <img src="static/media/image/mail.png" height="20px" style="margin-top: 50px;">
                            <img src="static/media/image/open.png" width="20px" style="margin-top: 100px;" id="eye">
                        </div>
                        <div class="col-3">
                            <img src="static/media/image/social.png" width="200vh" style="border-radius: 50%;margin-left:20px;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-5" style="margin-left: 20px;">
                            <input type="submit" class="btn-lg form-control fs-5" style="background-color:rgb(133,6,252);color:aliceblue;" value="Login" id="btn"></input>
                        
                        </div>
                        <div class="col-5" style="margin-left: 20px;">
                            <a href="signup.do" class="btn-lg form-control fs-5" style="background-color:rgb(133,6,252);color:aliceblue;text-align: center;text-decoration-line: none;"id="btn">Register</a>
            
                        </div>
                    </div> 
                    <br>
                </form>
            </div>
        </div>
    </div>
       <script> 
        let form = document.forms[0];

      /* let email = document.querySelector('#email');
       let password = document.querySelector('#password');

       let email_err_msg = document.querySelector('#email_err_msg');
       let password_err_msg = document.querySelector('#password_err_msg');

       let emailPattern = new RegExp(/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/);
       let passwordPattern = new RegExp(/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*_#@!~^$])[a-zA-Z0-9*_#@!~^$]{8,16}$/);
        
        email.addEventListener('blur', ()=>{
            if(!emailPattern.test(email.value)) {
                email_err_msg.style.display = 'inline';
            }
        });

       password.addEventListener('blur', ()=>{
            if(!passwordPattern.test(password.value)) {
                password_err_msg.style.display = 'inline';
            }
        });

        email.addEventListener('focus', ()=>{
            email_err_msg.style.display = 'none';
        });

        password.addEventListener('focus', ()=>{
            password_err_msg.style.display = 'none';
        });

        form.addEventListener('submit', (e) => {
            e.preventDefault();

            let flag = true;

            //form control name validation
            
            if(!emailPattern.test(email.value)) {
                email_err_msg.style.display = 'inline';
                
                flag = false;
            } 

            if(!passwordPattern.test(password.value)) {
                password_err_msg.style.display = 'inline';

                flag = false;
            }

            if(flag)
                form.submit();
        });*/

        let eye = document.querySelector('#eye');

       let flag = false;


// ~~~~~~~~~~~~~~~~~~~~ Form Submission  ~~~~~~~~~~~~~~~~~~ start

// ~~~~~~~~~~~~~~~~~~~~ Form Submission  ~~~~~~~~~~~~~~~~~~ end


// ~~~~~~~~~~~~~~~~~~~~ Password Show-Hide ~~~~~~~~~~~~~~~~~~ start
eye.addEventListener('click', ()=>{
    if(!flag) {
        password.type = 'text';
        eye.src = 'static/media/image/close.png';
        flag = true;
    } else {
        password.type = 'password';
        eye.src = 'static/media/image/open.png';
        flag = false;
    }
});
</script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>

</body>
</html>