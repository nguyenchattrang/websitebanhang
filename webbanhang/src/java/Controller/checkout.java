/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Product_Variation;

/**
 *
 * @author ADMIN
 */
public class checkout extends HttpServlet {

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
        HttpSession session = request.getSession();
        ArrayList<Product_Variation> cart;
        cart = (ArrayList<Product_Variation>) session.getAttribute("cart");
        session.setAttribute("cart", cart);
        if (cart == null) {
            response.sendRedirect("cart?action=noproduct");
            return;
        } else {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        Account user = (Account) session.getAttribute("user");
        ArrayList<Product_Variation> products = (ArrayList<Product_Variation>) session.getAttribute("cart");
        int total = 0;
        for (Product_Variation o : products) {
            total += o.getTotal();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy H:mm:ss");
        String date;
        date = sdf.format(new Date());
//   response.getWriter().print(date);
        if (user != null) {
            dao.insertNewOrder(products, user.getId(), user.getFirstname() + " " + user.getLastname(), user.getEmail(), user.getPhonenumber(), user.getAddress1(), user.getAddress2(), user.getCity(), user.getZip(), 2.99, total, date);

        } else {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String phonenumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            String address2 = request.getParameter("address2");
            String city = request.getParameter("city");
            String zip = request.getParameter("zip");
//            response.getWriter().print(firstname+lastname+email+phonenumber+address+address2+city+zip);
            dao.insertNewOrder(products, 8, firstname + " " + lastname, email, phonenumber, address, address2, city, zip, 2.99, total, date);
        }
       
        
        session.removeAttribute("cart");
        request.getRequestDispatcher("thanks.html").forward(request, response);
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
