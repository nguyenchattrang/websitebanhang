<%-- 
    Document   : home
    Created on : Mar 5, 2022, 11:50:41 PM
    Author     : ADMIN
--%>

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
	<!--
		CSS
		============================================= -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/mycss.css">
        <!-- css của mình -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- bundle của bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
          <a class="navbar-brand" href="#"> <img class="" src="img/Kitten.png" alt="logo"> Kitten Cosmestics Shop</a>
          <!-- brand name có cả hình ảnh chữ logo to hơn bình thường -->
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarmenu" aria-controls="navbarmenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <!-- navbar toggler là cái nút có ba cái gạch ngang, màn hình nhỏ thì nó có hay xao kb -->
          <div class="collapse navbar-collapse" id="navbarmenu">
              <!-- navbar-collapse để gộp nó vào, cái id liên kết với cái databstarget bên trên nên phải đặt cho nó đúng tên -->
            <ul class="navbar-nav m-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link " href="category.html" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Shop
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="makeup.html">Makeup Products</a></li>
                  <li><a class="dropdown-item" href="#">Skincare Products</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Blog</a>
              </li>
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
              <li class="nav-item">
                <a class="nav-link" href="#"><img class="icon" src="img/icon/cart.png"></a>
              </li>
              <li>
                <form class="d-flex">
                  <input class="form-control mx-3" type="search" placeholder="Search" aria-label="Search">
                  <img class="icon  btn-outline-danger " type="submit" src="img/icon/search2.png">
                </form>
              </li>
            </ul>
        
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
      <div class="col-sm-6  col-xs-6 text-center text">
        <h5>Limited Edition Sun-Kissed Essentials Set</h5>
        <p>A look as easy as summer. Includes 5 full sizes + a bright train case.</p>
        <p class="price-top">US$35.00</p>
        <a href="https://www.clinique.com/product/16422/86419/gift-center/all-gifts-sets/limited-edition-sun-kissed-essentials-set" class="btn btn-outline-light btn-dark">Gift Now</a>
      </div>
      <div class="col-sm-6 d-none d-sm-block	">
        <img class="img-fluid" src="img/banner5.png"  alt="...">
      </div>
    </div>
    </div>
      <div class="carousel-item">
        <div class="row">
          <div class="col-xs-6 col-sm-6  text-center text">
            <h5>ANTI AGING ROUTINE SET</h5>
            <p>VALUE ROUTINE FOR WRINKLES & DARK CIRCLES.</p>
            <p class="price-top">$124.00</p>
            <a href="https://www.laroche-posay.us/our-products/anti-aging/anti-aging-routine-set-antiagingskincareset.html" class="btn btn-outline-light btn-dark">Gift Now</a>
         
          </div>
          <div class="col-sm-6 d-none d-sm-block">
            <img class="img-fluid" src="img/banner8.png"  alt="...">
          </div>
        </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col-xs-6 col-sm-6  text-center text">
              <h5>Best Sellers Jumbo Value Bundle</h5>
              <p>$253.30 ($298 Value!) A hydrating jumbo skincare bundle for glowing, smooth skin.</p>
              <p class="price-top">$253.30</p>
              <a href="https://www.kiehls.com/gifts-and-value-sets/gifts-for-all/best-sellers-jumbo-value-bundle/KHLB202201.html" class="btn btn-outline-light btn-dark">Gift Now</a>
           
            </div>
            <div class="col-sm-6 d-none d-sm-block">
              <img class="img-fluid" src="img/banner6.png"  alt="...">
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

  <div class="smallbanner container m-auto mt-5">
    <div class="row text-center py-4">
      <!-- single features -->
      <div class="col-lg-3 col-sm-6 col-sm-6">
        <div class="single-features">
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

    <div class="row article">
<div class="col-sm-6 bgcl text-center my-auto">
  <h5>Skin change after find the right products</h5>
  <p>Find your skincare routine.</p>
  <button class="btn btn-danger btn-outline-light"><a class="nav-link" href="#">Start Now</a></button>
