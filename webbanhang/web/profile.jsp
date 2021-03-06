<%-- 
    Document   : profile
    Created on : Mar 11, 2022, 1:48:04 PM
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
                    <a style="font-size: 0.8rem;" class="navbar-brand" href="home"> <img class="" src="img/Kitten.png"
                                                                                         alt="logo"> Kitten Cosmestics Shop</a>
                    <!-- brand name có cả hình ảnh chữ logo to hơn bình thường -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarmenu"
                            aria-controls="navbarmenu" aria-expanded="false" aria-label="Toggle navigation">
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
                                <a class="nav-link " href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
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
                            <c:if test="${user==null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="login?link=cart"><span><i
                                                class="fa-solid fa-user"></i></span></a>

                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="cart"><i class="fa-solid fa-cart-shopping"></i></a>

                            </li>

                            <c:if test="${user!=null}">

                                <li class="nav-item dropdown">
                                    <a class="nav-link " href="login" id="navbarDropdown" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        <span><i class="fa-solid fa-user-check"></i> Hello ${user.username}</span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="makeup.html">Profile</a></li>
                                        <li><a class="dropdown-item" href="#">Wish List</a></li>
                                        <li><a class="dropdown-item" href="login?action=logout&link=cart">Logout</a></li>
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
        <div class="container rounded bg-white mt-5 mb-5" style="text-align: left;">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><span
                            class="font-weight-bold">Hello ${sessionScope.user.username}</span><span
                            class="text-black-50">${user.email}</span><span> </span></div>
                </div>
                <div class="col-md-5 border-right">
                    <form action="profile?action=profile" method="post">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right btn btn-primary" onclick="switchProfile(1)">Profile Settings</h4>
                            </div>
                            <div id="profile" >
                                <div class="row mt-2" style="text-align: left; margin-bottom: 10px;">
                                    <div class="col-md-6"><label class="labels" for="firstname">First Name</label><input
                                            id="firstname" name="firstname" type="text" class="form-control"
                                            placeholder="first name" value="${user.firstname}"></div>
                                    <div class="col-md-6"><label class="labels" for="lastname">Last Name</label><input
                                            id="lastname" name="lastname" type="text" class="form-control" value="${user.lastname}"
                                            placeholder="surname"></div>
                                </div>
                                <div class="row mt-3" style="text-align: left; margin-bottom: 10px;">
                                    <div class="col-md-12"><label class="labels" for="phonenumber">Phone
                                            Number</label><input id="phonenumber" name="phonenumber" type="tel"
                                                             class="form-control" placeholder="enter phone number" value="${user.phonenumber}"></div>
                                    <div class="col-md-12"><label class="labels" for="address1">Address Line 1</label><input
                                            id="address1" name="address1" type="text" class="form-control"
                                            placeholder="enter address line 1" value="${user.address1}"></div>
                                    <div class="col-md-12"><label class="labels" for="address2">Address Line 2</label><input
                                            id="address2" name="address2" type="text" class="form-control"
                                            placeholder="enter address line 2" value="${user.address2}"></div>
                                    <div class="col-md-12"><label class="labels" for="zip">Zip</label><input id="zip"
                                                                                                             name="zip" type="text" class="form-control" placeholder="enter zip"
                                                                                                             value="${user.zip}">
                                    </div>
                                    <div class="col-md-12"><label class="labels" for="city">City</label><input id="city"
                                                                                                               name="city" type="text" class="form-control" placeholder="enter address line 2"
                                                                                                               value="${user.city}"></div>
                                    <div class="col-md-12"><label class="labels" for="email">Email Address</label><input
                                            type="email" id="email" name="email" class="form-control"
                                            placeholder="enter email id" value="${user.email}"></div>

                                </div>
                                <div class="mt-5 text-center"><button class="btn btn-dark btn-outline-light"
                                                                      type="submit">Save
                                        Profile</button></div>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="col-md-4">
                   
                    <form action="profile?action=changepassword" method="post">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right btn btn-primary "onclick="switchProfile(2)" >Change Password</h4>
                            </div>
                             <c:if test="${message!=null}">
                        <div class="text-danger">${message}</div>
                    </c:if>
                            <div id="changepassword" class="p-3 py-5"
                                 style="text-align: left; margin-bottom: 10px; display: none;" >
                                <label class="labels" for="oldpassword">Current Password</label><input id="oldpassword"
                                                                                                   name="oldpassword" type="password" class="form-control" value="">

                                <label class="labels" for="newpassword">New Pasword</label><input id="newpassword"
                                                                                                  name="newpassword" type="password" class="form-control" value="">
                                <label class="labels" for="newpassword2">Confirm New Pasword</label><input id="newpassword2"
                                                                                                           name="newpassword2" type="password" class="form-control" value="" onchange="checkPassword()">

                                <input type="submit" class="btn btn-dark btn-outline-light" value="Submit">
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function switchProfile(x) {
        console.log(1);
        console.log(2);
        var a = document.getElementById("profile");
        var b = document.getElementById("changepassword");
        if (x == 2) {

            a.style.display = "none";
            b.style.display = "block";
        } else {
            a.style.display = "block";
            b.style.display = "none";
        }
        console.log(a);
        console.log(b);
    }
    function checkPassword() {
        console.log(1);
        console.log(2);
        var a = document.getElementById("newpassword");
        var b = document.getElementById("newpassword2");
        if (a.value !== b.value) {
            b.setCustomValidity("Wong confirm password");
        } else
            b.setCustomValidity("");
        console.log(a.value);
        console.log(b.value);
    }
</script>








<footer class="container-fluid text-center">
    <div class="row">
        <div class="col-4">
            <p>About us</p>
            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. At fugiat voluptatum nihil illum aperiam
                nesciunt vitae aut dicta sequi, deleniti eveniet voluptatibus beatae eum saepe amet velit explicabo
                soluta libero?</p>
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

</html>
