/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Product_Variation;

/**
 *
 * @author ADMIN
 */
public class cart extends HttpServlet {

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
//     String varid=   request.getParameter("varid");
//     String price = request.getParameter("price");
//      String quantity = request.getParameter("qty");
//      String productid = request.getParameter("productid");
//     
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            display(request, response);
        } else if (action.equals("remove")) {
            remove(request, response);
        } else if (action.equals("low")) {
            lowQuantity(request, response);
        } else if (action.equals("high")) {
            highQuantity(request, response);
        }
        else if (action.equals("noproduct")) {
            request.setAttribute("message", "You have no products in your cart");
            display(request, response);
        }
        
    }
    
    protected void display(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
    
    protected void remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        int varid = Integer.parseInt(request.getParameter("vid"));
        ArrayList<Product_Variation> cart = (ArrayList<Product_Variation>) session.getAttribute("cart");
        int index = isExisting(varid, cart);
        cart.remove(index);
        session.setAttribute("cart", cart);
        
        response.sendRedirect("cart");
    }
    
    protected void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String varid = request.getParameter("varid");
        String price = request.getParameter("price");
        String quantity = request.getParameter("qty");
        String productid = request.getParameter("productid");
        PrintWriter out = response.getWriter();
// out.print(productid +"," + varid+"," + price+"," + quantity);

        Cookie arr[] = request.getCookies();
        String txt = "";
        for (Cookie o : arr) {
            if (o.getName().equals("product")) {
                txt = txt + o.getValue();
                o.setMaxAge(0);
                response.addCookie(o);
            }
        }
        if (txt.isEmpty()) {
            txt = productid + " " + varid + " " + " " + quantity;
        } else {
            txt = txt + " " + productid + " " + varid + " " + " " + quantity;
        }
        
        Cookie c = new Cookie("product", txt);
        c.setMaxAge(60 * 60 * 24);
        response.addCookie(c);
        response.sendRedirect("displaycart");
    }
    
    protected void AddtoCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String link = request.getParameter("link");
        int varid = Integer.parseInt(request.getParameter("varid"));
        Double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("qty"));
        int productid = Integer.parseInt(request.getParameter("productid"));
        DAO dao = new DAO();
        Product_Variation temp = dao.getProductVariation(varid + "");
        temp.setAmount(quantity);
        Product product = new Product();
        
        ArrayList<Product_Variation> cart;
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            cart = new ArrayList<Product_Variation>();
            
            cart.add(temp);
//			cart.add(new Product_Variation(dao.getSingleProduct(productid+""), varid, quantity, price));
            session.setAttribute("cart", cart);
        } else {
            cart = (ArrayList<Product_Variation>) session.getAttribute("cart");
            int index = isExisting(varid, cart);
            if (index == -1) {
                cart.add(temp);
//				cart.add(new Product_Variation(dao.getSingleProduct(productid+""), varid, quantity, price));
            } else {
                int quantitycart = cart.get(index).getAmount() + quantity;
                cart.get(index).setAmount(quantitycart);
            }
            session.setAttribute("cart", cart);
        }
        response.sendRedirect(link);
