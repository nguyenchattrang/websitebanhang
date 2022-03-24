<%-- 
    Document   : manageproduct
    Created on : Mar 12, 2022, 1:49:51 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <%ArrayList<Product> a = (ArrayList<Product>) request.getAttribute("list");
            ArrayList<Category> category = (ArrayList<Category>) request.getAttribute("category");
            ArrayList<SubCategory> subcategory = (ArrayList<SubCategory>) request.getAttribute("subcategory");
            ArrayList<Brand> brand = (ArrayList<Brand>) request.getAttribute("brand");

        %>
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


        <!-- Custom styles for this template -->
        <link href="../css/dashboard.css" rel="stylesheet">
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

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

                    <div id="form1" class="my-5">
                        <h3>Search</h3>
                        <form action="product"  method="get" class="requires-validation" is-validated>
                            <div class="d-flex justify-content-between">
                                <input style="display:none;" value="search" name="action">
                                <div class="col-md-3">
                                    <label class="" for="id">Product ID </label>
                                    <input  value="${id}" class="form-control" type="text" name="id" placeholder="Input ID to search" >

                                </div>
                                <div class="col-md-3">
                                    <label class="" for="name">Name </label>
                                    <input value="${name}"   class="form-control" type="text" name="name" placeholder="Input name to search" >
                                </div>
                                
                                <div class="col-md-2">
                                    <label class="" for="brand">Brand </label>
                                    <select name="brand" id="brand" class="form-select " >
                                        <option  value="">
                                            All
                                        </option>
                                         <c:forEach items="${brand}" var="b">
                                        <option value="${b.id}" ${brandid == b.getId() ? "selected":""}
                                                >${b.name}</option>
                                        </c:forEach>>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <label class="" for="category">Category </label>

                                    <select name="category" class="form-select " >
                                        <option  value="">
                                            All
                                        </option>
                                       
                                        <c:forEach items="${category}" var="b">
                                        <option value="${b.id}" ${categoryid == b.getId() ? "selected":""}
                                                >${b.name}</option>
                                        </c:forEach>>
                                      
                                    </select>



                                </div>
                                <div class="col-md-2">
                                    <label class="" for="subcategory">Subcategory </label>
                                    <select name="subcategory" id="subcategory" class="form-select " >
                                        <option  value="" >
                                            All 
                                        </option>
                                         <c:forEach items="${subcategory}" var="b">
                                        <option value="${b.id}" ${subcategoryid == b.getId() ? "selected":""}
                                                >${b.name}</option>
                                        </c:forEach>>

                                    </select>

                                </div>
 </div>
                                        <input style="float:right;" id="ip1" class="btn btn-dark btn-outline-light mb-5 mt-2" type="submit" value="Search">
                           
                        </form>
                    </div>



                                        <h2 style="clear:both;">Product Management</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">Product ID</th>
                                    <th scope="col"></th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Short description</th>
                                    <th scope="col">Details</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Product b : a) {%>
                                <tr>
                                    <td><%=b.getId()%></td>
                                    <td style="width:20%"><img style="width: 50%" src="<%=b.getPicture()%>" alt=""></td>
                                    <td><%=b.getName()%></td>
                                    <td><%=b.getSdesc()%></td>
                                    <td><a href="update?id=<%=b.getId()%>" class="btn btn-dark">Details</a></td>
                                    <td><a href="update?id=<%=b.getId()%>&action=delete"  class="btn btn-dark">Delete</a></td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                    <a class="btn btn-dark btn-outline-light" href="create" >Create</a>
                </main>
            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous">

        </script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
        <script src="../js/dashboard.js"></script>
    </body>
</html>

