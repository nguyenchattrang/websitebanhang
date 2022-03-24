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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.Product_Variation;
import model.Status;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "manageorder", urlPatterns = {"/manage/order"})
public class manageorder extends HttpServlet {

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
        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int totall = dao.getTotal();
        
        PrintWriter out = response.getWriter();
        ArrayList<Order> orders = null;
        
        if (action == null) {
            orders = dao.getOrders(pageindex, 10);
            for (Order c : orders) {
                c.setListpv(dao.getProductVariations(c.getId()));
            }
        }
        ArrayList<Status> status = dao.getStatus();
        String link = "";
        if (action != null && action.equals("search")) {
            
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String statusid = request.getParameter("status");
            orders = dao.searchOrder(id, name, address, statusid, pageindex, 10);
            totall = dao.searchTotal(id, name, address, statusid);
//            out.print(totall);

            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("address", address);
            request.setAttribute("statusid", statusid);
            link = ("?action=search&id=" + id + "&name=" + name + "&address=" + address + "&status=" + statusid);
            for (Order c : orders) {
                c.setListpv(dao.getProductVariations(c.getId()));
            }
            
        }
        if (action != null && action.equals("delete")) {
            String id = request.getParameter("id");
            dao.deleteOrder(id);
//            response.getWriter().print(id);
                        orders = dao.getOrders(pageindex, 10);
            for (Order c : orders) {
                c.setListpv(dao.getProductVariations(c.getId()));
            }
        }
        int total = 1;
        if (totall % 10 == 0) {
            total = totall / 10;
        } else {
            total = totall / 10 + 1;
        }
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("total", total);
        request.setAttribute("orders", orders);
        request.setAttribute("link", link);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../manageorder.jsp").forward(request, response);
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
        DAO dao = new DAO();
        if (action.equalsIgnoreCase("updatestatus"));
        {
            int status = Integer.parseInt(request.getParameter("status"));
//            response.getWriter().print(action+id+status);
//          
            dao.updateStatus(status, id);
            response.sendRedirect("order");
        }
        
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
