<%-- 
    Document   : Productdetails
    Created on : Mar 7, 2022, 9:26:22 PM
    Author     : ADMIN
--%>

<%@page import="model.Rating"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn" class="no-js">

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
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
                                    <a class="nav-link " href="login?link=category" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span><i class="fa-solid fa-user-check"></i> Hello ${user.username}</span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="makeup.html">Profile</a></li>
                                        <li><a class="dropdown-item" href="#">Wish List</a></li>
                                        <li><a class="dropdown-item" href="login?action=logout&link=category">Logout</a></li>
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
                    Product Details
                </h1>
                <p>Home -> Shop -> Product Details</p>
            </div>
        </section> 
        <!-- End Header Area -->



        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6">		  
                        <!-- The expanding image container -->
                        <div class="bigpicture">
                            <!-- Close the image -->

                            <!-- Expanded image -->
                            <img id="expandedImg" src="${pictures.get(0).link}">

                        </div>
                        <div class="row-r">
                            <c:forEach items="${pictures}" var= "a"  begin="0" end="4">
                                <div class="column">
                                    <img src="${a.link}" alt="${a.alt}" onclick="changePic(this);">
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <div class="product_text">
                            <h3>${product.name}</h3>			
                            <ul class="list">
                                <!--                                <li><a class="active" href="#"><span>Category</span> : Household</a></li>-->
                                <li><a href="#"><span>Availibility</span> : In Stock</a></li>
                            </ul>
                            <p>${product.sdesc}</p>
                            <div class="variation-section">
                                <h6> Select a size</h6> 
                                <div>



                                    <div id="displayprice" class="price-elements"  >$${variations.get(0).price}</div>



                                </div>
                            </div>
                            <form method="post" action="cart?link=Productdetails?pid=${product.id}">
                                <div class="size-choice">
                                    <input style="display:none;" name="productid" value="${product.id}" >
                                    <input id="varid" style="display:none;" name="varid" value="${variations.get(0).id}" >
                                    <select name="price" id="size-choice" onchange="changePrice();">

                                        <c:forEach items="${variations}" var ="b" varStatus = "status"  >
                                            <option id ="${b.id}" class="option btn btn-outline-light btn-dark " value="${b.price}" ${status.first ? "checked":""}  >
                                                ${b.name}
                                                </div>
                                            </c:forEach>
                                    </select>
                                </div>
                                <div class="product_count">
                                    <label for="qty">Quantity:</label>
                                    <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
                                    <button onclick="var result = document.getElementById('sst');
                                            var sst = result.value;
                                            if (!isNaN(sst))
                                                result.value++;
                                            return false;"
                                            class="up btn-light btn-outline-dark" type="button"><i class="fa-solid fa-angle-up"></i></button>
                                    <button onclick="var result = document.getElementById('sst'); var sst = result.value; if (!isNaN(sst) & amp; & amp; sst > 1) result.value--; return false;"
                                            class="down btn-light btn-outline-dark" type="button"><i class="fa-solid fa-angle-down"></i></button>
                                </div>
                                <div class="card_area">
                                    <input class="btn btn-outline-dark" type="submit" value="Add to Cart" >
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->

        <!--================Product Description Area =================-->

        <section class="product_description_area">
            <div class="container">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " id="review-tab" data-bs-toggle="tab" href="#review" role="tab" aria-controls="review"
                           aria-selected="false">Reviews</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <p>${product.longdesc}</p>
                    </div>
                    <%ArrayList<Rating> ratings = new ArrayList<Rating>();
                        ratings = (ArrayList<Rating>) request.getAttribute("ratings");
                        int total = 0;
                        for (int i = 0; i < ratings.size(); i++) {
                            total += ratings.get(i).getRating();
                        }
                    %>
                    <div class="tab-pane fade  " id="review" role="tabpanel" aria-labelledby="review-tab">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="row total_rate">
                                    <div class="col-6">
                                        <div class="box_total">
                                            <h5>Overall</h5>
                                            <%if (total != 0) {%>
                                            <h4><%=(double) total / ratings.size()%></h4>
                                            <h6>(<%=ratings.size()%> Reviews)</h6>
                                            <%} else {%>
                                            <h4>0</h4>
                                            <h6>(0 Reviews)</h6>
                                            <%}%>
                                        </div>
                                    </div>
                                    <!--                                    <div class="col-6">
                                                                            <div class="rating_list">
                                                                                <h3>Based on 3 Reviews</h3>
                                                                                <ul class="list">
                                                                                    <li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                                    <li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                                    <li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                                    <li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                                    <li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                                                class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>-->
                                </div>
                                <%for (Rating o : ratings) {%>
                                <div class="review_list">
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="img/Kitten.png" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4><%=o.getUsername()%></h4>
                                                <%for (int i = 0; i < 5; i++) {
                                                        if (i < o.getRating()) { %>
                                                <i class="fa fa-star"></i>
                                                <%} else {%>
                                                <i class="far fa-star"></i>
                                                <%}
                                                    }%>
                                            </div>
                                        </div>
                                        <p><%=o.getComment()%></p>
                                    </div>
                                </div>
                                <%}%>

                            </div>
                            <div class="col-lg-6">
                                <div class="review_box">
                                    <h4>Add a Review</h4>
                                    <p>Your Rating:</p><!--
                                    <ul class="list" id="stars">
                                        <li class="selected" data-value="1"><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li class="selected" data-value="2"><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li class="selected" data-value="3"><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li class="selected" data-value="4"><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li class="selected" data-value="5"><a href="#"><i class="fa fa-star"></i></a></li>
                                    </ul>-->


                                    <form class="row contact_form text-left" action="comment?link=Productdetails?pid=${product.id}&pid=${product.id}" method="post" id="contactForm" novalidate="novalidate">
                                        <div class="rating-1">
                                            <span class="rating__result"></span> 
                                            <input style="display:none;" name="starvalue" id="starvalue" value="5">
                                            <i id="star1" class="rating__star fa fa-star" onclick="changeStar(1)"></i>
                                            <i id="star2" class="rating__star fa fa-star" onclick="changeStar(2)"></i>
                                            <i id="star3" class="rating__star fa fa-star" onclick="changeStar(3)"></i>
                                            <i id="star4" class="rating__star fa fa-star" onclick="changeStar(4)"></i>
                                            <i id="star5" class="rating__star fa fa-star" onclick="changeStar(5)"></i>

                                        </div>
                                        <p>Outstanding</p>



                                        <c:if test="${user==null}">
                                            <div  >
                                                <div class="checkoutlabel align-items-center" style="height:50px; background-color: lightgray;">  <h4  style="    padding: 10px 10px;"> SIGN IN TO COMMENT </h4> </div>
                                                <a class="btn btn-dark" href="login?link=Productdetails?pid=${product.id}">LOGIN</a>

                                            </div>
                                        </c:if>
                                        <c:if test="${user!=null && checkcomment==false && checkorder==true}">
                                            <div  >
                                                <div class="checkoutlabel align-items-center" style="height:50px; background-color: lightgray;">  <h4  style="    padding: 10px 10px;"> HI ${user.username} PLEASE RATE US </h4> </div>


                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="message">Message:</label>
                                                    <textarea  class="form-control" name="message" id="message" rows="5" placeholder="Review" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Review'"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12 text-right">
                                                <button type="submit" value="submit" class="btn btn-outline-dark ">Submit Now</button>
                                            </div>-->
                                        </c:if>
                                        <c:if test="${user!=null && checkorder==true && checkcomment==true }">
                                            <div  >
                                                <div class="checkoutlabel align-items-center" style="height:50px; background-color: lightgray;">  <h4  style="    padding: 10px 10px;"> HI ${user.username} THANKS FOR YOUR RATING </h4> </div>


                                            </div>

                                        </c:if>
                                        <c:if test="${user!=null && checkorder==false }">
                                            <div  >
                                                <div class="checkoutlabel align-items-center" style="height:50px; background-color: lightgray;">  <h4  style="    padding: 10px 10px;"> HI ${user.username} DO YOU LIKE THIS PRODUCT? </h4> </div>


                                            </div>

                                        </c:if>
                                        <!--                                        <div class="col-md-12" >
                                                                                    <div class="form-group">
                                                                                        <label for="name">Name:</label>
                                                                                        <input type="text" class="form-control" id="name" name="name" placeholder="Your Full name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Full name'">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-12">
                                                                                    <div class="form-group">
                                                                                        <label for="email">Email:</label>
                                                                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-12">
                                                                                    <div class="form-group">
                                                                                        <label for="number">Phone Number:</label>
                                                                                        <input type="text" class="form-control" id="number" name="number" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'">
                                                                                    </div>
                                                                                </div>
                                                                          
                                   
                                        
                                        -->                                
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--
        <!--================End Product Description Area =================-->

        <!-- Start related-product Area -->

        <!-- End related-product Area -->

        <!-- start footer Area -->
    </form>
    <footer class="footer-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-3  col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>About Us</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore
                            magna aliqua.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4  col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>Newsletter</h6>
                        <p>Stay update with our latest</p>
                        <div class="" id="mc_embed_signup">

                            <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                  method="get" class="form-inline">

                                <div class="d-flex flex-row">

                                    <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
                                           required="" type="email">


                                    <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                                    <div style="position: absolute; left: -5000px;">
                                        <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                    </div>

                                    <!-- <div class="col-lg-4 col-md-4">
                                                            <button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
                                                    </div>  -->
                                </div>
                                <div class="info"></div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3  col-md-6 col-sm-6">
                    <div class="single-footer-widget mail-chimp">
                        <h6 class="mb-20">Instragram Feed</h6>
                        <ul class="instafeed d-flex flex-wrap">
                            <li><img src="img/i1.jpg" alt=""></li>
                            <li><img src="img/i2.jpg" alt=""></li>
                            <li><img src="img/i3.jpg" alt=""></li>
                            <li><img src="img/i4.jpg" alt=""></li>
                            <li><img src="img/i5.jpg" alt=""></li>
                            <li><img src="img/i6.jpg" alt=""></li>
                            <li><img src="img/i7.jpg" alt=""></li>
                            <li><img src="img/i8.jpg" alt=""></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>Follow Us</h6>
                        <p>Let us be social</p>
                        <div class="footer-social d-flex align-items-center">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-dribbble"></i></a>
                            <a href="#"><i class="fa fa-behance"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
                <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </footer>
    <!-- End footer Area -->
    <!--                var a = document.getElementsByClassName("option");
                    if (x.checked==false)
                        x.backgroundcolor="black";-->
    <!--               var a = document.getElementsByClassName("price-elements");
                   for(let int i=0;i<a.length;i++)
                   {
                       if (a[i].value==x.value)
                           console(x); 
                   }-->
    <script>
        function changePrice() {
            var a = document.getElementById("size-choice");
            var b = document.getElementById("displayprice");
            var c = document.getElementById("varid");
            c.value = a[a.selectedIndex].id;
            console.log(a.value);
            console.log(a[a.selectedIndex].id);
            console.log('gi cung dc');
            console.log(c.value);
            b.innerHTML = '$' + a.value;
        }
        function changeStar(x) {
            var a = document.getElementById("star1");
            var b = document.getElementById("star2");
            var c = document.getElementById("star3");
            var d = document.getElementById("star4");
            var e = document.getElementById("star5");
            var f = document.getElementById("starvalue");
            if (x == 1)
            {
                a.classList = "rating__star fa fa-star";
                b.classList = "rating__star far fa-star";
                c.classList = "rating__star far fa-star";
                d.classList = "rating__star far fa-star";
                e.classList = "rating__star far fa-star";
                f.value = "1";

            }
            if (x == 2)
            {
                a.classList = "rating__star fa fa-star";
                b.classList = "rating__star fa fa-star";
                c.classList = "rating__star far fa-star";
                d.classList = "rating__star far fa-star";
                e.classList = "rating__star far fa-star";
                f.value = "2";
            }
            if (x == 3)
            {
                a.classList = "rating__star fa fa-star";
                b.classList = "rating__star fa fa-star";
                c.classList = "rating__star fa fa-star";
                d.classList = "rating__star far fa-star";
                e.classList = "rating__star far fa-star";
                f.value = "3";
            }
            if (x == 4)
            {
                a.classList = "rating__star fa fa-star";
                b.classList = "rating__star fa fa-star";
                c.classList = "rating__star fa fa-star";
                d.classList = "rating__star fa fa-star";
                e.classList = "rating__star far fa-star";
                f.value = "4";
            }
            if (x == 5)
            {
                a.classList = "rating__star fa fa-star";
                b.classList = "rating__star fa fa-star";
                c.classList = "rating__star fa fa-star";
                d.classList = "rating__star fa fa-star";
                e.classList = "rating__star fa fa-star";
                f.value = "5";
            }
        }
    </script>

</body>

</html>
