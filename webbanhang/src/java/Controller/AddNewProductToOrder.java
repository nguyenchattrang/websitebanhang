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
import model.Variation;

/**
 *
 * @author ADMIN
 */
public class AddNewProductToOrder extends HttpServlet {

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
        String action = request.getParameter("action");
        ArrayList<Variation> variation = dao.getVariation(id);
        PrintWriter out = response.getWriter();
        if (action == null || action.equals("")) {
            out.print("<div class=\"col-md-12 mb-2\">\n"
                    + "                                                    <label style=\"width: 10%;\" class=\"\" for=\"size\">Size</label>\n"
                    + "                                                    <select onchange=\"ChangePrice()\"   style=\"height: 200%;\" name=\"size\" id=\"size\" class=\"col-md-3 mt-3 py-1\" required>\n"
                    + "\n");
            for (Variation a : variation) {
                out.print("<option  value=\"" + a.getId() + "\"\n"
                        + "                                                            >" + a.getName() + "</option>");
            }
            out.print(
                    "                                                    </select>\n"
                    + "                                                    <div class=\"valid-feedback\">You selected a position!</div>\n"
                    + "                                                    <div class=\"invalid-feedback\">Please select a position!</div>\n"
                    + "                                                </div>       \n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "                                                <div class=\"col-md-12 mb-2\">\n"
                    + "                                                    <label style=\"width: 10%;\" class=\"\" for=\"unitpirce\">Unit Price </label>\n"
                    + "                                                    <input value=\"" + variation.get(0).getPrice() + "\"   disabled=\"\"  type=\"text\" name=\"unitpirce\" id=\"unitpirce\">\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"col-md-12 mb-2\">\n"
                    + "                                                    <label style=\"width: 10%;\" class=\"\" for=\"amount\">Amount </label>\n"
                    + "                                                    <input  value=\"" + 1 + "\" onchange=\"ChangePrice()\" min=\"1\" type=\"number\" name=\"amount\" id=\"amount\" required=\"\">\n"
                    + "                                                </div>\n"
                    + "                                                <input style=\"display:none;\" type=\"text\"  value=\"" + variation.get(0).getPrice() + "\" name=\"totalprice\"> \n"
                    + "                                                Total Price:" + variation.get(0).getPrice() + "  <br>"
            );

        } else if (action.equals("change")) {
            int num = 0;
            int size = Integer.parseInt(request.getParameter("size"));
            String amount = request.getParameter("amount");
            out.print("<div class=\"col-md-12 mb-2\">\n"
                    + "                                                    <label style=\"width: 10%;\" class=\"\" for=\"size\">Size</label>\n"
                    + "                                                    <select onchange=\"ChangePrice()\"   style=\"height: 200%;\" name=\"size\" id=\"size\" class=\"col-md-3 mt-3 py-1\" required>\n"
                    + "\n");
            for (int i = 0; i < variation.size(); i++) {
                if (size == variation.get(i).getId()) {
                    num = i;
                    out.print("<option selected  value=\"" + variation.get(i).getId() + "\"\n"
                            + "                                                            >" + variation.get(i).getName() + "</option>");
                } else {
                    out.print("<option  value=\"" + variation.get(i).getId() + "\"\n"
                            + "                                                            >" + variation.get(i).getName() + "</option>");
                }

            }
            double total = variation.get(num).getPrice() * Integer.parseInt(amount);
            out.print(
                    "                                                    </select>\n"
                    + "                                                    <div class=\"valid-feedback\">You selected a position!</div>\n"
                    + "                                                    <div class=\"invalid-feedback\">Please select a position!</div>\n"
                    + "                                                </div>       \n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "                                                <div class=\"col-md-12 mb-2\">\n"
                    + "                                                    <label style=\"width: 10%;\" class=\"\" for=\"unitpirce\">Unit Price </label>\n"
                    + "                                                    <input value=\"" + variation.get(num).getPrice() + "\"   disabled=\"\"  type=\"text\" name=\"unitpirce\" id=\"unitpirce\">\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"col-md-12 mb-2\">\n"
                    + "                                                    <label style=\"width: 10%;\" class=\"\" for=\"amount\">Amount </label>\n"
                    + "                                                    <input  value=\"" + amount + "\" onchange=\"ChangePrice()\" min=\"1\" type=\"number\" name=\"amount\" id=\"amount\" required=\"\">\n"
                    + "                                                </div>\n"
                    + "                                                <input style=\"display:none;\" type=\"text\"  value=\"" + total + "\" name=\"totalprice\"> Total Price:" + total + " <br>\n"
            );
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
