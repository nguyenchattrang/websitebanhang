<%-- 
    Document   : checkout
    Created on : Mar 9, 2022, 1:19:07 PM
    Author     : ADMIN
--%>

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



        <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#7952b3">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
    </head>
    <body>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
    <body class="bg-light">
        <section class="header-category">

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
                                    <a class="nav-link" href="login?link=checkout"><span><i class="fa-solid fa-user"></i></span></a>

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
                                    <a class="nav-link " href="login?link=checkout" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span><i class="fa-solid fa-user-check"></i> Hello ${user.username}</span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="makeup.html">Profile</a></li>
                                        <li><a class="dropdown-item" href="#">Wish List</a></li>
                                        <li><a class="dropdown-item" href="login?action=logout&link=checkout">Logout</a></li>
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
            <div class="title">
                <h1>
                    Cart
                </h1>
                <p>Home -> Cart</p>
            </div>
        </section> 

        <div class="container" style="width:70%" >
            <main>
                <div class="py-5 text-center">
                    <img class="d-block mx-auto mb-4" src="img/Kitten.png" alt="" width="20%">
                    <h2>Checkout</h2>
                    <!--<p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>-->
                </div>

                <div  class="">

                </div>
                <c:if test="${user==null}">
                    <div  >
                        <div class="checkoutlabel align-items-center" style="height:50px; background-color: lightgray;">  <h4  style="    padding: 10px 10px;"> SIGN IN & CHECKOUT </h4> </div>
                        <a class="btn btn-dark" href="login?link=checkout">LOGIN</a>

                    </div>
                </c:if>
                <c:if test="${user!=null}">
                    <div  >
                        <div class="checkoutlabel align-items-center" style="height:50px; background-color: lightgray;">  <h4  style="    padding: 10px 10px;"> HI ${user.username} PLEASE CHECKOUT </h4> </div>


                    </div>
                </c:if>
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Your cart</span>
                            <span class="badge bg-primary rounded-pill">${cart.size()}</span>
                        </h4>
                        <ul class="list-group mb-3">
                            <c:set var="total" value="${0}" > </c:set>
                            <c:forEach items="${cart}" var="a">
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">${a.product.name}</h6>
                                        <small class="text-muted">${a.var.name} x ${a.getAmount()}</small>
                                    </div>
                                    <span class="text-muted">${a.getTotal()}</span>
                                </li>
                                <c:set var="total" value="${total + a.getTotal()}" > </c:set>
                            </c:forEach>

                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (USD)</span>
                                <strong>${total}</strong>
                            </li>
                        </ul>
                    </div>

                    <div class=" col-md-7 col-lg-8" style="text-align: left;">
                        <c:if test="${user==null}" >  
                            <div class="my-5" >
                                <div class="align-items-center  checkoutlabel" style="height:50px; background-color: lightgray;">  <h4  style="    padding: 10px 10px;"> CHECKOUT AS GUEST </h4> </div>


                            </div>
                            <h4 class="my-3">Billing address</h4>
                        </c:if>   


                        <form action="checkout" method="post" class="was-validated" >
                            <c:if test="${user==null}">
                                <div class="row g-3" style="text-align: left;">
                                    <div class="col-sm-6">
                                        <label for="firstName" class="form-label">First name</label>
                                        <input name="firstname" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                                        <div class="invalid-feedback">
                                            Valid first name is required.
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <label for="lastName" class="form-label">Last name</label>
                                        <input name="lastname" type="text" class="form-control" id="lastName" placeholder="" value="" required>
                                        <div class="invalid-feedback">
                                            Valid last name is required.
                                        </div>
                                    </div>



                                    <div class="col-12">
                                        <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                                        <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com">
                                        <div class="invalid-feedback">
                                            Please enter a valid email address for shipping updates.
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="phonenumber" class="form-label">Phone Number <span class="text-muted">(Optional)</span></label>
                                        <input name="phonenumber" type="tel" class="form-control" id="phonenumber" placeholder="0123456789">
                                        <div class="invalid-feedback">
                                            Please enter a valid email address for shipping updates.
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="address" class="form-label">Address</label>
                                        <input name="address" type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                                        <div class="invalid-feedback">
                                            Please enter your shipping address.
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
                                        <input name="address2" type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                                    </div>

                                    <div class="col-md-6">
                                        <label for="city" class="form-label">City</label>
                                        <input name="city" class="form-control" id="city" type="text">

                                        <div class="invalid-feedback">
                                            Please provide a valid state.
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="zip" class="form-label">Zip</label>
                                        <input name="zip" type="text" class="form-control" id="zip" placeholder="" required>
                                        <div class="invalid-feedback">
                                            Zip code required.
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <hr class="my-4">

                            <h4 class="mb-3">Payment</h4>

                            <div class="my-3" onchange="displayMethod(this)">
                                <div class="form-check">
                                    <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required value="credit">
                                    <label class="form-check-label" for="credit">Credit card</label>
                                </div>
                                <div class="form-check">
                                    <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required value="debit">
                                    <label class="form-check-label" for="debit">Debit card</label>
                                </div>
                                <div class="form-check">
                                    <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required value="paypal">
                                    <label class="form-check-label" for="paypal">PayPal</label>
                                </div>
                                <div class="form-check">
                                    <input id="cod" name="paymentMethod" type="radio" class="form-check-input" required value="cod">
                                    <label class="form-check-label" for="cod">COD</label>
                                </div>
                            </div>

                            <div class="row gy-3">
                                <div class="col-md-6">
                                    <label for="cc-name" class="form-label">Name on card</label>
                                    <input type="text" class="form-control" id="cc-name" placeholder="" required>
                                    <small class="text-muted">Full name as displayed on card</small>
                                    <div class="invalid-feedback">
                                        Name on card is required
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="cc-number" class="form-label">Credit card number</label>
                                    <input type="text" class="form-control" id="cc-number" placeholder="" required>
                                    <div class="invalid-feedback">
                                        Credit card number is required
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label for="cc-expiration" class="form-label">Expiration</label>
                                    <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                                    <div class="invalid-feedback">
                                        Expiration date required
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label for="cc-cvv" class="form-label">CVV</label>
                                    <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                                    <div class="invalid-feedback">
                                        Security code required
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4">

                            <button class="w-100 btn  btn-dark btn-outline-light btn-lg" type="submit" style="border:solid black 1px;">Checkout</button>
                        </form>

                    </div>
                </div>

            </main>       
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
                <script>
                    function displayMethod(){
                    if (x.value == 'COD')
                    }

                </script>
        </footer>
    </body>
