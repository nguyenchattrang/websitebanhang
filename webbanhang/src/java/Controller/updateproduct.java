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

/**
 *
 * @author ADMIN
 */
public class updateproduct extends HttpServlet {

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
        String action = request.getParameter("action");
        String pid = request.getParameter("pid");
        DAO dao = new DAO();
        if (action.equals("deletepic")) {
            String id = request.getParameter("id");
            dao.deletePicture(id);
//            response.getWriter().print("aaa"+id);
            response.sendRedirect("manage/update?id=" + pid);
        }
        if (action.equals("deletevar")) {
            String id = request.getParameter("id");
            dao.deleteVar(id);
//            response.getWriter().print("aaa"+id);
            response.sendRedirect("manage/update?id=" + pid);
        }
        
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
        DAO dao = new DAO();
        if (action.equals("newpicture")) {
            String id = request.getParameter("id");
            String link = request.getParameter("newlink");
            String alt = request.getParameter("newalt");
            dao.insertNewPicture(link, alt, id);
            
            response.sendRedirect("manage/update?id=" + id);
            return;
        }
        if (action.equals("updateproduct")) {
            String pid = request.getParameter("pid");
            String id = request.getParameter("id");
            String alt = request.getParameter("alt");
            String link = request.getParameter("link");
            dao.updatePicture(alt, link, pid, id);
//            response.getWriter().print(alt+ link+ pid+id);
            response.sendRedirect("manage/update?id=" + pid);
        }
        if (action.equals("newvar")) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            
            dao.insertNewVar(name, quantity, price, id);
//            response.getWriter().print(alt+ link+ pid+id);
            response.sendRedirect("manage/update?id=" + id);
        }
        if (action.equals("updatevariation")) {
            String id = request.getParameter("id");
            String pid = request.getParameter("pid");
            String name = request.getParameter("name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            
            dao.updateVar(name, quantity, price, pid, id);
            response.sendRedirect("manage/update?id=" + pid);
        }
//        if (action.equals("deletepic")) {
//            String id = request.getParameter("id");
//
//            dao.deletePicture(id);
//            response.getWriter().print(id);
//             request.getRequestDispatcher("manage/update?id="+pid).forward(request, response);
//        }
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
