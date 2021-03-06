<%-- 
    Document   : category
    Created on : Mar 6, 2022, 10:13:27 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
        <% String[] b = null;%>
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
                                <a class="nav-link " aria-current="page" href="home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="category">Category</a>
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
                                    <a class="nav-link" href="login?link=category"><span><i class="fa-solid fa-user"></i></span></a>

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
                    Shop Category
                </h1>
                <p>Home -> Shop -> Category</p>
            </div>
        </section>

        <div class="wrapper">
            <div class="d-flex row">
                <div class="h3 col-8">Shop Categories</div>
                <div class=" views col-4 d-flex align-items-center">
                    <span class="btn "> <span class="fas fa-th"></span>
                        Grid view
                    </span>
                    <!--        <span class="btn"> <span class="fas fa-list-ul"></span>
                            List view 
                          </span>-->
                    <span class="purple-label ">${list.size()}</span> Products
                </div>
            </div>
            <div class="d-lg-flex align-items-lg-center pt-2">
                <!--      <div class="form-inline d-flex align-items-center my-2 mr-lg-2 radio bg-light border"> <label class="options">Most
                          Popular <input type="radio" name="radio"> <span class="checkmark"></span> </label> <label
                          class="options">Cheapest <input type="radio" name="radio" checked> <span class="checkmark"></span> </label>
                      </div>
                      <div class="form-inline d-flex align-items-center my-2 checkbox bg-light border mx-lg-2"> <label class="tick">Farm
                          <input type="checkbox" checked="checked"> <span class="check"></span> </label> <span
                          class="text-success px-2 count"> 328</span> </div>
                      <div class="form-inline d-flex align-items-center my-2 checkbox bg-light border mx-lg-2"> <label class="tick">Bio
                          <input type="checkbox"> <span class="check"></span> </label> <span class="text-success px-2 count"> 72</span>
                      </div>-->
                <!--      <div class="form-inline d-flex align-items-center my-2 checkbox bg-light border mx-lg-2"> <label
                          class="tick">Czech republic <input type="checkbox"> <span class="check"></span> </label> <span
                          class="border px-1 mx-2 mr-3 font-weight-bold count"> 12</span> <select name="country" id="country"
                          class="bg-light">
                          <option value="" hidden>Country</option>
                          <option value="India">India</option>
                          <option value="USA">USA</option>
                          <option value="Uk">UK</option>
                        </select> </div>-->
            </div>
            <div class="d-sm-flex align-items-sm-center pt-2 clear">
                <div id="filter-label" class="text-muted filter-label">Applied Filters:</div>
                <div class="purple-label font-weight-bold p-0 px-1 mx-sm-1 mx-0 my-sm-0 my-2">Choose Filter <span
                        class=" px-1 close">&times;</span> </div>

            </div>
            <div class="filters"> <button class="btn btn-dark btn-outline-light">Filter<span
                        class="px-1 fas fa-filter"></span></button> </div>
            <div class=" py-md-0 py-3 mb-5">
                <section id="sidebar">
                    <div class="py-3">
                        <a href="category"> <h5 class="font-weight-bold">Categories</h5> </a> 
                        <ul class="list-group">
                            </a>
                            <c:forEach var="category" items="${category}" >
                                <a href="category?cid=${category.id}">
                                    <li
                                        class=" ${cid==category.id ? "active":""}  list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
                                        ${category.name} <span class="badge badge-primary badge-pill">${category.total}</span> </li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="py-3">
                        <h5 class="font-weight-bold">Sub Category</h5>
                        <form class="brand" onChange="Filter('${cid}')" id="subcategory">
                            <c:forEach var="subcategory" items="${subcategory}" >
                                <div  class=" form-inline d-flex align-items-center py-1"> <label class="tick">${subcategory.name} <input
                                            class="subcategory"  type="checkbox"> <span class="check"></span> </label> </div>
                                    </c:forEach>
                        </form>
                    </div>
                    <div class="py-3">
                        <h5 class="font-weight-bold">Brands</h5>
                        <form class="brand" onchange="Filter('${cid}')">
                            <c:forEach var="brand" items="${brand}" >
                                <div class="form-inline d-flex align-items-center py-1"> <label class="tick">${brand.name}<input
                                            class="brand-product"   type="checkbox"> <span class="check"></span> </label> </div>
                                    </c:forEach>
                        </form>
                    </div>
                    <div class="py-3">
