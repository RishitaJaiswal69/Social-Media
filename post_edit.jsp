<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <style>
            body{
                background-color:rgb(133, 6, 252);
            }
        </style>
    </head>

    <body>

        <div class="row justify-content-center">
            <div class="col-6 mt-5 border border-secondary rounded p-5 pb-4"
                style="background-color:  rgb(246, 242, 245);">
                <h4 class="text-secondary">
                    Post Edit Form
                </h4>
                <form action="edit_post.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="postId" value="${param.postId}">
                    <div class="mb-3">
                        <label for="name" class="form-label">Title of content</label>
                        <input type="text" name="mainHeading" id="mainHeading" autocomplete="off" class="form-control">
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
                    <input type="submit" class="btn btn-primary mt-3" onclick="myfunction()" value="Update Details">
                </form>
            </div>
        </div>

        <script>
            function myfunction(){
                alert("Are you sure to save to update");
            }
         </script>

    </body>
    </html>