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
import model.Product;

/**
 *
 * @author ADMIN
 */
public class Filter extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        String subcategory = request.getParameter("subcategory");
        String brand = request.getParameter("brand");
        String category = request.getParameter("category");
        String query;
        String cid = (String) request.getParameter("cid");

        if (brand != "" && subcategory != "") {
            query = "(" + subcategory + ") and (" + brand + ")";
        } else {
            query = subcategory + brand;
        }
        if (category != null) {
            query += " and category_id=" + category;
        }
        ArrayList<Product> product;
        if (brand == "" && subcategory == "") {
            if (category != null) {
                query += "category_id=" + category;
                product = dao.getProductsbyCid(category);
            } else {
                product = dao.getProducts();
            }

        } else {
            if (category != null) {
                query += "and category_id=" + category;
            }
            product = dao.getProductsbyFilter(query);
        }
        for (Product o : product) {
            String[] price = o.getLowestandHighestPrice();
//            out.print(" <div class=\"col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 mb-5\">\n"
//                    + " <a href=\"Productdetails?pid=" + o.getId() + "\">\n"
//                    + "              <div class=\"card\"> <div class=\"card-img-top\" ><img class=\"img-fluid\"\n"
//                    + "                  src=\"" + o.getPicture() + "\">\n"
//                    + "                </div> \n"
//                    + "                <div class=\"card-body\">\n"
//                    + "                  <h6 class=\"font-weight-bold pt-1\">" + o.getName() + "</h6>\n"
//                    + "                  <div class=\"text-muted description\">" + o.getSdesc() + "</div>\n"
//                    + "                  <div class=\"d-flex align-items-center product\"> <span class=\"fas fa-star\"></span> <span\n"
//                    + "                      class=\"fas fa-star\"></span> <span class=\"fas fa-star\"></span> <span class=\"fas fa-star\"></span>\n"
//                    + "                    <span class=\"far fa-star\"></span> </div>\n"
//                    + "                  <div class=\"d-flex align-items-center justify-content-between pt-3 bottom-price\">\n"
//                    + "                    <div class=\"d-flex flex-column\">\n"
//                    + "                      <div class=\"h6\">" + price[0] + "");
//            if (price[1] != null) {
//                out.print(price[1]);
//            }
//            out.print(" </div>"
//                    + "     \n"
//                    + "                    </div>\n"
//                    + "                    <div class=\"btn btn-dark btn-outline-light\">Add To Cart</div>\n"
//                    + "                  </div>\n"
//                    + "                </div>\n"
//                    + "              </div>\n"
//                    + "</a>\n"
//                    + "            </div>");
            out.print("<div class=\"col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 mb-5\">\n"
                    + "                                    <a href=\"Productdetails?pid=" + o.getId() + "\">\n"
                    + "                                        <div class=\"card\"> <div class=\"card-img-top\" ><img class=\"img-fluid\"\n"
                    + "                                                                                           src=\"" + o.getPicture() + "\">\n"
                    + "                                            </div> \n"
                    + "                                            <div class=\"card-body\">\n"
                    + "                                                <h6 class=\"font-weight-bold pt-1 text-center\">" + o.getName() + "</h6>\n"
                    + "                                                <div class=\"text-muted description\">" + o.getSdesc() + "</div>\n"
                    + "                                                <div class=\"d-flex align-items-center product\"> \n");

            double b = o.getRating();
            if (b == 0) {
                out.print(" <span class=\"far fa-star\">No reviews</span>");
            }
            if (1 <= b) {
                out.print(" <span class=\"fas fa-star\"></span>");
            }
            if (2 <= b) {
                out.print(" <span class=\"fas fa-star\"></span>");
            }
            if (3 <= b) {
                out.print(" <span class=\"fas fa-star\"></span>");
            }
            if (4 <= b) {
                out.print(" <span class=\"fas fa-star\"></span>");
            }
            if (5 <= b) {
                out.print(" <span class=\"fas fa-star\"></span>");
            }
//                    + "                                                    <c:set var = \"b\" value = \"${a.getRating()}\" ></c:set>\n"
//                    + "                                                    <c:if test=\"${1<=b}\">\n"
//                    + "                                                        <span class=\"fas fa-star\"></span> \n"
//                    + "                                                    </c:if>  \n"
//                    + "                                                    <c:if test=\"${2<=b}\">\n"
//                    + "                                                        <span class=\"fas fa-star\"></span> \n"
//                    + "                                                    </c:if>  \n"
//                    + "                                                    <c:if test=\"${3<=b}\">\n"
//                    + "                                                        <span class=\"fas fa-star\"></span>\n"
//                    + "                                                    </c:if>  \n"
//                    + "                                                    <c:if test=\"${4<=b}\">\n"
//                    + "                                                        <span class=\"fas fa-star\"></span>\n"
//                    + "                                                    </c:if>  \n"
//                    + "                                                    <c:if test=\"${5<=b}\">\n"
//                    + "                                                        <span class=\"far fa-star\"></span> \n"
//                    + "                                                    </c:if>  \n"
            out.print("                                                </div>\n"
                    + "                                                <div class=\"d-flex align-items-center justify-content-between pt-3 bottom-price\">\n"
                    + "                                                    <div class=\"d-flex flex-column\">\n"
                    + "                                                        <div class=\"h6\">$" + price[0] + "<br>");

            if (price[1] != null) {
                out.print("$" + price[1]);
            }

            out.print("</div>\n"
                    + "\n"
                    + "                                                        </div>\n"
                    + "                                                        <div class=\"btn btn-dark btn-outline-light\">Add To Cart</div>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </a>\n"
                    + "                                    </div>");

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
