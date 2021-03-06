<%-- 
    Document   : login
    Created on : Mar 9, 2022, 2:19:37 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Karma Shop</title>

        <!--
                CSS
                ============================================= -->
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

        <!-- Start Header Area -->
        <section id="header" class="header">

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
                                    <a class="nav-link" href="login?link=login"><span><i class="fa-solid fa-user"></i></span></a>

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
                                    <a class="nav-link " href="login" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span><i class="fa-solid fa-user-check"></i> Hello ${user.username}</span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="profile">Profile</a></li>
                                        <li><a class="dropdown-item" href="#">Wish List</a></li>
                                        <li><a class="dropdown-item" href="login?action=logout&link=login">Logout</a></li>
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
            <div id="signin"  class="container-fluid login-form">
                <div class="d-flex justify-content-center h-100">
                    <div class="box">
                        <div class="card-header">
                            <h3>Sign In</h3>
                        </div>
                        <div class="card-body">
                            <form action="login" method="post">
                                <div class="input-group ">

                                    <label for="username" class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </label>

                                    <input type="text" class="form-control" id="username" name="username" placeholder="Username">

                                </div>
                                <div class="input-group">

                                    <label for="password" class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </label>

                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                </div>
                                <div class="row remember">
                                    <input type="checkbox" name="remember">Remember me
                                </div>
                                <div class=" text-center">
                                    <input type="submit" value="Login" class="btn btn-dark btn-outline-light">
                                </div>
                            </form>
                            <c:if test="${message !=null }  "  >  
                                <p style="color:white;" >${message}</p>
                            </c:if>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-center links">
                                Don't have an account?<a href="#" onclick="signUpdisplay();" >Sign Up</a>
                            </div>
                            <div class="d-flex justify-content-center">
                                <a href="#">Forgot your password?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section> 
        <section style="display:none;" id="signup">
            <div class="container">
                <!-- <div class="row"></div>
                <div class="col-md-6"> -->

                <div class="container" style="width:70%" >
                    <main>
                        <div class="py-5 text-center">
                            <img class="d-block mx-auto mb-4" src="img/Kitten.png" alt="" width="20%">
                            <h2>REGISTER FORM</h2>
                            <p class="lead">Already have an account?</p>
                            <a href="login">LOGIN</a>
                        </div>

                        <div  class="">

                        </div>
                        <div class="row g-5">
                            <div class=" col-md-7 col-lg-12" style="text-align: left;">
                                <h4 class="my-3">ACCOUNT</h4>
                                <form action="register" method="post" class="was-validated">

                                    <div class="row g-3" style="text-align: left;">
                                        <div class="col-12">
                                            <label for="username1" class="form-label">Username</label>
                                            <div class="input-group has-validation">
                                                <span class="input-group-text">@</span>
                                                <input oninput="checkUsername(this)"  name="username" type="text" class="form-control is-invalid "  id="username1" placeholder="Username" required>
                                                <div id="invalidusername" class="invalid-feedback">
                                                    Input valid username
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label for="password2" class="form-label">Password:</label>
                                            <input name="password" type="password" class="form-control" id="password2" placeholder="*****" required>

                                        </div>
                                        <div class="col-12">
                                            <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                                            <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com">
                                            <div class="invalid-feedback">
                                                Password
                                            </div>
                                        </div>
                                        <hr class="my-4">	 
                                        <h4 class="my-3">CONTACT DETAILS</h4>
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
                                            <label for="phonenumber" class="form-label">Phone Number</label>
                                            <input name="phonenumber" type="text" class="form-control" id="phonenumber" placeholder="+84123456789" required>
                                            <div class="invalid-feedback">
                                                Please enter your shipping address.
                                            </div>
                                        </div>	  
                                        <div class="col-12">
                                            <label for="address" class="form-label">Address</label>
                                            <input name="address1" type="text" class="form-control" id="address" placeholder="1234 Main St" required>
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
                                            <input name="city" type="text" class="form-control" id="city" placeholder="" required>
                                            <div class="invalid-feedback">
                                                Zip code required.
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="zip" class="form-label">Zip</label>
                                            <input name="zip"  type="text" class="form-control" id="zip" placeholder="" required>
                                            <div class="invalid-feedback">
                                                Zip code required.
                                            </div>
                                        </div>
                                    </div>



                                    <hr class="my-4">

                                    <button class="w-100 btn  btn-dark btn-outline-light btn-lg" type="submit" style="border:solid black 1px;">REGISTER</button>
                                </form>
                            </div>
                        </div>
                </div>
            </div>
            <div class="col-md-6">

            </div>

        </div>
    </section>
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
        </div>
    </footer>
    <!-- End footer Area -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function signUpdisplay() {
            var a = document.getElementById("signup");
            var b = document.getElementById("header");
            var c = document.getElementById("signin");
            a.style.display = 'block';
            b.style.height = '45vh';
            c.style.display = 'none';
        }
        
        function checkUsername(x)
{
   var a= document.getElementById("invalidusername");
    console.log(a.value);
    console.log(x.value);
var c = x.value;
    $.ajax({
    url: "duplicatecheck",
    type: 'get',
    data:{username:c },
    async: true,
    success: function(response) {
        a.innerHTML = response;
if(response.length>0)
    x.setCustomValidity('Wrong input');
else
    x.setCustomValidity('');
    }
});


}
    </script>



</body>

</html>