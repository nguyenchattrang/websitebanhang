<%-- 
    Document   : order
    Created on : Mar 11, 2022, 5:55:19 PM
    Author     : ADMIN
--%>

<%@page import="model.Product_Variation"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
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
<%
ArrayList<Order> orders= (ArrayList<Order>)request.getAttribute("orders");

%>
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
                                    <a class="nav-link" href="login?link=order"><span><i class="fa-solid fa-user"></i></span></a>

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
                                        <li><a class="dropdown-item" href="order">Order List</a></li>
                                         <li><a class="dropdown-item" href="login?action=logout&link=order">Logout</a></li>
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
                    Order List
                </h1>
                <p>Home -> Order</p>
            </div>
        </section> 

    
    
    
    <%--<c:forEach items="${orders}" var="a">--%>
        <%for(Order a : orders){ %>
<section class="h-100 h-custom">
    <div class="card-body" >
        <div class="table-responsive">
          <table class="table table-bordered m-0">
            <thead>
              <tr>
                <!-- Set columns width -->
                <th class="text-center py-3 px-4" style="min-width: 400px;"> OrderID #<%=a.getId()%> </th>
                <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
               
              </tr>
            </thead>
            <tbody>
                <%for(Product_Variation b: a.getListpv()){ %>
                <%--<c:forEach items="${a.listpv}" var="b">--%>
              <tr>
                <td class="p-4">
                  <div class="media align-items-center">
                    <img src="<%=b.getProduct().getPicture()%>" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                    <div class="media-body">
                      <a href="Productdetails?pid=<%=b.getProduct().getId()%>" class="d-block text-dark"><%=b.getProduct().getName()%></a>
                      <small>
                      
                          <span class="text-muted">Size: </span> <%=b.getVar().getName()%> &nbsp;
               
                      </small>
                    </div>
                  </div>
                </td>
                <td class="text-right font-weight-semibold align-middle p-4">$<%=b.getVar().getPrice()%></td>
                <td class="text-right font-weight-semibold align-middle p-4"><%=b.getAmount()%></td>
                <td class="text-right font-weight-semibold align-middle p-4">$<%=b.getTotal()%> </td>
               
              </tr>
              <%}%>
              <%--</c:forEach>--%>
            </tbody>
          </table>
            
        </div>
        <!-- / Shopping cart table -->
    
        <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
          <div class="mt-4">
            <label class="text-muted font-weight-normal">Status:</label>
            <div class="text-large"><%=a.getStatus()%></div>
            <button style="width:100px;" type="submit" placeholder="ABC" class="btn-dark btn btn-outline-light">Got it?</button>
          </div>
            <div class="text-right mt-4">
                 <label class="text-muted font-weight-normal m-0">Shipping</label>
              <div class="text-large"><strong>$<%=a.getShippingfee()%></strong></div>
              <label class="text-muted font-weight-normal m-0">Total price</label>
              <div class="text-large"><strong>$<%=a.getPrice()+a.getShippingfee()%></strong></div>
            </div>
          </div>
        </div>
            <br><br><br><br>
  </section>
              <%}%>

    <!-- start footer Area -->
    <footer class="footer-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-3  col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>About Us</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                            ut labore dolore
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

                                    <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Enter Email '" required="" type="email">


                                    <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right"
                                            aria-hidden="true"></i></button>
                                    <div style="position: absolute; left: -5000px;">
                                        <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                            type="text">
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
                <p class="footer-text m-0">

</p>
            </div>
        </div>
    </footer>
    <!-- End footer Area -->

<script>
    function test(){
var a =document.getElementById('delete-button');
a.classList='fa-solid fa-skull-crossbones';
    }
    function test1(){
var a =document.getElementById('delete-button');
a.classList='fa-solid fa-skull';
    }
</script>
</body>

</html>
