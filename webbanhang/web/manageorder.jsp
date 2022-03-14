<%-- 
    Document   : manageorder
    Created on : Mar 12, 2022, 12:42:47 PM
    Author     : ADMIN
--%>

<%@page import="model.Product_Variation"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
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
    <title>Manage Order</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- bundle của bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
       
    

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   

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
<link href="css/dashboard.css" rel="stylesheet">
    
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
            <a class="nav-link active" href="#">
              <span data-feather="file"></span>
              Orders
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
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
<%ArrayList<Order> orders=(ArrayList<Order>) request.getAttribute("orders"); %>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">


     
<%for(Order o: orders){ %>
        <h2>Order ID #<%=o.getId()%> Order Date:<%=o.getOrderdate()%></h2>
        <p>Status: <%=o.getStatus()%>    <button class="btn btn-dark btn-outline-light">Change Status</button></p>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">Product Picture</th>
              <th scope="col">Name</th>
              <th scope="col">Size</th>
              <th scope="col">Quantity</th>
              <th scope="col">Unit price</th>
              <th scope="col">Total Price</th>
               <th scope="col"></th>
                <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
              <%for(Product_Variation a : o.getListpv()) {%>
            <tr>
               <td style="width: 20%"><img style="width: 50%" src="<%=a.getPicture()%>" alt=""></td>
              <td><%=a.getProduct().getName()%></td>
              <td><%=a.getVar().getName()%></td>
              <td><%=a.getAmount()%></td>
              <td><%=a.getVar().getPrice()%></td>
              <td><%=a.getTotal()%></td>
              <td></td>
              <td></td>
            </tr>
      <%}%>
             <thead>
            <tr>
              <th scope="col">Ship name</th>
              <th scope="col">Email</th>
              <th scope="col">Phone</th>
               <th scope="col">Address/Address2</th>
              <th scope="col">City</th>
              <th scope="col">Zip</th>
               <th scope="col">Shipping</th>
               <th scope="col">Total</th>
            </tr>
          </thead>
          <tbody>
            <tr>
                <td><%=o.getShipname()%></td>
              <td><%=o.getEmail()%></td>
              <td><%=o.getPhone()%></td>
               <td><%=o.getShipaddress()%> <%=o.getShipaddress2()%></td>
              <td><%=o.getCity()%></td>
              <td><%=o.getZip()%></td>
              <td><%=o.getShippingfee()%></td>
              <td><%=o.getPrice()%></td>
            </tr>
          </tbody>
<!
          </tbody>
        </table>
      </div>
             <br><br><br><br><br>
      <%}%>
    </main>
  </div>
</div>


   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous">

    </script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="js/dashboard.js"></script>
  </body>
</html>

