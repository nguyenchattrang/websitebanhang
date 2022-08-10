<%-- 
    Document   : home
    Created on : Mar 5, 2022, 11:50:41 PM
    Author     : ADMIN
--%>

<%@page import="model.Account"%>
<%@page import="DAL.DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/catlogo.png">
        <link rel=" icon" href="img/catlogo.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Kitten Cosmestic shop</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
              rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">   

        <!--
                 CSS
                 ============================================= -->
        <link rel="stylesheet" href="css/mycss.css">
        <!-- css của mình -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <!-- bundle của bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- bootstrap css -->
        <script src="js/myjs.js"></script>
        <!-- script của mình -->
        <!-- <script src="https://unpkg.com/feather-icons"></script> -->
        <!-- script cho icon -->
        <script src="https://kit.fontawesome.com/ca0aaad838.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <section class="header ">


            <div class="blank">

            </div>
            <nav id="navbar" class=" py-0 sticky-top navbar navbar-expand-lg navbar-light  ">
                <!-- navbar là cái tên class k phải ở bootstrap
                navbar-expand-lg: màn hình to thì nó dài ra còn bé hơn thì nó có cái nút
                navbar-light:chữ hợp với màu nền trắng
                bg-light: màu nền trắng
                -->
                <div class="container-fluid greybox">
                    <a style="font-size: 0.8rem;" class="navbar-brand" href="home"> <img class="" src="img/Kitten.png" alt="logo"> Kitten Cosmestics Shop</a>
                    <!-- brand name có cả hình ảnh chữ logo to hơn bình thường -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarmenu" aria-controls="navbarmenu" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- navbar toggler là cái nút có ba cái gạch ngang, màn hình nhỏ thì nó có hay xao kb -->
                    <div class="collapse navbar-collapse" id="navbarmenu">
                        <!-- navbar-collapse để gộp nó vào, cái id liên kết với cái databstarget bên trên nên phải đặt cho nó đúng tên -->
                        <ul class="navbar-nav m-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="category">Category</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Blog</a>
                            </li>
                            <%DAO dao = new DAO();
                                Account a = (Account) session.getAttribute("user");
                                if (a != null && dao.checkAccountRole(a.getId())) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="manage/order">Dashboard</a>
                            </li>
                            <%}%>
                            <li class="nav-item dropdown">
                                <a class="nav-link " href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Pages
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Login</a></li>
                                    <li><a class="dropdown-item" href="#">Tracking</a></li>

                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                            <c:if test="${user==null}" > 
                                <li class="nav-item">
                                    <a class="nav-link" href="login"><span><i class="fa-solid fa-user"></i></span></a>

                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="cart"><i class="fa-solid fa-cart-shopping"></i></a>

                            </li>  

                            <c:if test="${user!=null}" > 
                                <!--                                <li class="nav-item">
                                                                    <a class="nav-link" href="#"><span><i class="fa-solid fa-user-check"></i> Hello ${user.username}</span></a>
                                
                                                                </li>-->
                                <li class="nav-item dropdown">
                                    <a class="nav-link " href="login?link=home" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span><i class="fa-solid fa-user-check"></i> Hello ${user.username}</span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                        <li><a class="dropdown-item" href="order">Order List</a></li>
                                        <li><a class="dropdown-item" href="login?action=logout&link=home">Logout</a></li>
                                    </ul>
                                </li>
                            </c:if>
                            <!--                            <li class="nav-item">
                                                            <a class="nav-link" href="#"><img class="icon" src="img/icon/cart.png"></a>
                                                        </li>-->
                            <li class="nav-item">
                                <form class="d-flex">
                                    <input class="form-control mx-3" type="search" placeholder="Search" aria-label="Search">
                                    <img class="icon  btn-outline-danger " type="submit" src="img/icon/search2.png">
                                </form>
                            </li>

                        </ul>

                    </div>
                </div>
            </nav>

            <div id="slide" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <!-- <div class="carousel-indicators">
                  <button type="button" data-bs-target="#slide" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#slide" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#slide" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div> -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-sm-6  col-xs-6 text-center text align-items-center">
                                <div class="desc"> 
                                    <h5>Limited Edition Sun-Kissed Essentials Set</h5>
                                    <p>A look as easy as summer. Includes 5 full sizes + a bright train case.</p>
                                    <p class="price-top">US$35.00</p>
                                    <a href="category" class="btn btn-outline-light btn-primary">Gift Now</a>
                                </div>
                            </div>
                            <div class="col-sm-6 d-none d-sm-block align-items-center text2 	">
                                <img class="img-fluid wow swing" style="animation-iteration-count: 1" src="img/banner5.png"  alt="...">
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6  text-center text">
                                <div class="desc"> 
                                    <h5>ANTI AGING ROUTINE SET</h5>
                                    <p>VALUE ROUTINE FOR WRINKLES & DARK CIRCLES.</p>
                                    <p class="price-top">$124.00</p>
                                    <a href="category" class="btn btn-outline-light btn-primary">Gift Now</a>
                                </div>
                            </div>
                            <div class="col-sm-6 d-none d-sm-block text2">
                                <img class="img-fluid wow swing" style="animation-iteration-count: 1" src="img/banner8.png"  alt="...">
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6  text-center text">
                                <div class="desc"> 
                                    <h5>Best Sellers Jumbo Value Bundle</h5>
                                    <p>$253.30 ($298 Value!) A hydrating jumbo skincare bundle for glowing, smooth skin.</p>
                                    <p class="price-top">$253.30</p>
                                    <a href="category" class="btn btn-outline-light btn-primary">Gift Now</a>
                                </div>
                            </div>
                            <div class="col-sm-6 d-none d-sm-block text2" >
                                <img class="img-fluid wow swing" style="animation-iteration-count: 1" src="img/banner6.png"  alt="...">
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#slide" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#slide" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </section>

        <div class="smallbanner container m-auto mt-5 wow bounceInDown " data-wow-delay="0.3s">
            <div class="row text-center py-4">
                <!-- single features -->
                <div class="col-lg-3 col-sm-6 col-sm-6">
                    <div class="single-features ">
                        <div class="f-icon">
                            <img src="img/features/f-icon1.png" alt="">
                        </div>
                        <h6>Free Delivery</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-sm-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="img/features/f-icon2.png" alt="">
                        </div>
                        <h6>Return Policy</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-sm-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="img/features/f-icon3.png" alt="">
                        </div>
                        <h6>24/7 Support</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-sm-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="img/features/f-icon4.png" alt="">
                        </div>
                        <h6>Secure Payment</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid my-5">

            <div class="row article ">
                <div class="col-sm-6 bgcl text-center my-auto wow bounceInLeft">
                    <div class="title">
                        <h5>Skin change after find the right products</h5>
                        <p>Find your skincare routine.</p>
                        <button class="wow shake btn btn-primary btn-outline-light"><a class="nav-link" href="#">Start Now</a></button>

                    </div>
                </div>
                <div class="col-sm-6 wow bounceInRight">
                    <img src="img/skinchange.png" alt="Skinchange">
                </div>
            </div>

        </div>

        <div class=" container-fluid container-item">
            <div class="sample-item container ">

                <div class="row text-center">

                    <div class=" bigtitle">
                        <i class="bi bi-flower1">  </i>
                        <h1>   New Products  </h1>
                         <i class="bi bi-flower1"></i>
                    </div>
                </div>
                <div class="row row-item">
                    <!--                    <a href="" class="item-a">-->
                    <c:forEach items="${list}" var="a"  begin = "1" end = "8">

                        <div  class=" col-lg-3 col-md-6 item wow bounceInUp animated " data-wow-delay="0.5s" >
                            <div class="card-card">
                                <img src="${a.getPicture()}"  class="img-fluid" alt="...">

                                <div class="product-details ">
                                    <h6 class="product-name">${a.name}</h6>
                                    <div class="short-desc">${a.sdesc}</div> 
                                    <div class="price">
                                        <c:set var="price" value="${a.getLowestandHighestPrice()}" scope="session"></c:set>
                                        <h6>$${price[0]}  <c:if test="${price[1]!=null}">  - $${price[1]} </c:if> </h6>
                                        </div>
                                        <div class="bottom" >
                                            <a class="btn btn-primary " href="Productdetails?pid=${a.id}">
                                            View Product
                                        </a>
                                    </div> 
                                </div>
                            </div>
                        </div>
              
        </c:forEach>
      </div>
                </div>
            </div>
        <div class=" container-fluid container-item mt-5">
            <div class="sample-item container ">

                <div class="row text-center">

                    <div class=" bigtitle">
                       <i class="bi bi-flower1"></i> <h1>Sale Products</h1> <i class="bi bi-flower1"></i>
                    </div>
                </div>
                <div class="row row-item">
                    <c:forEach items="${list2}" var="a"  begin = "1" end = "8">
              <div  class=" col-lg-3 col-md-6 item wow bounceInUp animated " data-wow-delay="0.5s" >
                            <div class="card-card">
                                <img src="${a.getPicture()}"  class="img-fluid" alt="...">

                                <div class="product-details ">
                                    <h6 class="product-name">${a.name}</h6>
                                    <div class="short-desc">${a.sdesc}</div> 
                                    <div class="price">
                                        <c:set var="price" value="${a.getLowestandHighestPrice()}" scope="session"></c:set>
                                        <h6>$${price[0]}  <c:if test="${price[1]!=null}">  - $${price[1]} </c:if> </h6>
                                        </div>
                                        <div class="bottom" >
                                            <a class="btn btn-primary " href="Productdetails?pid=${a.id}">
                                            View Product
                                        </a>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            
                <div class="button">
                    <a href="#" class="btn btn-light">View All</a>
                </div>
            </div>  
        </div>


        <footer class="container-fluid text-center">
            <div class="row">
                <div class="col-4">
                    <h5>About us</h5>
                    <p>Đặng Thị Thùy Trang store</p>
                </div>
                <div class="col-4">
                    <h5>Updates on our new products</h5>
                    <form action="" method="">
                        <label for="email"></label>
                        <input class="form-control" type="text" id="email" name="email" placeholder="Enter your email">
                        <input class="btn-primary btn" type="submit" name="emailvalue" value="Send">
                    </form>
                </div>
                <div class="col-4">
                    <h5>Products</h5>
                    <ul>
                        <li>Makeup products</li>
                        <li>Skincare products</li>
                        <li>Gifts</li>
                    </ul>
                    <p>Follow us on</p>
                    <a href=""><i class="fa-brands fa-facebook"></i></a>

                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-twitter"></i></a>
                </div>

        </footer>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
        <script type="text/javascript">
            new WOW().init();
        </script>
    </body>
