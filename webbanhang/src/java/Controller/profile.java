/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class profile extends HttpServlet {

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
        Account a = (Account) session.getAttribute("user");
        if (a == null) {
            response.sendRedirect("login");
        } else {
            request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        Account a = (Account) session.getAttribute("user");
        if (action.equals("profile")) {
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String phonenumber = request.getParameter("phonenumber");
            String address1 = request.getParameter("address1");
            String address2 = request.getParameter("address2");
            String city = request.getParameter("city");
            String zip = request.getParameter("zip");
            a.setEmail(email);
            a.setFirstname(firstname);
            a.setLastname(lastname);
            a.setPhonenumber(phonenumber);
            a.setAddress1(address1);
            a.setAddress2(address2);
            a.setCity(city);
            a.setZip(zip);
//        dao.insertAccount(username, password, email, firstname, lastname, phonenumber, address1, address2, city, zip);
            dao.updateAccount(email, firstname, lastname, phonenumber, address1, address2, city, zip, a.getId());

        }

        if (action.equals("changepassword")) {
            String oldpassword = request.getParameter("oldpassword");
            if (!oldpassword.equals(a.getPassword())) {

                request.setAttribute("message", "Wrong input old password!");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                return;
            }
            String newpassword = request.getParameter("newpassword");
            dao.updatePassword(newpassword, a.getId());
        }

        response.sendRedirect("profile.jsp");
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
