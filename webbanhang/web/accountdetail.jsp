<%-- 
    Document   : manageproductdetails
    Created on : Mar 12, 2022, 10:17:51 PM
    Author     : ADMIN
--%>

<%@page import="model.Account"%>
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

        <%
            Account a = (Account) request.getAttribute("account");


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
                                <a class="nav-link  " href="product">
                                    <span data-feather="shopping-cart"></span>
                                    Products
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="account">
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
                                       
                                        <div id="form1" class="my-5">
                                            <p>Fill in the data below.</p>
                                            <form action="accountdetails?id=<%=a.getId()%>&action=update"  method="post" class="requires-validation" is-validated>
                                                <div class="col-md-12">
                                                    <label class="" for="id">Product ID </label>
                                                    <input disabled="true" value="<%=a.getId()%>" class="form-control" type="text" name="id" placeholder="ID" required>
                                                    <div class="valid-feedback">ID field is valid!</div>
                                                    <div class="invalid-feedback">ID field cannot be blank!</div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="username">Name </label>       <input class="form-control" id="name" value="<%=a.getUsername()%>" type="text" name="username" placeholder=" Name" required>
                                                    <div class="valid-feedback">Name field is valid!</div>
                                                    <div class="invalid-feedback">Name field cannot be blank!</div>
                                                </div>
                                                      <div class="col-md-12">
                                                    <label class="" for="firstname">Firstname </label>       <input class="form-control" id="firstname" value="<%=a.getFirstname()%>" type="text" name="firstname" placeholder=" Name" required>
                                                    <div class="valid-feedback">Name field is valid!</div>
                                                    <div class="invalid-feedback">Name field cannot be blank!</div>
                                                </div>
                                                      <div class="col-md-12">
                                                    <label class="" for="lastname">Lastname </label>       <input class="form-control" id="lastname" value="<%=a.getLastname()%>" type="text" name="lastname" placeholder=" Name" required>
                                                    <div class="valid-feedback">Name field is valid!</div>
                                                    <div class="invalid-feedback">Name field cannot be blank!</div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="" for="email">Email </label>
                                                    <input class="form-control" value="<%=a.getEmail()%>" type="text" name="email" placeholder="Short description" required>
                                                    <div class="valid-feedback">Short Description  field is valid!</div>
                                                    <div class="invalid-feedback">Short Description  field cannot be blank!</div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="address">Address </label>
                                                    <input  class="form-control" value="<%=a.getAddress1()%>" type="text" name="address" placeholder="Short description" required>
                                                    <div class="valid-feedback">Short Description  field is valid!</div>
                                                    <div class="invalid-feedback">Short Description  field cannot be blank!</div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="" for="address2">Address 2 </label>
                                                    <input  class="form-control" value="<%=a.getAddress2()%>" type="text" name="address2" placeholder="Short description" required>
                                                    <div class="valid-feedback">Short Description  field is valid!</div>
                                                    <div class="invalid-feedback">Short Description  field cannot be blank!</div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="" for="phone">Phone </label>
                                                    <input  class="form-control" value="<%=a.getPhonenumber()%>" type="text" name="phone" placeholder="Short description" required>
                                                    <div class="valid-feedback">Short Description  field is valid!</div>
                                                    <div class="invalid-feedback">Short Description  field cannot be blank!</div>
                                                </div>


                                                <div class="col-md-12">
                                                    <label class="" for="city">City</label>
                                                    <input   class="form-control" value="<%=a.getCity()%>" type="text" name="city" placeholder="Short description" required>
                                                    <div class="valid-feedback">Short Description  field is valid!</div>
                                                    <div class="invalid-feedback">Short Description  field cannot be blank!</div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="" for="zip">Zip</label>
                                                    <input  class="form-control" value="<%=a.getZip()%>" type="text" name="zip" placeholder="Short description" required>
                                                    <div class="valid-feedback">Short Description  field is valid!</div>
                                                    <div class="invalid-feedback">Short Description  field cannot be blank!</div>
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <label class="" for="role"><a href="#" class="btn btn-dark">Change Role</a> </label>
                                                    <select  style="height: 200%;" name="role" id="subcategory" class="col-md-3 mt-3 py-1" required>

                                                        <option value="2"  <%if (a.getRole().equals("Admin")) {%> selected <%}%>
                                                                >Admin</option>
                                                        <option value="1"  <%if (a.getRole().equals("User")) {%> selected <%}%>
                                                                >User</option>

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
            function able3(x, y, z, q, k) {
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

