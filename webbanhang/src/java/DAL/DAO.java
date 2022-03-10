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
import model.Account;
import model.Brand;
import model.Category;
import model.Picture;
import model.Product;
import model.Product_Variation;
import model.SubCategory;
import model.Variation;

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

    public ArrayList getProductsbyFilter(String filter) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT id, [name],[sdesc],[longdesc] FROM [Product] where " + filter;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            System.out.println(sql);
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

    public ArrayList getProductsbyCid(String id) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT id, [name],[sdesc],[longdesc] FROM [Product] where category_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
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

    public ArrayList<Category> getCategory() {
        ArrayList<Category> category = new ArrayList<>();
        String sql = "Select Category.id,name, ISNULL(count, 0 ) as count from Category left join \n"
                + " (\n"
                + "Select Category.id, COUNT(Category.id) as count from Category inner join Product\n"
                + "on Category.id = Product.category_id\n"
                + "group by Category.id) a\n"
                + "on Category.id = a.id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category a = new Category();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setTotal(rs.getInt("count"));
                category.add(a);
            }
            return category;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<SubCategory> getSubCategory() {
        ArrayList<SubCategory> subcategory = new ArrayList<>();
        String sql = "Select * from SubCategory";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                SubCategory a = new SubCategory();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                subcategory.add(a);
            }
            return subcategory;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Brand> getBrands() {
        ArrayList<Brand> brand = new ArrayList<>();
        String sql = "Select * from Brand";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Brand a = new Brand();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                brand.add(a);
            }
            return brand;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList getProductbyCID() {
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

    public String getPicture(String id) {
        String sql = "Select top 1 link from Product \n"
                + "inner join Product_Media\n"
                + "on Product.id=Product_Media.product_id\n"
                + "where Product.id=? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String a = rs.getString("link");
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public String[] getLowestandHighestPrice(String id) {
        String sql = "Select * from\n"
                + "(Select top 1 price from Product inner join\n"
                + "Variation on Product.id=Variation.product_id \n"
                + "where Product.id=?\n"
                + "order by price\n"
                + " ) a\n"
                + "union\n"
                + "Select * from\n"
                + "(\n"
                + "Select top 1 price from Product inner join\n"
                + "Variation on Product.id=Variation.product_id \n"
                + "where Product.id=?\n"
                + "order by price DESC\n"
                + ") b";
        String[] a = new String[2];
        int i = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                a[i] = rs.getString("price");
//                System.out.println(b);
                i++;
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList getPicturesbyId(String id) {
        ArrayList<Picture> pictures = new ArrayList<>();
        String sql = "Select id, alt,link from Product_Media where product_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Picture a = new Picture();
                a.setId(rs.getInt("id"));
                a.setAlt(rs.getString("alt"));
                a.setLink(rs.getString("link"));
                pictures.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pictures;

    }

    public Product getSingleProduct(String id) {
        Product a = null;
        String sql = "Select * from Product where id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                a = new Product();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setSdesc(rs.getString("sdesc"));
                a.setLongdesc(rs.getString("longdesc"));
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

    public ArrayList<Variation> getVariation(String id) {
        ArrayList<Variation> variations = new ArrayList<>();
        String sql = "Select * from Variation where product_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Variation a = new Variation();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setPrice(rs.getDouble("price"));
                a.setQuantity(rs.getInt("quantity"));
                variations.add(a);
            }
            return variations;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

    public Product_Variation getProductVariation(String id) {

        String sql = "Select Product.id,Product.name,sdesc,longdesc,Variation.id as varid, Variation.name as varname,quantity,price,Category.name as categoryname from Product inner join Variation\n"
                + "on Product.id=Variation.product_id\n"
                + "inner join Category\n"
                + "on Product.category_id=Category.id\n"
                + " where Variation.id =?";
        Product_Variation c = null;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                Variation b = new Variation();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setSdesc(rs.getString("sdesc"));
                a.setLongdesc(rs.getString("longdesc"));
                b.setId(rs.getInt("varid"));
                b.setName(rs.getString("varname"));
                b.setQuantity(rs.getInt("quantity"));
                b.setPrice(rs.getDouble("price"));
                c = new Product_Variation(a, b, rs.getString("categoryname"));

            }

            return c;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

    public Variation getSingleVariation(String id) {

        String sql = "Select * from Variation where product_id=?";
        Variation a = null;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                a = new Variation();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setPrice(rs.getDouble("price"));
                a.setQuantity(rs.getInt("quantity"));

            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }
//------------------------------------------------------------------

    public ArrayList getAccounts() {
        ArrayList<Account> accounts = new ArrayList<>();
        String sql = "SELECT * from Account";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPhonenumber(rs.getString("phonenumber"));
                a.setAddress1(rs.getString("address1"));
                a.setAddress2(rs.getString("address2"));
                a.setCity(rs.getString("city"));
                a.setZip(rs.getString("zip"));
                accounts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return accounts;

    }

    public Account getAccountByUsernameAndPassword(String username, String password) {
        Account a = null;
        String sql = "  Select * from Account where username=? and password=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPhonenumber(rs.getString("phonenumber"));
                a.setAddress1(rs.getString("address1"));
                a.setAddress2(rs.getString("address2"));
                a.setCity(rs.getString("city"));
                a.setZip(rs.getString("zip"));

            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }
//    ------Orders----------------------------------

    public void insertNewOrder(ArrayList<Product_Variation> a, int userid, String shipname, String email, String phone, String shipaddress, String shipaddress2, String city, String zip, double shippingfee, double totalprice, String orderdate) {

        insertOrder(userid, shipname, email, phone, shipaddress, shipaddress2, city, zip, shippingfee, totalprice, orderdate);
        int orderid = selectLastOrderId();
        for (Product_Variation o : a) {
            insertOrderDetails(orderid, o.getProduct().getId(), o.getVar().getId(), o.getTotal(), o.getAmount());
        }

    }

    public void insertOrder(int userid, String shipname, String email, String phone, String shipaddress, String shipaddress2, String city, String zip, double shippingfee, double totalprice, String orderdate) {
        try {
            String sql = "INSERT INTO [Assignment].[dbo].[Order]\n"
                    + "           ([user_id]\n"
                    + "           ,[shipname]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[shipaddress]\n"
                    + "           ,[shipaddress2]\n"
                    + "           ,[city]\n"
                    + "           ,[zip]\n"
                    + "           ,[shippingfee]\n"
                    + "           ,[totalprice]\n"
                    + "           ,[orderdate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, s.getId());
            statement.setInt(1, userid);
            statement.setString(2, shipname);
            statement.setString(3, email);
            statement.setString(4, phone);
            statement.setString(5, shipaddress);
            statement.setString(6, shipaddress2);
            statement.setString(7, city);
            statement.setString(8, zip);
            statement.setDouble(9, shippingfee);
            statement.setDouble(10, totalprice);
            statement.setString(11, orderdate);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertOrderDetails(int orderid, int productid, int varid, double price, int amount) {
        try {
            String sql = "INSERT INTO [Assignment].[dbo].[OrderDetail]\n"
                    + "           ([order_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[var_id]\n"
                    + "           ,[price]\n"
                    + "           ,[amount])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderid);
            statement.setInt(2, productid);
            statement.setInt(3, varid);
            statement.setDouble(4, price);
            statement.setInt(5, amount);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int selectLastOrderId() {

        String sql = "Select top 1 id from [Order] order by id DESC";
        int id = -1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
//    -------------------------------------------------------------
        public void insertAccount(String username,String password,String email, String firstname,String lastname,String phonenumber, String address1, String address2, String city, String zip) {
        try {
            String sql = "INSERT INTO [Assignment].[dbo].[Account]\n" +
"           ([username]\n" +
"           ,[password]\n" +
"           ,[email]\n" +
"           ,[firstname]\n" +
"           ,[lastname]\n" +
"           ,[phonenumber]\n" +
"           ,[address1]\n" +
"           ,[address2]\n" +
"           ,[city]\n" +
"           ,[zip])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, firstname);
            statement.setString(5, lastname);
            statement.setString(6, phonenumber);
            statement.setString(7, address1);
            statement.setString(8, address2);
            statement.setString(9, city);
            statement.setString(10, zip);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        ArrayList<Account> a = dao.getAccounts();
        for (Account o : a) {
            System.out.println(o.toString());
        }
        
        System.out.println(dao.getAccountByUsernameAndPassword("trang", "1"));
        System.out.println(dao.getPicture("10"));
        System.out.println(dao.getLowestandHighestPrice("2")[1]);
        System.out.println(dao.getProductVariation("3").toString());
    }

}
