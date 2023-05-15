<%@page import="Logic.Model.PaymentModel"%>
<%@page import="Logic.Controller.PaymentController"%>
<%@page import="Logic.Model.CategoryModel"%>
<%@page import="Logic.Controller.CategoryController"%>
<%@page import="Logic.Controller.ProductController"%>
<%@page import="Logic.Model.ProductModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Food </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
    
<!-- header section starts  -->
<%
    boolean foundProds = (Boolean)request.getAttribute("boolProducts");
    ResultSet rsProds;
    ProductModel pModel = new ProductModel();
    int productCounter = 0;
    
    if (foundProds) {
        rsProds = (ResultSet)request.getAttribute("Products");
        rsProds.last();
        productCounter = rsProds.getRow();
        pModel.instantiateProducts(productCounter);
        
        rsProds.beforeFirst();
        if (rsProds.isBeforeFirst()) {
            for (int i = 0; i < productCounter; i++) {
                rsProds.next();
                pModel.setId(i, rsProds.getString("ID"));
                pModel.setName(i, rsProds.getString("Name"));
                pModel.setDescription(i, rsProds.getString("Description"));
            }
        }
    }
    // get categories
    CategoryController cc = new CategoryController();
    int categoryCounter = 0;
    CategoryModel cModel = new CategoryModel();
    ResultSet rsCategories = (ResultSet)cc.get();
    rsCategories.last();
    categoryCounter = rsCategories.getRow();
    cModel.instantiateCategories(categoryCounter);
    rsCategories.beforeFirst();
    
    for (int i = 0; i < categoryCounter; i++) {
        rsCategories.next();
        cModel.setId(i, rsCategories.getString("ID"));
        cModel.setName(i, rsCategories.getString("Name"));
        cModel.setDescription(i, rsCategories.getString("Description"));
    }
    //
    
    // get payments
    PaymentController pmc = new PaymentController();
    int paymentCounter = 0;
    PaymentModel payModel = new PaymentModel();
    ResultSet rsPayment = (ResultSet)pmc.get();
    rsPayment.last();
    paymentCounter = rsPayment.getRow();
    payModel.instantiatePayment(paymentCounter);
    rsPayment.beforeFirst();
    
    for (int i = 0; i < paymentCounter; i++) {
        rsPayment.next();
        payModel.setId(i, rsPayment.getString("ID"));
        payModel.setName(i, rsPayment.getString("Name"));
    }
    //
    
    boolean status = (Boolean)request.getSession().getAttribute("status");
    ResultSet rs;
    if (status) {
        rs = (ResultSet)request.getSession().getAttribute("accountRs");
        rs.first();
%>
<header>

    <a href="#" class="logo"><i class="fas fa-utensils"></i>Love Appetite</a>

    <div id="menu-bar" class="fas fa-bars"></div>

    <nav class="navbar">
        <a href="#home">home</a>
        <a href="#speciality">speciality</a>
        <a href="#popular">popular</a>
        <a href="#gallery">gallery</a>
        <a href="#order">order</a>
        <a href="account"><%= rs.getString("Name")%></a>
    </nav>

</header>
    
    <% }
    if (!status) {
    %>
    
<header>

    <a href="#" class="logo"><i class="fas fa-utensils"></i>Love Appetite</a>

    <div id="menu-bar" class="fas fa-bars"></div>

    <nav class="navbar">
        <a href="#home">home</a>
        <a href="#speciality">speciality</a>
        <a href="#popular">popular</a>
        <a href="#gallery">gallery</a>
        <a href="#review">review</a>
        <a href="#order">order</a>
        <a href="login">login</a>
    </nav>

</header>
    <% } %>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="content">
        <h3>food made with love</h3>
        <p>there is no sincerer love than the love of food!</p>
        <a href="#order" class="btn">order now</a>
    </div>

    <div class="image">
        <img src="images/home-img.png" alt="">
    </div>

</section>

<!-- home section ends -->

<!-- speciality section starts  -->

<section class="speciality" id="speciality">

    <h1 class="heading"> our <span>speciality</span> </h1>

    <div class="box-container">

        <% for (int i = 1; i <= categoryCounter; i++ ) { %>
        <div class="box">
            <img class="image" src="images/s-img-<%= i%>.jpg" alt="">
            <div class="content">
                <img src="images/s-<%= i%>.png" alt="">
                <h3><%= cModel.getName(i-1)%></h3>
                <p><%= cModel.getDescription(i-1)%></p>
            </div>
        </div>
        <% }%>

    </div>

</section>

<!-- speciality section ends -->

<!-- popular section starts  -->

