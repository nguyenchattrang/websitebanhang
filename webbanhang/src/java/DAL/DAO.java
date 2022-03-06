/*
 * To change this license header, choose License Headers in Project Propertiea.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
/**
 *
 * @author ADMIN
 */
public class DAO extends BaseDAO {

    @Override
    public ArrayList getProducts() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT id, [name],[sdesc],[longdesc] FROM [Product]";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setSdesc(rs.getString("sdesc"));
                a.setLongdesc(rs.getString("longdesc"));
                products.add(a);
            }
                } catch (SQLException ex) {
           Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
       }
        

        return products;

    }
        public ArrayList getNewProducts() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT id, [name],[sdesc],[longdesc] FROM [Product] order by Product.id DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setSdesc(rs.getString("sdesc"));
                a.setLongdesc(rs.getString("longdesc"));
                products.add(a);
            }
                } catch (SQLException ex) {
           Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
       }
        

        return products;

    }
    public String getPicture(String id)
    {
        String sql = "Select top 1 link from Product \n" +
"inner join Product_Media\n" +
"on Product.id=Product_Media.product_id\n" +
"where Product.id=? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
            String a =rs.getString("link");
            return a;
            }
            
                } catch (SQLException ex) {
           Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
       }
        

        return null;
    }
    public String[] getLowestandHighestPrice(String id)
    {
        String sql = "Select * from\n" +
"(Select top 1 price from Product inner join\n" +
"Variation on Product.id=Variation.product_id \n" +
"where Product.id=?\n" +
"order by price\n" +
" ) a\n" +
"union\n" +
"Select * from\n" +
"(\n" +
"Select top 1 price from Product inner join\n" +
"Variation on Product.id=Variation.product_id \n" +
"where Product.id=?\n" +
"order by price DESC\n" +
") b";
        String [] a = new String[2];
        int i=0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, id);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
            a[i] =rs.getString("price");
//                System.out.println(b);
            i++;
            }
            return a;
                } catch (SQLException ex) {
           Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
       }
        

        return null;
    }

   public static void main(String[] args)
   {
       DAO dao = new DAO();
//       ArrayList<Product> a = dao.getProducts();
//       for(Product o : a){
//           System.out.println(o.toString());
//       }
       
       System.out.println(dao.getPicture("10"));
         System.out.println(dao.getLowestandHighestPrice("2")[1]);
   }

}
