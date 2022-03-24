<%-- 
    Document   : manageorder
    Created on : Mar 12, 2022, 12:42:47 PM
    Author     : ADMIN
--%>

<%@page import="model.Rating"%>
<%@page import="model.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Status"%>
<%@page import="model.Product_Variation"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <script src="https://kit.fontawesome.com/ca0aaad838.js" crossorigin="anonymous"></script>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <title>Manage Order</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- bundle của bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">



        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="../js/myjs.js" ></script>

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
        <link href="../css/dashboard.css" rel="stylesheet">

        <!-- Custom styles for this template -->


    </head>
    <body>

        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Kitten Cosmestic Shop</a>
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
                                <a class="nav-link " href="product">
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
                                <a class="nav-link active" href="rating">
                                    <span data-feather="star"></span>
                                    Rating
                                </a>
                            </li>  </ul>

                    </div>
                </nav>
                <% ArrayList<Rating> ratings = (ArrayList<Rating>) request.getAttribute("ratings");

                %>
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">




                    <div class="mt-5" style="clear: both; border: solid black 1px;">
                        <div class="table-responsive ">
                            <table class="table table-bordered table-sm table-striped" style="margin-bottom: 10px; font-size: 15px; " > 
                                <tr>
                                    <th>
                                        Username
                                    </th>
                                    <th >
                                        Product ID
                                    </th>
                                    <th >
                                        Comment
                                    </th>
                                    <th >
                                        Rating Value
                                    </th>
                                    <th >

                                    </th>

                                </tr>
                                <%for (Rating o : ratings) {%>
                                <tr>
                                    <td>
                                        <%=o.getUsername()%>
                                    </td>
                                    <td >
                                        <a href="../Productdetails?pid=<%=o.getProductid()%>">Go To Product id = <%=o.getProductid()%></a> 
                                    </td>
                                    <td >
                                        <%=o.getComment()%>
                                    </td>
                                    <td >
                                        <%=o.getRating()%>
                                    </td>
                                    <td>
                                        <a href="ratingdetails?&uid=<%=o.getUserid()%>&pid=<%=o.getProductid()%>" class=""><i class="fa-solid fa-pen"></i> </a>
                                        <a href="rating?action=delete&uid=<%=o.getUserid()%>&pid=<%=o.getProductid()%>" class=""><i class="fa-regular fa-trash-can"></i></a>
                                    </td>
                                </tr>
                                <%}%>
                            </table>
                        </div> 
                    </div>

            </div>
        </div>
        <!--                    <br><br><br><br><br>-->

        <div style="color:black; float:right;" id="pager">

        </div>
        <script>
            var a = pager("pager",${requestScope.pageindex},${requestScope.total}, 2, '${link}');

        </script>
    </main>

</div>
</div>
<script>
    function changeStatus(x)
    {
        console.log(x);
        var a = document.getElementById(x);
        if (a.style.display === "none")
        {
            a.style.display = "block";
        } else
            a.style.display = "none";
    }

</script>
<script>
    function pagerA(x, y, z, v) {
        var a = document.getElementById(x);
        a.innerHTML = '<a href="order?page=1">First</a>';
        console.log(a);
    }
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous">

</script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
<script src="../js/dashboard.js"></script>
</body>
</html>