<section class="popular" id="popular">

    <h1 class="heading"> most <span>popular</span> foods </h1>

    <div class="box-container">

        <div class="box">
            <span class="price"> $5 - $20 </span>
            <img src="images/p-1.jpg" alt="">
            <h3>tasty burger</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <a href="#order" class="btn">order now</a>
        </div>
        <div class="box">
            <span class="price"> $5 - $20 </span>
            <img src="images/p-2.jpg" alt="">
            <h3>tasty cakes</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <a href="#order" class="btn">order now</a>
        </div>
        <div class="box">
            <span class="price"> $5 - $20 </span>
            <img src="images/p-3.jpg" alt="">
            <h3>tasty sweets</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <a href="#order" class="btn">order now</a>
        </div>
        <div class="box">
            <span class="price"> $5 - $20 </span>
            <img src="images/p-4.jpg" alt="">
            <h3>tasty cupcakes</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <a href="#order" class="btn">order now</a>
        </div>
        <div class="box">
            <span class="price"> $5 - $20 </span>
            <img src="images/p-5.jpg" alt="">
            <h3>cold drinks</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <a href="#order" class="btn">order now</a>
        </div>
        <div class="box">
            <span class="price"> $5 - $20 </span>
            <img src="images/p-6.jpg" alt="">
            <h3>cold ice-cream</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <a href="#order" class="btn">order now</a>
        </div>

    </div>

</section>

<!-- popular section ends -->

<!-- steps section starts  -->

<div class="step-container">

    <h1 class="heading">how it <span>works</span></h1>

    <section class="steps">

        <div class="box">
            <img src="images/step-1.jpg" alt="">
            <h3>choose your favorite food</h3>
        </div>
        <div class="box">
            <img src="images/step-2.jpg" alt="">
            <h3>free and fast delivery</h3>
        </div>
        <div class="box">
            <img src="images/step-3.jpg" alt="">
            <h3>easy payments methods</h3>
        </div>
        <div class="box">
            <img src="images/step-4.jpg" alt="">
            <h3>and finally, enjoy your food</h3>
        </div>
    
    </section>

</div>

<!-- steps section ends -->

<!-- gallery section starts  -->

<section class="gallery" id="gallery">

    <h1 class="heading"> our food <span> gallery </span> </h1>

    <div class="box-container">

        <% for (int i = 1; i <= productCounter; i++) { %>
        <div class="box">
            <img src="images/g-<%= i%>.jpg" alt="">
            <div class="content">
                <h3><%= pModel.getName(i-1)%></h3>
                <p><%= pModel.getName(i-1)%></p>
                <a href="#order" class="btn">order now</a>
            </div>
        </div>
        <% } %>

    </div>

</section>

<!-- gallery section ends -->

<!-- order section starts  -->

<section class="order" id="order">

    <h1 class="heading"> <span>order</span> now </h1>

    <div class="row">
        
        <div class="image">
            <img src="images/order-img.jpg" alt="">
        </div>

        <% if (status) { 
            rs = (ResultSet)request.getSession().getAttribute("accountRs");
            rs.first();
        %>
        <form action="order" method="post">

            <div class="inputBox">
                <input type="text" name="name" value="<%= rs.getString("Name")%>" readonly>
                <input type="email" name="email" value="<%= rs.getString("Email")%>" readonly>
            </div>

            <div class="inputBox">
                <input type="number" name="phone-number" value="<%= rs.getString("PhoneNumber")%>" readonly>
                <select placeholder="default-aria-example" id="product" name="product" required>
                    <% for (int i = 0; i < productCounter; i++) { %>
                    <option value="<%= pModel.getName(i)%>"><%= pModel.getName(i)%></option>
                    <% } %>
                </select>
            </div>

            <div class="inputBox">
                <select placeholder="default-aria-example" id="product" name="payment" required>
                    <% for (int i = 0; i < paymentCounter; i++) { %>
                    <option value="<%= payModel.getId(i)%>"><%= payModel.getName(i)%></option>
                    <% } %>
                </select>
                <%= payModel.getId(0)%>
                <input type="text" placeholder="Address" name="address" id="address" required>
            </div>
            
            <input type="hidden" name="account-id" value="<%= rs.getString("ID")%>">

            <input type="submit" value="order now" class="btn">

        </form>
        <% } %>
        
        <% if (!status) {%>
        <form action="order" method="post">

            <div class="inputBox">
                <input type="text" placeholder="Name" name="name" required>
                <input type="email" placeholder="Email" name="email">
            </div>

            <div class="inputBox">
                <input type="number" placeholder="Phone Number" name="phone-number" required>
                <select placeholder="default-aria-example" id="product" name="product" required>
                    <% for (int i = 0; i < productCounter; i++) { %>
                    <option value="<%= pModel.getName(i)%>"><%= pModel.getName(i)%></option>
                    <% } %>
                </select>
            </div>

            <div class="inputBox">
                <select placeholder="default-aria-example" id="product" name="payment" required>
                    <% for (int i = 0; i < paymentCounter; i++) { %>
                    <option value="<%= payModel.getId(i)%>"><%= payModel.getName(i)%></option>
                    <% } %>
                </select>
                <input type="text" placeholder="Address" name="address" id="address" required>
            </div>

            <input type="submit" value="order now" class="btn">

        </form>
        <% } %>

    </div>

</section>

<!-- order section ends -->

<!-- footer section  -->

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


<div class="loader-container">
    <img src="/images/loader.gif" alt="">
</div>


<script src="${pageContext.request.contextPath}/js/script.js"></script>


</body>
</html>