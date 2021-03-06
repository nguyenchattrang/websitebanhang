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
import model.Picture;
import model.Product;
import model.Rating;
import model.Variation;

/**
 *
 * @author ADMIN
 */
public class Productdetails extends HttpServlet {

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
        String id = (String) request.getParameter("pid");
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        ArrayList<Picture> pictures = dao.getPicturesbyId(id);
        ArrayList<Rating> ratings = dao.getRatingsbyId(id);
        Product a = dao.getSingleProduct(id);
        ArrayList<Variation> variations = dao.getVariation(id);
        request.setAttribute("pictures", pictures);
        request.setAttribute("product", a);
        request.setAttribute("variations", variations);
        if (ratings != null) {
            request.setAttribute("ratings", ratings);
        }
        if(user!=null){
        boolean checkBeenOrder = dao.checkBeenOrder(id, user.getId());
        boolean checkBeenComment = dao.checkBeenComment(id, user.getId());
        request.setAttribute("checkorder", checkBeenOrder);
        request.setAttribute("checkcomment", checkBeenComment);
        }
        request.getRequestDispatcher("Productdetails.jsp").forward(request, response);
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
        processRequest(request, response);
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
