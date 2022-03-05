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
        ArrayList<Product> accounts = new ArrayList<>();
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
                accounts.add(a);
            }
                } catch (SQLException ex) {
           Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
       }
        

        return accounts;

    }

   public static void main(String[] args)
   {
       DAO dao = new DAO();
       ArrayList<Product> a = dao.getProducts();
       for(Product o : a){
           System.out.println(o.toString());
       }
   }

}