<!--                        <h5 class="font-weight-bold">Rating</h5>
                        <form class="rating">
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span
                                        class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                        class="fas fa-star"></span> <span class="fas fa-star"></span> <input type="checkbox"> <span
                                        class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span
                                        class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                        class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox">
                                    <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span
                                        class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                        class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input
                                        type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span
                                        class="fas fa-star"></span> <span class="fas fa-star"></span> <span
                                        class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span
                                        class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span>
                                </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span
                                        class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span
                                        class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span
                                        class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span>
                                </label> </div>
                        </form>-->
                    </div>
                </section> <!-- Products Section -->
                <section id="products">
                    <div class="container py-3">
                        <div class="row" id="content" >
                            <c:forEach items="${list}" var="a"  >

                                <div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 mb-5">
                                    <a href="Productdetails?pid=${a.id}">
                                        <div class="card"> <div class="card-img-top" ><img class="img-fluid"
                                                                                           src="${a.getPicture()}">
                                            </div> 
                                            <div class="card-body">
                                                <h6 class="font-weight-bold pt-1 text-center">${a.name}</h6>
                                                <div class="text-muted description">${a.sdesc}</div>
                                                <div class="d-flex align-items-center product"> 
                                                    <c:set var = "b" value = "${a.getRating()}" ></c:set>
                                                     <c:if test="${b==0}">
                                                        <span class="far fa-star">No reviews</span> 
                                                    </c:if>  
                                                    <c:if test="${1<=b}">
                                                        <span class="fas fa-star"></span> 
                                                    </c:if>  
                                                    <c:if test="${2<=b}">
                                                        <span class="fas fa-star"></span> 
                                                    </c:if>  
                                                    <c:if test="${3<=b}">
                                                        <span class="fas fa-star"></span>
                                                    </c:if>  
                                                    <c:if test="${4<=b}">
                                                        <span class="fas fa-star"></span>
                                                    </c:if>  
                                                    <c:if test="${5<=b}">
                                                        <span class="far fa-star"></span> 
                                                    </c:if>  
                                                </div>
                                                <div class="d-flex align-items-center justify-content-between pt-3 bottom-price">
                                                    <div class="d-flex flex-column">
                                                        <c:set var="price" value="${a.getLowestandHighestPrice()}"></c:set>
                                                        <div class="h6">$${price[0]}<c:if test="${price[1]!=null}"><br>$${price[1]}</c:if></div>

                                                        </div>
                                                        <div class="btn btn-dark btn-outline-light">Add To Cart</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                            </c:forEach>
                        </div>
                    </div>

