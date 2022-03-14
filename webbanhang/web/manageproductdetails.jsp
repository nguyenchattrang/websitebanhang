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
        <title>Dashboard Template · Bootstrap v5.1</title>

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
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Company name</a>
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
                                <a class="nav-link " href="#">
                                    <span data-feather="file"></span>
                                    Orders
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <span data-feather="shopping-cart"></span>
                                    Products
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="users"></span>
                                    Customers
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="bar-chart-2"></span>
                                    Reports
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="layers"></span>
                                    Integrations
                                </a>
                            </li>
                        </ul>

                        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                            <span>Saved reports</span>
                            <a class="link-secondary" href="#" aria-label="Add a new report">
                                <span data-feather="plus-circle"></span>
                            </a>
                        </h6>
                        <ul class="nav flex-column mb-2">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="file-text"></span>
                                    Current month
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="file-text"></span>
                                    Last quarter
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="file-text"></span>
                                    Social engagement
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="file-text"></span>
                                    Year-end sale
                                </a>
                            </li>
                        </ul>
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


                                        <div style="display:none;" id="form2">
                                            
                                                <div class="table-responsive my-5">
                                                    <table class="table table-striped table-sm">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Image ID</th>
                                                                <th scope="col">Image Alt</th>
                                                                <th scope="col">Image Link</th>
                                                                <th scope="col"></th>
                                                                <th scope="col">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        
                                                            <%for (Picture b : pictures) {%>
                                                            
                                                            <tr class="align-middle" >
                                                               
                                                                <td><%=b.getId()%></td>
                                                                <td  > <input disabled id="alt<%=b.getId()%>"  class="form-control" type="text" name="email" value="<%=b.getAlt()%>" placeholder="E-mail Address" required></td>
                                                                <td><input id="link<%=b.getId()%>" disabled class="form-control" value="<%=b.getLink()%>" type="email" name="email" placeholder="E-mail Address" required></td>
                                                                <td style="width:20%"><img style="width: 50%" src="<%=b.getLink()%>" alt=""></td>
                                                                <td><i id="itag<%=b.getId()%>" onclick="able2('alt<%=b.getId()%>', 'link<%=b.getId()%>', 'itag<%=b.getId()%>')"s class="fa-solid fa-pen mx-3"></i>

                                                                    <span data-toggle="modal" data-target="#exampleModal<%=b.getId()%>" class="btn btn-danger"><i  style="font-size:20px" class="fa-regular fa-trash-can"></i></span>


                                                                </td>
                                                               
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
                                                                        <a href="#?id=<%=b.getId()%>" type="button" class="btn btn-danger">Save changes</a>
                                                                    </div>
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </tr>
                                                        <%}%>
                                                        
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id="changecolor" style="width: 200px;" class="btn btn-success mb-2" onclick="changeColor()">
                                                    Add new picture
                                                </div>
                                                        
                                                        <div style="display:none;"  id="newpic" >
                                                        <form action="a" >
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 5%;" class="" for="brand">Link </label>
                                                        <input  type="text">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label style="width: 5%;" class="" for="brand">Alt </label>
                                                        <input  type="text">
                                                    </div>
                                                    <div class="btn btn-success my-2">
                                                        <i class="fa-regular fa-square-plus"></i>   Save new picture
                                                    </div>
                                                         </form>                                       
                                                                </div>
                                                
                                                <div class="form-check mt-5" >
                                                    <input onchange="able()" id="cf2" class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                    <label for="cf2" class="form-check-label">I confirm that all data are correct</label>
                                                    <div class="invalid-feedback">Please confirm that the entered data are all correct!</div>
                                                </div>
                                                <input id="ip2" class="btn btn-dark btn-outline-light mb-5 mt-2" type="submit" value="Save Change">
                                        </div>
                                        <div style="display:none;" id="form3"> 

                                            <div  class="table-responsive my-5">
                                                <table class="table table-striped table-sm">
                                                    <thead>

                                                        <tr>
                                                            <th scope="col">Variation ID</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Delete</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%for (Variation b : variations) {%>                                                 
                                                        <tr class="align-middle">
                                                            <td><%=b.getId()%></td>
                                                            <td  > <input class="form-control" value="<%=b.getName()%>" type="text" name="email" placeholder="E-mail Address" required></td>
                                                            <td><input class="form-control" value="<%=b.getQuantity()%>" type="number" name="email" placeholder="E-mail Address" required></td>
                                                            <td><input class="form-control" value="<%=b.getPrice()%>" type="number" name="email" placeholder="E-mail Address" required></td>
                                                            <td>X</td>
                                                        </tr>
                                                        <%}%>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="changecolor1" style="width: 200px;" class="btn btn-success mb-2" onclick="changeColor1()">
                                                Add new size
                                            </div>
                                            <form style="display:none;"  id="newsize" >
                                                <div class="col-md-12 mb-2">
                                                    <label style="width: 5%;" class="" for="brand">Name </label>
                                                    <input  type="text">
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <label style="width: 5%;" class="" for="brand">Quantity </label>
                                                    <input  type="text">
                                                </div>
                                                <div class="col-md-12">
                                                    <label style="width: 5%;" class="" for="brand">Price </label>
                                                    <input  type="text">
                                                </div>
                                                <div class="btn btn-success my-2">
                                                    <i class="fa-regular fa-square-plus"></i>   Save new size
                                                </div>
                                            </form>
                                            <div class="form-check mt-5" >
                                                <input onchange="able()" id="cf3" class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                <label for="cf3" class="form-check-label">I confirm that all data are correct</label>
                                                <div class="invalid-feedback">Please confirm that the entered data are all correct!</div>
                                            </div>
                                            <input id="ip3" class="btn btn-dark btn-outline-light mb-5 mt-2" type="submit" value="Save Change">
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
            function able2(x, y, z) {
                var a = document.getElementById(x);
                var b = document.getElementById(y);
                var c = document.getElementById(z);
                if (a.disabled == true)
                {
                    console.log('aaa');
                    a.removeAttribute('disabled');
                    b.removeAttribute('disabled');
                    c.classList = "fa-solid fa-box-archive mx-3";
                    c.style.color = "green";
                } else
                {

                    a.setAttribute('disabled', 'checked');
                    b.setAttribute('disabled', 'checked');
                    c.classList = "fa-solid fa-pen mx-3"
                    c.style.color = "black";
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous">

        </script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
        <script src="js/dashboard.js"></script>
    </body>
</html>

