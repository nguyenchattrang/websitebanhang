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
import model.Product;
import model.SubCategory;

/**
 *
 * @author ADMIN
 */
public class manageproduct extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet manageproduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageproduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DAO dao = new DAO();
        String action = request.getParameter("action");
        ArrayList<Product> product = dao.getProducts();
        ArrayList<Category> category = dao.getCategory();
        ArrayList<SubCategory> subcategory = dao.getSubCategory();
        ArrayList<Brand> brand = dao.getBrands();
        request.setAttribute("category", category);
        request.setAttribute("subcategory", subcategory);
        request.setAttribute("brand", brand);

        if (action != null && action.equals("search")) {
            response.getWriter().print(action);
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String categoryid = request.getParameter("category");
            String subcategoryid = request.getParameter("subcategory");
            String brandid = request.getParameter("brand");
            response.getWriter().print(id + "name " + name + "ca " + categoryid + " " + subcategoryid + " " + brandid);
            product = dao.searchAllProduct(id, name, subcategoryid, categoryid, brandid);
            for (Product a : product) {
                System.out.println(a);
            }
            request.setAttribute("id", id);
            request.setAttribute("name", name);
       
            request.setAttribute("categoryid", categoryid);
     
            request.setAttribute("subcategoryid", subcategoryid);
         
            request.setAttribute("brandid", brandid);
        }

        request.setAttribute("list", product);

        request.getRequestDispatcher("../manageproduct.jsp").forward(request, response);
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
