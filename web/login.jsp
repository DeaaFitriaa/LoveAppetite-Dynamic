<%-- 
    Document   : login
    Created on : Jul 13, 2022, 2:24:05 AM
    Author     : rafih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login To Love Appetite</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <section class="order" id="order">

            <h1 class="heading"> <span>login</span> now </h1>

            <div class="row">

                <div class="image">
                    <img src="images/order-img.jpg" alt="">
                </div>

                <form action="login" method="post">

                    <div class="inputBox">
                        <input type="email" placeholder="email" name="email">
                        <input type="password" placeholder="password" name="password">
                    </div>

                    <input type="submit" value="login" class="btn">
                    
                    <a href="regis" style="font-size: 24px; float: right; margin-top: 12px">Register Here!</a>
                    
                </form>

            </div>

        </section>
        
        <section class="footer">

            <div class="share">
                <a href="#" class="btn">facebook</a>
                <a href="#" class="btn">twitter</a>
                <a href="#" class="btn">instagram</a>
                <a href="#" class="btn">pinterest</a>
                <a href="#" class="btn">linkedin</a>
            </div>



        </section>

        <a href="#home" class="fas fa-angle-up" id="scroll-top"></a>


        <script src="${pageContext.request.contextPath}/js/script.js"></script>
        
    </body>
</html>
