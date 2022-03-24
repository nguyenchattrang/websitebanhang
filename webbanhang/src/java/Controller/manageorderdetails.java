/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Order;
import model.Product;
import model.Status;

/**
 *
 * @author ADMIN
 */
public class manageorderdetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DAO dao = new DAO();
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String oid = request.getParameter("oid");
        if (action == null) {
            HttpSession session = request.getSession();
            ArrayList<Product> product = dao.getProducts();
            Account a = (Account) session.getAttribute("user");
            PrintWriter out = response.getWriter();
            Order o = dao.getTotalOrder(id);
            o.setListpv(dao.getProductVariations(o.getId()));
            ArrayList<Status> status = dao.getStatus();
            request.setAttribute("list", product);
            request.setAttribute("order", o);
            request.setAttribute("status", status);
            request.getRequestDispatcher("../manageorderdetails.jsp").forward(request, response);
        }
        if (action.equalsIgnoreCase("delete")) {

            dao.deleteOrderDetails(id);
            dao.updateTotal(Integer.parseInt(oid));
            response.sendRedirect("orderdetails?id=" + oid);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        String action = request.getParameter("action");
        String oid = request.getParameter("oid");
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        if (action.equals("update")) {
            String shipname = request.getParameter("name");
            String email = request.getParameter("email");
            String phonenumber = request.getParameter("phone");
            String address1 = request.getParameter("address");
            String address2 = request.getParameter("address2");
            String city = request.getParameter("city");
            String zip = request.getParameter("zip");
            String orderdate = request.getParameter("date");
            String status = request.getParameter("status");
            response.getWriter().print(shipname + email + phonenumber + address1 + address2 + city + zip + status + oid);
            dao.updateOrder(shipname, email, phonenumber, address1, address2, city, zip, orderdate, status, Integer.parseInt(oid));
        }
        if (action.equals("newproduct")) {
            String pname = request.getParameter("pname");
            String size = request.getParameter("size");
            String totalprice = request.getParameter("totalprice");
            String amount = request.getParameter("amount");
            response.getWriter().print(id + pname + size + totalprice + amount);

            dao.insertOrderDetails(Integer.parseInt(id), Integer.parseInt(pname), Integer.parseInt(size), Double.parseDouble(totalprice), Integer.parseInt(amount));
            dao.updateTotal(Integer.parseInt(id));
            response.sendRedirect("orderdetails?id=" + id);
        }
        if (action.equals("updatequantity")) {
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            dao.updateOrderDetails(id, quantity, (price*quantity));
            dao.updateTotal(Integer.parseInt(oid));
       
        }

        response.sendRedirect("orderdetails?id=" + oid);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
