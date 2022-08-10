<%-- 
    Document   : manageproductdetails
    Created on : Mar 12, 2022, 10:17:51 PM
    Author     : ADMIN
--%>

<%@page import="model.Variation"%>
<%@page import="model.Picture"%>
<%@page import="model.Brand"%>
<%@page import="model.SubCategory"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <title>Manage Product</title>

        <!--<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">-->


        <link href="../css/dashboard.css" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/ca0aaad838.js" crossorigin="anonymous"></script>

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

        <%Product a = (Product) request.getAttribute("product");
            ArrayList<Category> category = (ArrayList<Category>) request.getAttribute("category");
            ArrayList<SubCategory> subcategory = (ArrayList<SubCategory>) request.getAttribute("subcategory");
            ArrayList<Brand> brand = (ArrayList<Brand>) request.getAttribute("brand");
            ArrayList<Picture> pictures = (ArrayList<Picture>) request.getAttribute("pictures");
            ArrayList<Variation> variations = (ArrayList<Variation>) request.getAttribute("variations");

        %>
        <!-- Custom styles for this template -->

    </head>
    <body>

        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="order">Kitten Cosmestic Shop</a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
            <div class="navbar-nav">
                <div class="nav-item text-nowrap">
                    <a class="nav-link px-3" href="#">Sign out</a>
                </div>
            </div>
        </header>

        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="position-sticky pt-3">
                       <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link  " href="order">
                                    <span data-feather="file"></span>
                                    Orders
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active " href="product">
                                    <span data-feather="shopping-cart"></span>
                                    Products
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="account">
                                    <span data-feather="users"></span>
                                    Customers
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="rating">
                                    <span data-feather="star"></span>
                                    Rating
                                </a>
                            </li>  </ul>
                    </div>
                </nav>

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 my-3">
                    <div class="form-body">
                        <div class="row">
                            <div class="form-holder">
                                <div class="form-content">
                                    <div class="form-items">
                                        <button onclick="changePart(1)" style="width: 30%;" class="btn btn-dark btn-outline-light"> <h3>Summary</h3></button>
                                        <button onclick="changePart(2)" style="width: 30%;" class="btn btn-dark btn-outline-light"> <h3>Image</h3></button>
                                        <button onclick="changePart(3)" style="width: 30%;" class="btn btn-dark btn-outline-light"> <h3>Variation</h3></button>
                                        <div id="form1" class="my-5">
                                            <p>Fill in the data below.</p>
                                            <form action="update?id=<%=a.getId()%>&action=form1"  method="post" class="requires-validation" is-validated>
                                                <div class="col-md-12">
                                                    <label class="" for="id">Product ID </label>
                                                    <input disabled="true" value="<%=a.getId()%>" class="form-control" type="text" name="id" placeholder="ID" required>
                                                    <div class="valid-feedback">ID field is valid!</div>
                                                    <div class="invalid-feedback">ID field cannot be blank!</div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="name">Name </label>       <input class="form-control" id="name" value="<%=a.getName()%>" type="text" name="name" placeholder=" Name" required>
                                                    <div class="valid-feedback">Name field is valid!</div>
                                                    <div class="invalid-feedback">Name field cannot be blank!</div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="" for="sdesc">Short Description </label>
                                                    <input class="form-control" value="<%=a.getSdesc()%>" type="text" name="sdesc" placeholder="Short description" required>
                                                    <div class="valid-feedback">Short Description  field is valid!</div>
                                                    <div class="invalid-feedback">Short Description  field cannot be blank!</div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="longdesc">Long Description </label>
                                                    <textarea rows="4" cols="150"  id="longdesc" name="longdesc" ><%=a.getLongdesc()%></textarea>
                                                    <div class="valid-feedback">Long Description field is valid!</div>
                                                    <div class="invalid-feedback">Long Description field cannot be blank!</div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="category">Category </label>

                                                    <select name="category" class="form-select mt-3" required>
                                                        <%for (Category b : category) {%>
                                                        <option value="<%=b.getId()%>"  <%if (a.getCategoryid() == b.getId()) {%> selected <%}%>
                                                                ><%=b.getName()%></option>
                                                        <%}%>
                                                    </select>
                                                    <div class="valid-feedback">You selected a position!</div>
                                                    <div class="invalid-feedback">Please select a position!</div>


                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="subcategory">Subcategory </label>
                                                    <select name="subcategory" id="subcategory" class="form-select mt-3" required>
                                                        <%for (SubCategory b : subcategory) {%>
                                                        <option value="<%=b.getId()%>"  <%if (a.getSubcategoryid() == b.getId()) {%> selected <%}%>
                                                                ><%=b.getName()%></option>
                                                        <%}%>

                                                    </select>
                                                    <div class="valid-feedback">You selected a position!</div>
                                                    <div class="invalid-feedback">Please select a position!</div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="brand">Brand </label>
                                                    <select name="brand" id="brand" class="form-select mt-3" required>
                                                        <%for (Brand b : brand) {%>
                                                        <option value="<%=b.getId()%>"  <%if (a.getBrandid() == b.getId()) {%> selected <%}%>
                                                                ><%=b.getName()%></option>
                                                        <%}%>

                                                    </select>
                                                    <div class="valid-feedback">You selected a position!</div>
                                                    <div class="invalid-feedback">Please select a position!</div>
                                                </div>
                                                <div class="form-check mt-5" >
                                                    <input onchange="able()" id="cf1" class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                    <label for="cf1" class="form-check-label">I confirm that all data are correct</label>
                                                    <div class="invalid-feedback">Please confirm that the entered data are all correct!</div>
                                                </div>
                                                <input disabled style="color:black;" id="ip1" class="btn btn-dark btn-outline-light mb-5 mt-2" type="submit" value="Save Change">
                                            </form>
                                        </div>

                                        <div style="display:none" class="container my-5" id="form2">
                                            <div class="row align-items-center">
                                                <div class="col-md-1">
                                                    <h6>     Image ID  </h6>
                                                </div>
                                                <div class="col-md-3">
                                                    <h6>     Image Alt </h6>
                                                </div>
                                                <div class="col-md-3">
                                                    <h6>     Image Link </h6>
                                                </div >
                                                <div class="col-md-3">

                                                </div>
                                                <div class="col-md-2">
                                                    <h6>  Action  </h6>  
                                                </div >
                                            </div>
                                            <%for (Picture b : pictures) {%>
                                            <form action="../updateproduct?action=updateproduct&id=<%=b.getId()%>&pid=<%=a.getId()%>" method="post">
                                                <div class="row table-responsive my-5">
                                                    <div class="col-md-1">
                                                        <h3> <%=b.getId()%> 
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input disabled id="alt<%=b.getId()%>"  class="form-control" type="text" name="alt" value="<%=b.getAlt()%>" placeholder="Alt" required>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input id="link<%=b.getId()%>" disabled class="form-control" value="<%=b.getLink()%>" type="text" name="link" placeholder="Link" required>
                                                    </div >
                                                    <div class="col-md-3">
                                                        <img style="width: 50%" src="<%=b.getLink()%>" alt="">
                                                    </div >
                                                    <div class="col-md-2">
                                                        <span  style=" width: fit-content; display:block;" onclick="able2('alt<%=b.getId()%>', 'link<%=b.getId()%>', this, spanb<%=b.getId()%>)" id="spana<%=b.getId()%>"  class="btn btn-dark btn-outline-light"><i style="font-size:20px" id="itag<%=b.getId()%>" class="fa-solid fa-pen"></i></span>
                                                        <span style="width: fit-content; display:none;" id="spanb<%=b.getId()%>"  data-toggle="modal" data-target="#Modal<%=b.getId()%>" class="btn btn-success btn-outline-light"><i style="font-size:20px" id="itag<%=b.getId()%>" onclick="able2('alt<%=b.getId()%>', 'link<%=b.getId()%>', 'itag<%=b.getId()%>')"s class="fa-solid fa-box-archive"></i></span>
                                                        <span data-toggle="modal" data-target="#exampleModal<%=b.getId()%>" class="btn btn-danger"><i  style="font-size:20px" class="fa-regular fa-trash-can"></i></span>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="Modal<%=b.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                                <button class="btn btn-secondary" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Check the information before you save it.<br>
                                                                Alt: <%=b.getAlt()%><br>
                                                                <img style="width:50%" src ="<%=b.getLink()%>">
                                                            </div>
                                                            <div class=" modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <input type="submit" class="btn btn-danger" value="Save Changes"></a>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>    
                                                <div class="modal fade" id="exampleModal<%=b.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                                <button class="btn btn-secondary" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Are you sure you want to delete this picture. This action can not be undo.<br>
                                                                <img style="width:50%" src ="<%=b.getLink()%>">
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <a href="../updateproduct?action=deletepic&id=<%=b.getId()%>&pid=<%=a.getId()%>" class="btn btn-danger">Save Changes</a>
                                                            </div> 
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <%}%>




                                            <div id="changecolor" style="width: 200px;" class="btn btn-success mb-2" onclick="changeColor()">
                                                Add new picture
                                            </div>

                                            <div style="display:none;"  id="newpic" >
                                                <form action="../updateproduct?action=newpicture&id=<%=a.getId()%>"  method="post">
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 5%;" class="" for="linkk">Link </label>
                                                        <input id="linkk" name="newlink"  type="text">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label style="width: 5%;" class="" for="altt">Alt </label>
                                                        <input id="altt" name="newalt"
                                                               type="text">
                                                    </div>
                                                    <button type="submit" class="btn btn-success my-2">
                                                        <i class="fa-regular fa-square-plus"></i>   Save new picture
                                                    </button>
                                                </form>                                       
                                            </div>


                                        </div>


                                       
                                            <div style="display: none;" id="form3" class="container my-5">
                                                <div class="row align-items-center">

                                                    <div class="col-md-1">
                                                        <h6>     Variation ID </h6>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <h6>     Name </h6>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <h6>    Quantity </h6>
                                                    </div >
                                                    <div class="col-md-3">
                                                        <h6>   Price </h6>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <h6>  Action  </h6>  
                                                    </div >
                                                </div>

                                                
                                                <%for (Variation b : variations) {%>   
                                                <form action="../updateproduct?action=updatevariation&id=<%=b.getId()%>&pid=<%=a.getId()%>" method="post">
                                                    <div class="row table-responsive my-5">
                                                        <div class="col-md-1">
                                                            <h3> <%=b.getId()%> 
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input disabled id="name<%=b.getId()%>"  class="form-control" type="text" name="name" value="<%=b.getName()%>" placeholder="Name" required>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input id="quantity<%=b.getId()%>" disabled class="form-control" value="<%=b.getQuantity()%>" type="number" name="quantity" placeholder="Quantity" required>
                                                        </div >
                                                        <div class="col-md-3">
                                                            <input id="price<%=b.getId()%>" disabled class="form-control" value="<%=b.getPrice()%>" type="number" step="0.1" name="price" placeholder="Price" required>
                                                        </div >
                                                        
                                                        <div class="col-md-2">
                                                            <span  style=" width: fit-content; display:block;" onclick="able3('name<%=b.getId()%>', 'quantity<%=b.getId()%>','price<%=b.getId()%>', this, 'spand<%=b.getId()%>')" id="spanc<%=b.getId()%>"  class="btn btn-dark btn-outline-light"><i style="font-size:20px" id="itag<%=b.getId()%>" class="fa-solid fa-pen"></i></span>
                                                            <span style="width: fit-content; display:none;" id="spand<%=b.getId()%>"  data-toggle="modal" data-target="#VModal<%=b.getId()%>" class="btn btn-success btn-outline-light"><i style="font-size:20px" id="itag<%=b.getId()%>" onclick="able2('alt<%=b.getId()%>', 'link<%=b.getId()%>', 'itag<%=b.getId()%>')"s class="fa-solid fa-box-archive"></i></span>
                                                            <span data-toggle="modal" data-target="#VexampleModal<%=b.getId()%>" class="btn btn-danger"><i  style="font-size:20px" class="fa-regular fa-trash-can"></i></span>
                                                        </div>
                                                    </div>

                                                    <div class="modal fade" id="VModal<%=b.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                                    <button class="btn btn-secondary" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Check your old information before you save the new one.<br>
                                                                    Name: <%=b.getName()%><br>
                                                                    Price: <%=b.getPrice()%><br>
                                                                    Quantity: <%=b.getQuantity()%><br>
                                                                </div>
                                                                <div class=" modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    <input type="submit" class="btn btn-danger" value="Save Changes"></a>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>    
                                                    <div class="modal fade" id="VexampleModal<%=b.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                                    <button class="btn btn-secondary" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Are you sure you want to delete this size. This action can not be undo.<br>
                                                                    Check the information before you delete it.<br>
                                                                    Name: <%=b.getName()%><br>
                                                                    Price: <%=b.getPrice()%><br>
                                                                    Quantity: <%=b.getQuantity()%><br>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    <a href="../updateproduct?action=deletevar&id=<%=b.getId()%>&pid=<%=a.getId()%>" class="btn btn-danger">Save Changes</a>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <%}%>




                                            
                                                <div id="changecolor1" style="width: 200px;" class="btn btn-success mb-2" onclick="changeColor1()">
                                                    Add new size
                                                </div>
                                                <form action="../updateproduct?action=newvar&id=<%=a.getId()%>"  method="post" style="display:none;"  id="newsize" >
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 5%;" class="" for="name">Name </label>
                                                        <input  type="text" name="name" id="name">
                                                    </div>
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 5%;" class="" for="quantity">Quantity </label>
                                                        <input  type="number" name="quantity" id="quantity">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label style="width: 5%;" class="" for="price">Price </label>
                                                        <input  type="number" name="price" step="0.1" id="price">
                                                    </div>
                                                    <button type="submit" class="btn btn-success my-2">
                                                        <i class="fa-regular fa-square-plus"></i>   Save new size
                                                    </button>
                                                </form>

                                            </div>
                                           

                                        <!--                                        <div class="col-md-12 mt-3">
                                                                                    <label class="mb-3 mr-1" for="gender">Gender: </label>
                                        
                                                                                    <input type="radio" class="btn-check" name="gender" id="male" autocomplete="off" required>
                                                                                    <label class="btn btn-sm btn-outline-secondary" for="male">Male</label>
                                        
                                                                                    <input type="radio" class="btn-check" name="gender" id="female" autocomplete="off" required>
                                                                                    <label class="btn btn-sm btn-outline-secondary" for="female">Female</label>
                                        
                                                                                    <input type="radio" class="btn-check" name="gender" id="secret" autocomplete="off" required>
                                                                                    <label class="btn btn-sm btn-outline-secondary" for="secret">Secret</label>
                                                                                    <div class="valid-feedback mv-up">You selected a gender!</div>
                                                                                    <div class="invalid-feedback mv-up">Please select a gender!</div>
                                                                                </div>-->




                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Modal -->

                </main>
            </div>
        </div>
        <script>$('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })</script>

        <script>
            function changePart(x) {
                var a = document.getElementById("form1");
                var b = document.getElementById("form2");
                var c = document.getElementById("form3");
                if (x == 1)
                {
                    a.style.display = "block";
                    b.style.display = "none";
                    c.style.display = "none";
                }
                if (x == 2)
                {
                    a.style.display = "none";
                    b.style.display = "block";
                    c.style.display = "none";
                }
                if (x == 3)
                {
                    a.style.display = "none";
                    b.style.display = "none";
                    c.style.display = "block";
                }

            }
            function changeColor() {
                var a = document.getElementById("changecolor");
                var b = document.getElementById("newpic");
                if (a.classList == "btn btn-success mb-2")
                {
                    a.classList = "btn btn-secondary mb-2";
                    a.innerHTML = "Close";
                    b.style.display = "block";
                } else {
                    a.classList = "btn btn-success mb-2";
                    b.style.display = "none";
                    a.innerHTML = "Add new picture";
                }

            }
            function changeColor1() {
                var a = document.getElementById("changecolor1");
                var b = document.getElementById("newsize");
                if (a.classList == "btn btn-success mb-2")
                {
                    a.classList = "btn btn-secondary mb-2";
                    a.innerHTML = "Close";
                    b.style.display = "block";
                } else {
                    a.classList = "btn btn-success mb-2";
                    b.style.display = "none";
                    a.innerHTML = "Add new picture";
                }

            }
            function able() {
                var c = document.getElementById("cf1");
                var e = document.getElementById("ip1");
                var d = document.getElementById("cf2");
                var g = document.getElementById("ip2");
                var f = document.getElementById("cf3");
                var k = document.getElementById("ip3");

                if (c.checked == true)
                {

                    e.removeAttribute('disabled');
                    e.removeAttribute('style');
                } else
                {

                    e.setAttribute('disabled', 'checked');
                    e.style.color = "black";
                }
                if (d.checked == true)
                {

                    g.removeAttribute('disabled');
                    g.removeAttribute('style');
                } else
                {

                    g.setAttribute('disabled', 'checked');
                    g.style.color = "black";
                }
                if (f.checked == true)
                {

                    k.removeAttribute('disabled');
                    k.removeAttribute('style');
                } else
                {

                    k.setAttribute('disabled', 'checked');
                    k.style.color = "black";
                }
            }
            function able2(x, y, z, q) {
                var a = document.getElementById(x);
                var b = document.getElementById(y);
//                var c = document.getElementById(z);
                var d = document.getElementById(q);
                if (a.disabled == true)
                {

                    a.removeAttribute('disabled');
                    b.removeAttribute('disabled');
//                    c.classList = "fa-solid fa-box-archive";
//                    c.style.color = "green";
                    z.style.display = "none";
                    q.style.display = "block";
                }
//                else
//                {
//
//                    a.setAttribute('disabled', 'checked');
//                    b.setAttribute('disabled', 'checked');
//                    c.classList = "fa-solid fa-pen"
//                    c.style.color = "black";
//                }
            }
            function able3(x, y, z, q,k) {
                var a = document.getElementById(x);
                var b = document.getElementById(y);
                var c = document.getElementById(z);
                var g = document.getElementById(k);
                if (a.disabled == true)
                {

                    a.removeAttribute('disabled');
                    b.removeAttribute('disabled');
                    c.removeAttribute('disabled');
//                    c.classList = "fa-solid fa-box-archive";
//                    c.style.color = "green";
                    q.style.display = "none";
                    g.style.display = "block";
                    console(g);
                }
//                else
//                {
//
//                    a.setAttribute('disabled', 'checked');
//                    b.setAttribute('disabled', 'checked');
//                    c.classList = "fa-solid fa-pen"
//                    c.style.color = "black";
//                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous">

        </script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
        <script src="../js/dashboard.js"></script>
    </body>
</html>

