<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register To Love Appetite</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <section class="order" id="order">

            <h1 class="heading"> <span>register</span> now </h1>

            <div class="row">

                <div class="image">
                    <img src="images/order-img.jpg" alt="">
                </div>

                <form action="regis" method="post">

                    <div class="inputBox">
                        <input type="text" placeholder="name" name="name">
                        <input type="email" placeholder="email" name="email">
                    </div>

                    <div class="inputBox">
                        <input type="password" placeholder="password" name="password">
                        <input type="number" placeholder="phone number" name="phone-number">
                    </div>
                    
                    <div class="inputBox">
                        <input type="text" placeholder="address" name="address" id="address" cols="30" rows="10">
                    </div>
                    
                    <input type="submit" value="register now" class="btn">

                </form>

            </div>

        </section>
    </body>
</html>