</div>
<div class="col-sm-6">
<img src="img/skinchange.png" alt="Skinchange">
</div>
    </div>

  </div>

  <div class=" container-fluid container-item">
    <div class="sample-item container ">
      
      <div class="row text-center">

      <div class=" bigtitle">
       <h1>New Product</h1>
      </div>
    </div>
      <div class="row row-item">
          <c:forEach items="${list}" var="a"  begin = "1" end = "8">
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="${a.getPicture()}" class="img-fluid" alt="...">
        
        <div class="product-details ">
          <h6 class="product-name">${a.name}</h6>
          <div class="short-desc">${a.sdesc}</div> 
          <div class="price">
              <c:set var="price" value="${a.getLowestandHighestPrice()}" scope="session"></c:set>
            <h6>${price[0]}  <c:if test="${price[1]!=null}">  - ${price[1]} </c:if> </h6>
           
 
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
      </c:forEach>
     
    </div>
    <div class="button">
    <a href="#" class="btn btn-light">View All</a>
  </div>
    </div>
    <div class="sample-item container ">
      
      <div class="row text-center">

      <div class=" bigtitle">
       <h1>Best Sellers</h1>
      </div>
    </div>
      <div class="row row-item">
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/4117_c9f4655916214f12b8fdc5a50f268c40.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/Kitten.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/4117_c9f4655916214f12b8fdc5a50f268c40.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/4117_c9f4655916214f12b8fdc5a50f268c40.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
    </div>
    <div class="row row-item">
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/4117_c9f4655916214f12b8fdc5a50f268c40.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/Kitten.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/4117_c9f4655916214f12b8fdc5a50f268c40.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
      <div class="col-lg-3 col-md-6 item  ">
        <a href="" class="item-a">
        <img src="img/4117_c9f4655916214f12b8fdc5a50f268c40.png" class="img-fluid" alt="...">
        <div class="product-details ">
          <h6 class="product-name">Lilybyred Mood Cinema Velvet</h6>
          <div class="price">
            <h6>$120.00</h6>
            <h6 class="sale-price"><del> $220.00</del></h6>
                      </div>
                      <div class="info">
            <a class="each-link" href="">
             <span> <i class="fa-solid fa-cart-plus"></i></span>
             <p>Add to Cart</p> 
            </a>
            <a class="each-link" href="">
              <span><i class="fa-regular fa-heart"></i></span>
              <p>Wishlist</p>   
             </a>


        </div>

        </div>
      </a>
      </div>
    </div>
    <div class="button">
    <a href="#" class="btn btn-light">View All</a>
  </div>
    </div>

</div>
<div class="container-fluid my-5">

  <div class="row article-2">
    <img src="img/kiehls2.jpg" alt="Skinchange">
<div class="upper">
    <h5>SIGN UP TO RECEIVE
    A FREE TOLERIANE FACE
    MOISTURIZER UV SAMPLE</h5>  
  <button class="btn btn-danger btn-outline-light"><a class="nav-link" href="#">SIGN UP</a></button>
</div>
  </div>

</div>
  


<footer class="container-fluid text-center">
<div class="row">
<div class="col-4">
<p>About us</p>
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. At fugiat voluptatum nihil illum aperiam nesciunt vitae aut dicta sequi, deleniti eveniet voluptatibus beatae eum saepe amet velit explicabo soluta libero?</p>
</div>
<div class="col-4">
<p>About who</p>
<form action="" method="">
  <label for="email"></label>
  <input type="text" id="email" name="email" placeholder="Enter your email">
  <input type="submit" name="emailvalue" value="Send">
</form>
</div>
<div class="col-4">
<p>About me</p>
<ul>
  <li>Makeup Product</li>
  <li>Some other product</li>
  <li>Some other other product</li>
</ul>
<p>Follow us on</p>
<a href=""><i class="fa-brands fa-facebook"></i></a>

<a href=""><i class="fa-brands fa-instagram"></i></a>
<a href=""><i class="fa-brands fa-twitter"></i></a>
</div>

</footer>
</body>
