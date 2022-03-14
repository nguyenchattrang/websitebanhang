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
import model.Brand;
import model.Category;
import model.Picture;
import model.Product;
import model.SubCategory;
import model.Variation;

/**
 *
 * @author ADMIN
 */
public class manageupdate extends HttpServlet {

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
        String id = request.getParameter("id");
        Product product = dao.getProductbyPID(id);
        ArrayList<Category> category = dao.getCategory();
        ArrayList<SubCategory> subcategory = dao.getSubCategory();
        ArrayList<Brand> brand = dao.getBrands();
        ArrayList<Picture> pictures = dao.getPicturesbyId(id);
        ArrayList<Variation> variations = dao.getVariation(id);
        request.setAttribute("pictures", pictures);
        request.setAttribute("variations", variations);
        request.setAttribute("category", category);
        request.setAttribute("subcategory", subcategory);
        request.setAttribute("brand", brand);
        PrintWriter out = response.getWriter();
//        out.print(product);
        request.setAttribute("product", product);
        request.getRequestDispatcher("../manageproductdetails.jsp").forward(request, response);
//  
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
      
          String action = request.getParameter("action");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sdesc = request.getParameter("sdesc");
        String longdesc = request.getParameter("longdesc");
        String category = request.getParameter("category");
        String subcategory = request.getParameter("subcategory");
        String brand = request.getParameter("brand");
        DAO dao = new DAO();
        dao.updateProductSummary(name, sdesc, category, longdesc, subcategory, brand, id);
        response.sendRedirect("update?id="+id);
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