//cart.get(varid).get.getId();
//        PrintWriter out = response.getWriter();
//        for (Product_Variation o : cart) {
//            out.print(o.toString());
//        }

    }
    
    private int isExisting(int id, ArrayList<Product_Variation> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getVar().getId() == id) {
                return i;
            }
        }
        return -1;
    }

   

    protected void lowQuantity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int varid = Integer.parseInt(request.getParameter("vid"));
        ArrayList<Product_Variation> cart = (ArrayList<Product_Variation>) session.getAttribute("cart");
        int index = isExisting(varid, cart);
        Product_Variation a = cart.get(index);
 
        if(a.getAmount()>1)
        a.setAmount(a.getAmount() - 1);
        session.setAttribute("cart", cart);
        PrintWriter out = response.getWriter();
        double total = 0;
        out.print("  \n" +
"            <div  class=\"table-responsive\">\n" +
"            <table class=\"table \">\n" +
"              <thead>\n" +
"                <tr>\n" +
"                  <th scope=\"col\" class=\"h5\">Shopping Bag</th>\n" +
"                  <th scope=\"col\">Size</th>\n" +
"                  <th scope=\"col\">Quantity</th>\n" +
"                  <th scope=\"col\">Unit Price</th>\n" +
"                  <th scope=\"col\">Total Price</th>\n" +
"                  <th scope=\"col\">Delete</th>\n" +
"                </tr>\n" +
"              </thead>\n" +
"              <tbody >");
        for (Product_Variation o : cart) {
            out.print("<tr class=\"cart-section  \">\n"
                    + "                    <th  scope=\"row\" >\n"
                    + "                    <div class=\"d-flex align-items-center\">\n"
                    + "                      <img src=\"" + o.getPicture() + "\" class=\"img-fluid rounded-3\" style=\"width: 120px;\" alt=\"Book\">\n"
                    + "                      <div class=\"flex-column ms-4\">\n"
                    + "                        <p class=\"mb-2\">" + o.getProduct().getName() + "</p>\n"
                    + "                        <p class=\"mb-0\">" + o.getCategoryname() + "</p>\n"
                    + "                      </div>\n"
                    + "                    </div>\n"
                    + "                  </th>\n"
                    + "                  <td  class=\"align-middle\">\n"
                    + "                    <p class=\"mb-0\" style=\"font-weight: 500;\">" + o.getVar().getName() + "</p>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle \">\n"
                    + "                    <div class=\"d-flex flex-row\">\n"
                    + "\n"
                    + "                  <button class=\"btn btn-link px-2\"\n"
                    + "                          onclick=\"updateQuantity(this,1)\" value=\"" + o.getVar().getId() + "\">\n"
                    + "                        <i class=\"fas fa-minus\"></i>\n"
                    + "                      </button>\n"
                    + "  \n"
                    + "                      <input id=\"form1\" min=\"1\" name=\"quantity\" value=\"" + o.getAmount() + "\" type=\"number\"\n"
                    + "                        class=\"form-control form-control-sm\" disabled style=\"width: 50px;\" />\n"
                    + "  \n"
                    + "                      <button class=\"btn btn-link px-2\"\n"
                    + "                        onclick=\"updateQuantity(this,2)\" value=\"" + o.getVar().getId() + "\">\n"
                    + "                        <i class=\"fas fa-plus\"></i>\n"
                    + "                      </button>\n"
                    + "                    </div>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle\">\n"
                    + "                    <p class=\"mb-0\" style=\"font-weight: 500;\">$" + o.getVar().getPrice() + "</p>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle \">\n"
                    + "                      <p class=\"mb-0\" style=\"font-weight: 500;\">$" + o.getTotal() + "</p>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle\">\n"
                    + "                      <a class=\"b-b-b\" href=\"cart?action=remove&vid=" + o.getVar().getId() + "\"> <i id=\"delete-button\" class=\"fa-solid fa-skull\" onmouseover=\"test(this)\" onmouseout=\"test1(this)\"></i>  </a>\n"
                    + "\n"
                    + "                  </td>\n"
                    + "                </tr>");
            total+=o.getTotal();
        }
        out.print("</tbody>\n"
                + "            </table>\n"
                + "          </div>\n"
                + "  \n"
                + "          <div class=\"bottombox shadow-2-strong mb-5 mb-lg-0\" style=\"border-radius: 16px;\">\n"
                + "            <div class=\"bottombox-body p-4\">\n"
                + "  \n"
                + "              <div class=\"row\">\n"
                + "                <div class=\"col-lg-4 col-xl-3\">\n"
                + "                  <div class=\"d-flex justify-content-between\" style=\"font-weight: 500;\">\n"
                + "                    <p class=\"mb-2\">Subtotal</p>\n"
                + "                    <p class=\"mb-2\">$"+total+"</p>\n"
                + "                  </div>\n"
                + "  \n"
                + "                  <div class=\"d-flex justify-content-between\" style=\"font-weight: 500;\">\n"
                + "                    <p class=\"mb-0\">Shipping</p>\n"
                + "                    <p class=\"mb-0\">$2.99</p>\n"
                + "                  </div>\n"
                + "  \n"
                + "                  <hr class=\"my-4\">\n"
                + "  \n"
                + "                  <div class=\"d-flex justify-content-between mb-4\" style=\"font-weight: 500;\">\n"
                + "                    <p class=\"mb-2\">Total (tax included)</p>\n"
                + "                    <p class=\"mb-2\">$"+(total+2.99)+"</p>\n"
                + "                  </div>\n"
                + "  \n"
                + "                   <a href=\"checkout\" type=\"button\" class=\"btn btn-dark btn-outline-light\">\n"
                + "                    <div class=\"d-flex justify-content-between\">\n"
                + "                      <span>Checkout</span>\n"
                + "                      <span>$"+(total+2.99)+"</span>\n"
                + "                    </div>\n"
                + "                  </a>\n"
                + "  \n"
                + "                </div>\n"
                + "              </div>\n"
                + "  \n"
                + "            </div>\n"
                + "          </div>");
        
    }

    protected void highQuantity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int varid = Integer.parseInt(request.getParameter("vid"));
        ArrayList<Product_Variation> cart = (ArrayList<Product_Variation>) session.getAttribute("cart");
        int index = isExisting(varid, cart);
        cart.get(index).setAmount(cart.get(index).getAmount() + 1);
        session.setAttribute("cart", cart);
        PrintWriter out = response.getWriter();
         double total = 0;
        out.print("  \n" +
"            <div  class=\"table-responsive\">\n" +
"            <table class=\"table \">\n" +
"              <thead>\n" +
"                <tr>\n" +
"                  <th scope=\"col\" class=\"h5\">Shopping Bag</th>\n" +
"                  <th scope=\"col\">Size</th>\n" +
"                  <th scope=\"col\">Quantity</th>\n" +
"                  <th scope=\"col\">Unit Price</th>\n" +
"                  <th scope=\"col\">Total Price</th>\n" +
"                  <th scope=\"col\">Delete</th>\n" +
"                </tr>\n" +
"              </thead>\n" +
"              <tbody >");
        for (Product_Variation o : cart) {
            out.print("<tr class=\"cart-section  \">\n"
                    + "                    <th  scope=\"row\" >\n"
                    + "                    <div class=\"d-flex align-items-center\">\n"
                    + "                      <img src=\"" + o.getPicture() + "\" class=\"img-fluid rounded-3\" style=\"width: 120px;\" alt=\"Book\">\n"
                    + "                      <div class=\"flex-column ms-4\">\n"
                    + "                        <p class=\"mb-2\">" + o.getProduct().getName() + "</p>\n"
                    + "                        <p class=\"mb-0\">" + o.getCategoryname() + "</p>\n"
                    + "                      </div>\n"
                    + "                    </div>\n"
                    + "                  </th>\n"
                    + "                  <td  class=\"align-middle\">\n"
                    + "                    <p class=\"mb-0\" style=\"font-weight: 500;\">" + o.getVar().getName() + "</p>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle \">\n"
                    + "                    <div class=\"d-flex flex-row\">\n"
                    + "\n"
                    + "                  <button class=\"btn btn-link px-2\"\n"
                    + "                          onclick=\"updateQuantity(this,1)\" value=\"" + o.getVar().getId() + "\">\n"
                    + "                        <i class=\"fas fa-minus\"></i>\n"
                    + "                      </button>\n"
                    + "  \n"
                    + "                      <input id=\"form1\" min=\"1\" name=\"quantity\" value=\"" + o.getAmount() + "\" type=\"number\"\n"
                    + "                        class=\"form-control form-control-sm\" disabled style=\"width: 50px;\" />\n"
                    + "  \n"
                    + "                      <button class=\"btn btn-link px-2\"\n"
                    + "                        onclick=\"updateQuantity(this,2)\" value=\"" + o.getVar().getId() + "\">\n"
                    + "                        <i class=\"fas fa-plus\"></i>\n"
                    + "                      </button>\n"
                    + "                    </div>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle\">\n"
                    + "                    <p class=\"mb-0\" style=\"font-weight: 500;\">$" + o.getVar().getPrice() + "</p>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle \">\n"
                    + "                      <p class=\"mb-0\" style=\"font-weight: 500;\">$" + o.getTotal() + "</p>\n"
                    + "                  </td>\n"
                    + "                  <td class=\"align-middle\">\n"
                    + "                      <a class=\"b-b-b\" href=\"cart?action=remove&vid=" + o.getVar().getId() + "\"> <i id=\"delete-button\" class=\"fa-solid fa-skull\" onmouseover=\"test(this)\" onmouseout=\"test1(this)\"></i>  </a>\n"
                    + "\n"
                    + "                  </td>\n"
                    + "                </tr>");
            total+=o.getTotal();
        }
        out.print("</tbody>\n"
                + "            </table>\n"
                + "          </div>\n"
                + "  \n"
                + "          <div class=\"bottombox shadow-2-strong mb-5 mb-lg-0\" style=\"border-radius: 16px;\">\n"
                + "            <div class=\"bottombox-body p-4\">\n"
                + "  \n"
                + "              <div class=\"row\">\n"
                + "                <div class=\"col-lg-4 col-xl-3\">\n"
                + "                  <div class=\"d-flex justify-content-between\" style=\"font-weight: 500;\">\n"
                + "                    <p class=\"mb-2\">Subtotal</p>\n"
                + "                    <p class=\"mb-2\">$"+total+"</p>\n"
                + "                  </div>\n"
                + "  \n"
                + "                  <div class=\"d-flex justify-content-between\" style=\"font-weight: 500;\">\n"
                + "                    <p class=\"mb-0\">Shipping</p>\n"
                + "                    <p class=\"mb-0\">$2.99</p>\n"
                + "                  </div>\n"
                + "  \n"
                + "                  <hr class=\"my-4\">\n"
                + "  \n"
                + "                  <div class=\"d-flex justify-content-between mb-4\" style=\"font-weight: 500;\">\n"
                + "                    <p class=\"mb-2\">Total (tax included)</p>\n"
                + "                    <p class=\"mb-2\">$"+(total+2.99)+"</p>\n"
                + "                  </div>\n"
                + "  \n"
                + "                  <a href=\"checkout\" type=\"button\" class=\"btn btn-dark btn-outline-light\">\n"
                + "                    <div class=\"d-flex justify-content-between\">\n"
                + "                      <span>Checkout</span>\n"
                + "                      <span>$"+(total+2.99)+"</span>\n"
                + "                    </div>\n"
                + "                  </a>\n"
                + "  \n"
                + "                </div>\n"
                + "              </div>\n"
                + "  \n"
                + "            </div>\n"
                + "          </div>");
        
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
        AddtoCart(request, response);
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
