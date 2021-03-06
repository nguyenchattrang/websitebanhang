<%-- 
    Document   : cart
    Created on : Mar 8, 2022, 10:52:48 AM
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
                                    <a class="nav-link" href="login?link=cart"><span><i class="fa-solid fa-user"></i></span></a>

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
        <section class="h-100 h-custom">
    <div class="container h-100 py-5">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div  id="tbrow" class="col">
  
            <div  class="table-responsive">
            <table class="table ">
              <thead>
                <tr>
                  <th scope="col" class="h5">Shopping Bag</th>
                  <th scope="col">Size</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Unit Price</th>
                  <th scope="col">Total Price</th>
                  <th scope="col">Delete</th>
                </tr>
              </thead>
              <tbody >
                  <c:set var="total" value="${0}"/>
                  <c:forEach items="${cart}" var="a">
                      <c:set var="total" value="${total + a.getTotal()}" />
                      <tr class="cart-section">
                    <th  scope="row" >
                    <div class="d-flex align-items-center">
                      <img src="${a.getPicture()}" class="img-fluid rounded-3" style="width: 120px;" alt="Book">
                      <div class="flex-column ms-4">
                        <p class="mb-2">${a.product.name}</p>
                        <p class="mb-0">${a.categoryname}</p>
                      </div>
                    </div>
                  </th>
                  <td  class="align-middle">
                    <p class="mb-0" style="font-weight: 500;">${a.var.name}</p>
                  </td>
                  <td class="align-middle ">
                    <div class="d-flex flex-row">

                  <button class="btn btn-link px-2"
                          onclick="updateQuantity(this,1)" value="${a.var.id}">
                        <i class="fas fa-minus"></i>
                      </button>
  
                      <input id="form1" min="1" name="quantity" value="${a.amount}" type="number"
                        class="form-control form-control-sm" disabled style="width: 50px;" />
  
                      <button class="btn btn-link px-2"
                        onclick="updateQuantity(this,2)" value="${a.var.id}">
                        <i class="fas fa-plus"></i>
                      </button>
                    </div>
                  </td>
                  <td class="align-middle">
                    <p class="mb-0" style="font-weight: 500;">$${a.var.price}</p>
                  </td>
                  <td class="align-middle ">
                      <p class="mb-0" style="font-weight: 500;">$${a.getTotal()}</p>
                  </td>
                  <td class="align-middle">
                      <a class="b-b-b" href="cart?action=remove&vid=${a.var.id}"> <i id="delete-button" class="fa-solid fa-skull" onmouseover="test(this)" onmouseout="test1(this)"></i>  </a>
                            
                  </td>
                </tr>
                </c:forEach>
               
               
              </tbody>
            </table>
          </div>
  
          <div class="bottombox shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
            <div class="bottombox-body p-4">
  
              <div class="row">
                <div class="col-lg-4 col-xl-3">
                  <div class="d-flex justify-content-between" style="font-weight: 500;">
                    <p class="mb-2">Subtotal</p>
                    <p class="mb-2">$${total}</p>
                  </div>
  
                  <div class="d-flex justify-content-between" style="font-weight: 500;">
                    <p class="mb-0">Shipping</p>
                    <p class="mb-0">$2.99</p>
                  </div>
  
                  <hr class="my-4">
  
                  <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                    <p class="mb-2">Total (tax included)</p>
                    <p class="mb-2">$${total+2.99}</p>
                  </div>
  
                  <a href="checkout" type="button" class="btn btn-dark btn-outline-light">
                    <div class="d-flex justify-content-between">
                      <span>Checkout</span>
                      <span>$${total+2.99}</span>
                    </div>
                  </a>
  
                </div>
                    <c:if test="${messge!=null}">
                  <div>${message}</div>
                  </c:if>
                  
              </div>
  
            </div>
          </div>
  
        </div>
      </div>
    </div>
  </section>
<!--        <div class="cover-card">
            <div class="cardd">
                <div class="row">
                    <div class="col-md-12 cart">
                        <div class="title">
                            <div class="row">
                                <div class="col">
                                    <h4><b>Shopping Cart</b></h4>
                                </div>
                                <div class="col align-self-center text-right text-muted">3 items</div>
                            </div>
                        </div>
                        <div class="row">
                        <div class=" border-top border-bottom col-md-8">
             
                        <div class="row">
                            <c:forEach items="${cart}" var ="a" >
                            <div class="row main align-items-center">
                                <div class="col-2"><img class="img-fluid" src="${a.getPicture()}"></div>
                                <div class="col">
                                    <div class="row text-muted">Shirt</div>
                                    <div class="row">${a.product.name}</div>
                                </div>
                                <div class="qtt col">
                              <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
							 class="up btn-light btn-outline-dark" type="button"><i class="fa-solid fa-angle-up"></i></button>
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 1 ) result.value--;return false;"
							 class="down btn-light btn-outline-dark" type="button"><i class="fa-solid fa-angle-down"></i></button>   
                                </div>
                                <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                            </div>
                                </c:forEach>
                        </div>
                        <div class="row border-top border-bottom">
                            <div class="row main align-items-center">
                                <div class="col-2"><img class="img-fluid" src="img/Kitten.png""></div>
                                <div class="col">
                                    <div class="row text-muted">Shirt</div>
                                    <div class="row">Cotton T-shirt</div>
                                </div>
                                <div class="col"> <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a> </div>
                                <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                            </div>
                        </div>
                        <div class="back-to-shop"><a href="#">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
                    </div>
                        <div class="col-md-4 summary">
                        <div>
                            <h5><b>Summary</b></h5>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col" style="padding-left:10px;">ITEMS 3</div>
                            <div class="col text-right">&euro; 132.00</div>
                        </div>
                        <form>
                            <p>SHIPPING</p> <select class="select-code">
                                <option class="text-muted">Standard-Delivery- &euro;5.00</option>
                            </select >
                            <p>GIVE CODE</p> <input class="input-code" id="code" placeholder="Enter your code">
                        </form>
                        <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                            <div class="col">TOTAL PRICE</div>
                            <div class="col text-right">&euro; 137.00</div>
                        </div> <button class="btn btn-light btn-outline-dark">CHECKOUT</button>
                    </div>
                </div>
                        </div>
            </div>
        </div>

         start footer Area -->
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

                                         <div class="col-lg-4 col-md-4">
                                                                                                            <button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
                                                                                                    </div>  
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    function test(x){

x.classList='fa-solid fa-skull-crossbones';
    }
    function test1(x){

x.classList='fa-solid fa-skull';
    }
function updateQuantity(x,y)
{
    
    input = document.getElementById("form1");
     vid=x.value;
    console.log(x.value);
 
    
    if(y===1){
        
   
    $.ajax({
    url: "cart?action=low",
    type: 'get',
    data:{vid:vid  },
    async: true,
    success: function(response) {
        row= document.getElementById("tbrow");
row.innerHTML=response;

    }
});
 }
     else if(y===2){
        
    input = document.getElementById("form1");
     vid=x.value;
    console.log(x.value);
 
    
    if(y===1){
        
   
    $.ajax({
    url: "cart?action=low",
    type: 'get',
    data:{vid:vid  },
    async: true,
    success: function(response) {
        row= document.getElementById("tbrow");
row.innerHTML=response;

    }
});
 }
    $.ajax({
    url: "cart?action=high",
    type: 'get',
    data:{vid:vid  },
    async: true,
    success: function(response) {
        row= document.getElementById("tbrow");
row.innerHTML=response;
    }
});
 }

}


    
</script>
    </body>

</html>