<!--                    <div class="pagination">
                        <a href="#">&laquo;</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">&raquo;</a>

                    </div>-->
                </section>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script> function Filter(x) {
                                var filterlabel = document.getElementById("filter-label");

                                var a = document.getElementsByClassName("subcategory");
                                var c = document.getElementsByClassName("brand-product");
                                var b = "";
                                var d = "";
                                for (let i = 0; i < a.length; i++)
                                {
                                    if (a[i].checked == true)
                                    {
                                        filterlabel.innerHTML = '<div class="purple-label font-weight-bold p-0 px-1 mx-sm-1 mx-0 my-sm-0 my-2">' + a[i].innerHTML + ' <span class=" px-1 close">&times;</span> </div>';
                                        if (b === "")
                                            b += 'subcategory_id=' + (i + 1);
                                        else
                                            b += ' or subcategory_id=' + (i + 1);
                                    }
                                }

                                for (let i = 0; i < c.length; i++)
                                {
                                    if (c[i].checked == true)
                                    {
                                        if (d === "")
                                            d += 'brand_id=' + (i + 1);
                                        else
                                            d += ' or brand_id=' + (i + 1);
                                    }
                                }
                                console.log(b);
                                console.log(d);


                                $.ajax({
                                    url: "Filter",
                                    type: 'get',
                                    data: {subcategory: b, brand: d,category:x},
                                    async: true,
                                    success: function (response) {
                                        var row = document.getElementById("content");
                                        row.innerHTML = response;
                                    }
                                });
                            }</script>

        <!-- <div class="container category my-5">
          <div class="row">
      
            <div class="col-md-4 side-bar">
              <div class="product-category">
                <div class="head">Browse Categories</div>
                <ul>
                  <li>
                    <a href="">Makeup Products</a>
                  </li>
                  <li>
                    <a href="">Skincare Products</a>
                  </li>
                </ul>
              </div>
      
      
      
      
              <div class="product-filter">
                <div class="head">Product Filters</div>
                <div class="sub-head">Brands
                </div>
                <div class="choice">
                  <ul>
      
                    <li>
                      <input type="checkbox" name="" id="1"> <label for="1">a</label>
                    </li>
                    <li>
                      <input type="checkbox" name="" id="2"> <label for="2">b</label>
                    </li>
                    <li>
                      <input type="checkbox" name="" id="3"> <label for="3">c</label>
                    </li>
                  </ul>
                </div>
              </div>
      
              <div class="sub-head">Price
      
              </div>
      
              <div class="middle">
                <div class="multi-range-slider">
                  <input type="range" id="input-left" min="0" max="5000000" value="25000" step="50000" onchange="a()">
                  <input type="range" id="input-right" min="0" max="5000000" value="4000000" step="50000" onchange="b()">
      
                  <div class="slider">
                    <div class="track"></div>
                    <div class="range"></div>
                    <div class="thumb left"></div>
                    <div class="thumb right" onchange="b()"></div>
                  </div>
                </div>
                <div class="price-info">
                  Price from <p id="min">25000</p> to <p id="max">4000000</p>
                </div>
      
              </div>
            </div>
            <div class="col-md-8">
      
              <div class="filter-bar">
                <div class="head">
                  <p class="left">PRODUCTS LIST</p>
                  <p>Total Products x </p>
                  <Select>
                    <Option>
                      Price(High To Low)
                    </Option>
                    <Option>
                      Price(Low To High)
                    </Option>
                    <Option>
                      Price(Best Seller)
                    </Option>
                    <Option>
                      Top Rated
                    </Option>
                    <Option>
                      New
                    </Option>
                  </Select>
                </div>
              </div>
              <div class="product-area">
      
                <div class="row line-product">
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                </div>
                <div class="row line-product">
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                </div>
                <div class="row line-product">
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                  <div class="col-4">
                    <img src="img/Kitten.png" class="img-fluid" alt="...">
                    <div class="product-details ms-3">
                      <h6 class="product-name">Name something</h6>
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
                  </div>
                </div>
                <div class="head">
                  <div class="page">
                    <p>Total Page x</p>
                    <button>
                      Prev
                    </button>
                    <p>1</p>
                    <button>
                      Next
                    </button>
                  </div>
                </div>
              </div> -->
        <footer class="container-fluid text-center clear ">
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
        <script>


            var inputLeft = document.getElementById("input-left");
            var inputRight = document.getElementById("input-right");



            var thumbLeft = document.querySelector(".slider > .thumb.left");
            var thumbRight = document.querySelector(".slider > .thumb.right");
            var range = document.querySelector(".slider > .range");

            function setLeftValue() {
                var _this = inputLeft,
                        min = parseInt(_this.min),
                        max = parseInt(_this.max);

                _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);

                var percent = ((_this.value - min) / (max - min)) * 100;

                thumbLeft.style.left = percent + "%";
                range.style.left = percent + "%";
            }
            setLeftValue();

            function setRightValue() {
                var _this = inputRight,
                        min = parseInt(_this.min),
                        max = parseInt(_this.max);

                _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);

                var percent = ((_this.value - min) / (max - min)) * 100;

                thumbRight.style.right = (100 - percent) + "%";
                range.style.right = (100 - percent) + "%";
            }
            setRightValue();

            inputLeft.addEventListener("input", setLeftValue);
            inputRight.addEventListener("input", setRightValue);

            inputLeft.addEventListener("mouseover", function () {
                thumbLeft.classList.add("hover");
            });
            inputLeft.addEventListener("mouseout", function () {
                thumbLeft.classList.remove("hover");
            });
            inputLeft.addEventListener("mousedown", function () {
                thumbLeft.classList.add("active");
            });
            inputLeft.addEventListener("mouseup", function () {
                thumbLeft.classList.remove("active");
            });

            inputRight.addEventListener("mouseover", function () {
                thumbRight.classList.add("hover");
            });
            inputRight.addEventListener("mouseout", function () {
                thumbRight.classList.remove("hover");
            });
            inputRight.addEventListener("mousedown", function () {
                thumbRight.classList.add("active");
            });
            inputRight.addEventListener("mouseup", function () {
                thumbRight.classList.remove("active");
            });
        </script>
    </body>

</html>
