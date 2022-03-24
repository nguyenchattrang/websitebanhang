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
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Brand;
import model.Category;
import model.Order;
import model.Picture;
import model.Product;
import model.Product_Variation;
import model.Rating;
import model.Status;
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

    public ArrayList getBestSeller() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "Select Product.id, name,sdesc, SUM(amount) as total from Product left join OrderDetail\n"
                + "on Product.id=OrderDetail.product_id\n"
                + "group by Product.id,name,sdesc order by total DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product a = new Product();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setSdesc(rs.getString("sdesc"));

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

    public Product getProductbyPID(String id) {
        Product a = null;
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[sdesc]\n"
                + "      ,[category_id]\n"
                + "      ,[longdesc]\n"
                + "      ,[subcategory_id]\n"
                + "      ,[brand_id]\n"
                + "  FROM [Product] where id =?";
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
                a.setCategoryid(rs.getInt("category_id"));
                a.setSubcategoryid(rs.getInt("subcategory_id"));
                a.setBrandid(rs.getInt("brand_id"));
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

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

    public ArrayList<Account> getAccounts() {
        ArrayList<Account> accounts = new ArrayList<>();
        String sql = "SELECT [Account].id\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[firstname]\n"
                + "      ,[lastname]\n"
                + "      ,[phonenumber]\n"
                + "      ,[address1]\n"
                + "      ,[address2]\n"
                + "      ,[city]\n"
                + "      ,[zip]\n"
                + "      ,Role.name\n"
                + "  FROM [Assignment].[dbo].[Account] inner join Account_Role on Account.id=Account_Role.id inner join Role on Role.id=Account_Role.role ";
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
                a.setRole(rs.getString("name"));
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

    public boolean checkDuplicateUsername(String username) {
        try {
            String sql = "Select username from Account where username=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }
//    ------Orders----------------------------------

    public void insertNewOrder(ArrayList<Product_Variation> a, int userid, String shipname, String email, String phone, String shipaddress, String shipaddress2, String city, String zip, double shippingfee, double totalprice, String orderdate) {
        try {
//            connection.setAutoCommit(false);
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
                    + "           ,[orderdate]\n"
                    + "           ,[status])\n"
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
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
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
            statement.setString(12, "Received");
            statement.executeUpdate();

            String sql_getid = "Select @@IDENTITY as id";
            PreparedStatement statementgetid = connection.prepareStatement(sql_getid);
            ResultSet rs = statementgetid.executeQuery();
            int lastid = -1;
            if (rs.next()) {
                lastid = rs.getInt("id");
            }
            for (Product_Variation o : a) {
                String sqldetails = "INSERT INTO [Assignment].[dbo].[OrderDetail]\n"
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
                PreparedStatement statementdetails = connection.prepareStatement(sqldetails);
                statementdetails.setInt(1, lastid);
                statementdetails.setInt(2, o.getProduct().getId());
                statementdetails.setInt(3, o.getVar().getId());
                statementdetails.setDouble(4, o.getTotal());
                statementdetails.setInt(5, o.getAmount());
                statementdetails.executeUpdate();
//                String sqlgetqan = "Select quantity from Variation where id =?";
//                PreparedStatement statementgetq = connection.prepareStatement(sqlgetqan);
//                ResultSet rs = statementgetq.executeQuery();
//                int quantity = -1;
//                if (rs.next()) {
//                    lastid = rs.getInt("id");
//                }
                String sqlquantity = "UPDATE [Assignment].[dbo].[Variation]\n"
                        + "   SET\n"
                        + "     [quantity] = ?\n"
                        + "     \n"
                        + " WHERE id=?";
                PreparedStatement statementquantity = connection.prepareStatement(sqlquantity);
                statementquantity.setInt(1, (o.getVar().getQuantity() - o.getAmount()));
                statementquantity.setInt(2, o.getVar().getId());

                statementquantity.executeUpdate();

                String sqlstatus = "INSERT INTO [Assignment].[dbo].[Order_Status]\n"
                        + "           ([orderid]\n"
                        + "           ,[statusid])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?)";
                PreparedStatement statementstatus = connection.prepareStatement(sqlstatus);
                statementstatus.setInt(1, lastid);
                statementstatus.setInt(2, 1);
                statementstatus.executeUpdate();
            }
//            connection.commit();
//        } catch (SQLException ex) {
//            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
//            try {
//                connection.rollback();
        } catch (SQLException ex1) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex1);
        }
//        } finally {
//            try {
//                connection.setAutoCommit(true);
//            } catch (SQLException ex) {
//                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
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

    public void updateQuantity(int quantity, String id) {
        try {
            String sql = "UPDATE [Assignment].[dbo].[Variation]\n"
                    + "   SET \n"
                    + "      [quantity] = ?\n"
                    + "     \n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, quantity);
            statement.setString(2, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    -------------------------------------------------------------

    public void insertAccount(String username, String password, String email, String firstname, String lastname, String phonenumber, String address1, String address2, String city, String zip) {
        try {
            String sql = "INSERT INTO [Assignment].[dbo].[Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[firstname]\n"
                    + "           ,[lastname]\n"
                    + "           ,[phonenumber]\n"
                    + "           ,[address1]\n"
                    + "           ,[address2]\n"
                    + "           ,[city]\n"
                    + "           ,[zip])\n"
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
                    + "           ,?)";
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

    public void updateAccount(String email, String firstname, String lastname, String phonenumber, String address1, String address2, String city, String zip, int id) {
        try {
            String sql = "UPDATE [Account]\n"
                    + "   SET \n"
                    + "      [email] = ?\n"
                    + "      ,[firstname] = ?\n"
                    + "      ,[lastname] = ?\n"
                    + "      ,[phonenumber] = ?\n"
                    + "      ,[address1] = ?\n"
                    + "      ,[address2] = ?\n"
                    + "      ,[city] = ?\n"
                    + "      ,[zip] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, email);
            statement.setString(2, firstname);
            statement.setString(3, lastname);
            statement.setString(4, phonenumber);
            statement.setString(5, address1);
            statement.setString(6, address2);
            statement.setString(7, city);
            statement.setString(8, zip);
            statement.setInt(9, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePassword(String password, int id) {
        try {
            String sql = "UPDATE [Account]\n"
                    + "   SET \n"
                    + "      [password] = ?\n"
                    + "     \n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, password);
            statement.setInt(2, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//--------------------------------------------

    public ArrayList<Order> getOrdersById(int id) {
        ArrayList<Order> orders = new ArrayList<Order>();
        String sql = "SELECT [Order].id\n"
                + "      ,[user_id]\n"
                + "      ,[shipname]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[shipaddress]\n"
                + "      ,[shipaddress2]\n"
                + "      ,[city]\n"
                + "      ,[zip]\n"
                + "      ,[shippingfee]\n"
                + "      ,[totalprice]\n"
                + "      ,[orderdate]\n"
                + "      ,status.status\n"
                + "  FROM [Assignment].[dbo].[Order] inner join Order_Status on id=Order_Status.orderid inner join [Status] on [Status].id=Order_Status.statusid where user_id=?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order a = new Order();
                a.setId(rs.getInt("id"));
                a.setPrice(rs.getDouble("totalprice"));
                a.setShippingfee(rs.getDouble("shippingfee"));
                a.setStatus(rs.getString("status"));
                orders.add(a);
            }
            return orders;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product_Variation> getProductVariations(int id) {
        ArrayList<Product_Variation> productvars = new ArrayList<Product_Variation>();
        String sql = "Select OrderDetail.id as oid, Product.id,Product.name,sdesc,longdesc,Variation.id as varid, Variation.name as varname,Variation.price,OrderDetail.amount, Category.name as categoryname from Product inner join Variation\n"
                + "                             on Product.id=Variation.product_id\n"
                + "                              inner join Category\n"
                + "                             on Product.category_id=Category.id\n"
                + "                             inner join OrderDetail\n"
                + "                             on Variation.id=OrderDetail.var_id\n"
                + "                            where OrderDetail.order_id=?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
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

                b.setPrice(rs.getDouble("price"));

                Product_Variation c = new Product_Variation(a, b, rs.getString("categoryname"));
                c.setAmount(rs.getInt("amount"));
                c.setId(rs.getInt("oid"));
                productvars.add(c);
            }
            return productvars;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Order> getOrders(int pageindex, int pagesize) {
        ArrayList<Order> orders = new ArrayList<Order>();
        String sql = "Select * from\n"
                + "(\n"
                + "Select ROW_NUMBER() OVER (ORDER BY [Order].id DESC) as [Row], [Order].id,shipname,email,phone,shipaddress,shipaddress2,city,zip,shippingfee,totalprice,orderdate,status from [Order]\n"
                + ") as T\n"
                + "where [Row]>=(?-1)*?+1 and [Row]<=?*?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pageindex);
            statement.setInt(2, pagesize);
            statement.setInt(3, pageindex);
            statement.setInt(4, pagesize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order a = new Order();
                a.setId(rs.getInt("id"));
                a.setShipname(rs.getString("shipname"));
                a.setEmail(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setShipaddress(rs.getString("shipaddress"));
                a.setShipaddress2(rs.getString("shipaddress2"));
                a.setCity(rs.getString("city"));
                a.setZip(rs.getString("zip"));
                a.setShippingfee(rs.getDouble("shippingfee"));
                a.setPrice(rs.getDouble("totalprice"));
                a.setOrderdate(rs.getString("orderdate"));
                a.setStatus(rs.getString("status"));
                orders.add(a);
            }
            return orders;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateProductSummary(String name, String sdesc, String category, String longdesc, String subcategory, String brand, String id) {
        try {
            String sql = "UPDATE [Product]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[sdesc] = ?\n"
                    + "      ,[category_id] = ?\n"
                    + "      ,[longdesc] = ?\n"
                    + "      ,[subcategory_id] = ?\n"
                    + "      ,[brand_id] = ?\n"
                    + " WHERE id =?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, name);
            statement.setString(2, sdesc);
            statement.setString(3, category);
            statement.setString(4, longdesc);
            statement.setString(5, subcategory);
            statement.setString(6, brand);
            statement.setString(7, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePicture(String alt, String link, String productid, String id) {
        try {
            String sql = "UPDATE [Product_Media]\n"
                    + "   SET [alt] = ?\n"
                    + "      ,[link] = ?\n"
                    + "      ,[product_id] = ?\n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, alt);
            statement.setString(2, link);
            statement.setString(3, productid);
            statement.setString(4, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateVar(String name, int quantity, double price, String productid, String id) {
        try {
            String sql = "UPDATE [Assignment].[dbo].[Variation]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[product_id] = ?\n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, name);
            statement.setInt(2, quantity);
            statement.setDouble(3, price);
            statement.setString(4, productid);
            statement.setString(5, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertNewPicture(String alt, String link, String productid) {
        try {
            String sql = "INSERT INTO [Product_Media]\n"
                    + "           ([alt]\n"
                    + "           ,[link]\n"
                    + "           ,[product_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, s.getId());
            statement.setString(1, alt);
            statement.setString(2, link);
            statement.setString(3, productid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertNewVar(String name, int quantity, double price, String productid) {
        try {
            String sql = "INSERT INTO [Assignment].[dbo].[Variation]\n"
                    + "           ([name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[product_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setInt(2, quantity);
            statement.setDouble(3, price);
            statement.setString(4, productid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePicture(String pictureid) {
        try {
            String sql = "DELETE FROM [Product_Media]\n"
                    + "      WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, s.getId());
            statement.setString(1, pictureid);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteVar(String varid) {
        try {
            String sql = "DELETE FROM [Variation]\n"
                    + "      WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, s.getId());
            statement.setString(1, varid);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Product> searchAllProduct(String id, String name, String subcategory, String category, String brand) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[sdesc]\n"
                + "      ,[category_id]\n"
                + "      ,[longdesc]\n"
                + "      ,[subcategory_id]\n"
                + "      ,[brand_id]\n"
                + "  FROM [Assignment].[dbo].[Product]\n"
                + "  where(1=1)";
        try {

            int paramIndex = 0;
            HashMap<Integer, Object[]> params = new HashMap<>();
            if (!id.equals("")) {
                sql += "  and id =?";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getName();
                param[1] = id;
                params.put(paramIndex, param);
            }
            if (!name.equals("")) {
                sql += "and name like '%' + ? +'%'";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getName();
                param[1] = name;
                params.put(paramIndex, param);
            }
            if (!subcategory.equals("")) {
                sql += "and subcategory_id=?";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getName();
                param[1] = subcategory;
                params.put(paramIndex, param);
            }
            if (!category.equals("")) {
                sql += "and category_id = ?";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getName();
                param[1] = category;
                params.put(paramIndex, param);
            }
            if (!brand.equals("")) {
                sql += "and brand_id = ?";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getName();
                param[1] = brand;
                params.put(paramIndex, param);
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                int index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(String.class.getName())) {
                    statement.setString(index, value[1].toString());
                }
            }
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

    public boolean checkAccountRole(int id) {
        try {
            String sql = "SELECT role FROM [Assignment].[dbo].[Account_Role] where id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int role = rs.getInt("role");
                if (role == 2) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public void insertNewProduct(String name, String sdesc, String longdesc, String category, String subcategory, String brand, String alt, String link, String size, int quantity, double price) {

        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [Assignment].[dbo].[Product]\n"
                    + "           ([name]\n"
                    + "           ,[sdesc]\n"
                    + "           ,[category_id]\n"
                    + "           ,[longdesc]\n"
                    + "           ,[subcategory_id]\n"
                    + "           ,[brand_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, sdesc);
            statement.setString(3, category);
            statement.setString(4, longdesc);
            statement.setString(5, subcategory);
            statement.setString(6, brand);
            statement.executeUpdate();

            String sql_getid = "Select @@IDENTITY as id";
            PreparedStatement statementgetid = connection.prepareStatement(sql_getid);
            ResultSet rs = statementgetid.executeQuery();
            int lastid = -1;
            if (rs.next()) {
                lastid = rs.getInt("id");
            }

            String sqldetails = "INSERT INTO [Assignment].[dbo].[Product_Media]\n"
                    + "           ([alt]\n"
                    + "           ,[link]\n"
                    + "           ,[product_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statementdetails = connection.prepareStatement(sqldetails);
            statementdetails.setString(1, alt);
            statementdetails.setString(2, link);
            statementdetails.setInt(3, lastid);
            statementdetails.executeUpdate();
            String sqlquantity = "INSERT INTO [Assignment].[dbo].[Variation]\n"
                    + "           ([name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[product_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statementquantity = connection.prepareStatement(sqlquantity);
            statementquantity.setString(1, size);
            statementquantity.setInt(2, quantity);
            statementquantity.setDouble(3, price);
            statementquantity.setInt(4, lastid);
            statementquantity.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void deleteProduct(String productid) {
        try {
            String sql = "DELETE FROM [Assignment].[dbo].[Variation]\n"
                    + "      WHERE product_id=?\n"
                    + "\n"
                    + "DELETE FROM [Assignment].[dbo].[Product_Media]\n"
                    + "      WHERE product_id=?\n"
                    + "\n"
                    + "DELETE FROM [Assignment].[dbo].[Product]\n"
                    + "      WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, productid);
            statement.setString(2, productid);
            statement.setString(3, productid);
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertRating(int userid, int productid, String comment, int rating) {
        try {
            String sql = "INSERT INTO [Rating]\n"
                    + "           ([userid]\n"
                    + "           ,[productid]     \n"
                    + "           ,[comment]\n"
                    + "           ,[rating])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?   \n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userid);
            statement.setInt(2, productid);
            statement.setString(3, comment);
            statement.setInt(4, rating);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList getRatingsbyId(String productid) {
        ArrayList<Rating> ratings = new ArrayList<>();
        String sql = "SELECT TOP 1000 username,\n"
                + "userid\n"
                + "                       ,[productid]\n"
                + "                       ,[comment]\n"
                + "                       ,[rating]\n"
                + "                   FROM [Rating] inner join Account\n"
                + "                   on Rating.userid=Account.id\n"
                + "                   where productid=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, productid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Rating a = new Rating();
                a.setUsername(rs.getString("username"));
                a.setUserid(rs.getInt("userid"));
                a.setProductid(rs.getInt("productid"));
                a.setComment(rs.getString("comment"));
                a.setRating(rs.getInt("rating"));
                ratings.add(a);
            }
            return ratings;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Rating> getRatings() {
        ArrayList<Rating> ratings = new ArrayList<>();
        String sql = "SELECT userid, username\n"
                + "      ,[productid]\n"
                + "      ,[comment]\n"
                + "      ,[rating]\n"
                + "  FROM [Rating] inner join Account on Account.id=userid";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Rating a = new Rating();
                a.setUserid(rs.getInt("userid"));
                a.setUsername(rs.getString("username"));
                a.setProductid(rs.getInt("productid"));
                a.setComment(rs.getString("comment"));
                a.setRating(rs.getInt("rating"));
                ratings.add(a);
            }
            return ratings;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public boolean checkBeenOrder(String productid, int userid) {
        String sql = "  Select * from OrderDetail inner join [Order] \n"
                + "  on OrderDetail.order_id=[Order].id\n"
                + "  where product_id=? and user_id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, productid);
            statement.setInt(2, userid);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    public boolean checkBeenComment(String productid, int userid) {
        String sql = "Select * from Rating where userid=? and productid=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userid);
            statement.setString(2, productid);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    public ArrayList getStatus() {
        ArrayList<Status> status = new ArrayList<>();
        String sql = "Select * from Status";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Status a = new Status();
                a.setId(rs.getInt("id"));
                a.setStatus(rs.getString("status"));
                status.add(a);
            }
            return status;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

    public void updateStatus(int statusid, String orderid) {
        try {
            String sql = "UPDATE [Order_Status]\n"
                    + "   SET \n"
                    + "      [statusid] = ?\n"
                    + " WHERE orderid=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, statusid);
            statement.setString(2, orderid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Order> searchOrder(String id, String shipname, String address, String statusid, int pageindex, int pagesize) {
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "Select * from\n"
                + "(\n"
                + "Select ROW_NUMBER() OVER (ORDER BY [Order].id DESC) as [Row], [Order].id,shipname,email,phone,shipaddress,shipaddress2,city,zip,shippingfee,totalprice,orderdate,status from [Order] \n"
                + "where\n"
                + "(1=1)";
        try {

            int paramIndex = 0;
            HashMap<Integer, String> params = new HashMap<>();
            if (!id.equals("")) {
                sql += "and [Order].id=?";
                paramIndex++;
                params.put(paramIndex, id);
            }
            if (!shipname.equals("")) {
                sql += "and shipname like  '%'+ ?+'%'";
                paramIndex++;
                params.put(paramIndex, shipname);
            }
            if (!address.equals("")) {
                sql += "and (shipaddress like   '%'+ ?+'%' or shipaddress2  like '%'+ ?+'%')";
                paramIndex++;
                params.put(paramIndex, address);
                paramIndex++;
                params.put(paramIndex, address);
            }
            if (!statusid.equals("")) {
                sql += "and status like '%'+ ?+'%'";
                paramIndex++;
                params.put(paramIndex, statusid);
            }
            sql += ") as T\n"
                    + "where [Row]>=(?-1)*?+1 and [Row]<=?*?";
            PreparedStatement statement = connection.prepareStatement(sql);
            for (Map.Entry<Integer, String> entry : params.entrySet()) {
                int index = entry.getKey();
                String value = entry.getValue();
                statement.setString(index, value);

            }
            paramIndex++;
            statement.setInt(paramIndex, pageindex);
            paramIndex++;
            statement.setInt(paramIndex, pagesize);
            paramIndex++;
            statement.setInt(paramIndex, pageindex);
            paramIndex++;
            statement.setInt(paramIndex, pagesize);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order a = new Order();
                a.setId(rs.getInt("id"));
                a.setShipname(rs.getString("shipname"));
                a.setEmail(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setShipaddress(rs.getString("shipaddress"));
                a.setShipaddress2(rs.getString("shipaddress2"));
                a.setCity(rs.getString("city"));
                a.setZip(rs.getString("zip"));
                a.setShippingfee(rs.getDouble("shippingfee"));
                a.setPrice(rs.getDouble("totalprice"));
                a.setOrderdate(rs.getString("orderdate"));
                a.setStatus(rs.getString("status"));
                orders.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;

    }

    public int searchTotal(String id, String shipname, String address, String statusid) {
        int a = 0;
        String sql = "Select * from\n"
                + "(\n"
                + "Select COUNT(*) as total from [Order] \n"
                + "where\n"
                + "(1=1)";
        try {

            int paramIndex = 0;
            HashMap<Integer, String> params = new HashMap<>();
            if (!id.equals("")) {
                sql += "and [Order].id=?";
                paramIndex++;
                params.put(paramIndex, id);
            }
            if (!shipname.equals("")) {
                sql += "and shipname like  '%'+ ?+'%'";
                paramIndex++;
                params.put(paramIndex, shipname);
            }
            if (!address.equals("")) {
                sql += "and (shipaddress like   '%'+ ?+'%' or shipaddress2  like'%'+ ?+'%')";
                paramIndex++;
                params.put(paramIndex, address);
                paramIndex++;
                params.put(paramIndex, address);
            }
            if (!statusid.equals("")) {
                sql += "and status like '%'+ ?+'%'";
                paramIndex++;
                params.put(paramIndex, statusid);
            }
            sql += ") as T";

            PreparedStatement statement = connection.prepareStatement(sql);
            for (Map.Entry<Integer, String> entry : params.entrySet()) {
                int index = entry.getKey();
                String value = entry.getValue();
                statement.setString(index, value);

            }

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                a = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;

    }

    public int getTotal() {
        int i = 0;
        String sql = "Select COUNT(*) as total from [Order]";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                i = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return i;

    }

    public double getRatings(int id) {
        double rating = 0;
        String sql = "Select isNULL(AVG(Cast(Rating as Float)),0 )rating from Product left join Rating\n"
                + "on Product.id=Rating.productid\n"
                + "where Product.id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                rating = rs.getDouble("rating");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rating;

    }

    public Order getTotalOrder(String id) {
        String sql = "  Select * from [Order] "
                + "  where [Order].id=?";
        Order a = null;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                a = new Order();
                a.setId(rs.getInt("id"));
                a.setShipname(rs.getString("shipname"));
                a.setPhone(rs.getString("phone"));
                a.setShipaddress(rs.getString("shipaddress"));
                a.setShipaddress2(rs.getString("shipaddress2"));
                a.setEmail(rs.getString("email"));
                a.setCity(rs.getString("city"));
                a.setZip(rs.getString("zip"));
                a.setShippingfee(rs.getDouble("shippingfee"));
                a.setPrice(rs.getDouble("totalprice"));
                a.setOrderdate(rs.getString("orderdate"));
                a.setStatus(rs.getString("status"));
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateOrder(String shipname, String email, String phonenumber, String address1, String address2, String city, String zip, String orderdate, String status, int id) {
        try {
            String sql = "UPDATE [Order]\n"
                    + "   SET [shipname] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[shipaddress] = ?\n"
                    + "      ,[shipaddress2] = ?\n"
                    + "      ,[city] = ?\n"
                    + "      ,[zip] = ?\n"
                    + "      ,[orderdate] =?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE [Order].id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, shipname);
            statement.setString(2, email);
            statement.setString(3, phonenumber);
            statement.setString(4, address1);
            statement.setString(5, address2);
            statement.setString(6, city);
            statement.setString(7, zip);
            statement.setString(8, orderdate);
            statement.setString(9, status);
            statement.setInt(10, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateTotal(int id) {
        double total = 0;
        try {
            String sql1 = "Select SUM(price) as total from [OrderDetail] where order_id=?";
            PreparedStatement statement1 = connection.prepareStatement(sql1);

            statement1.setInt(1, id);
            ResultSet rs = statement1.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("total");
            }
            String sql = "UPDATE [Assignment].[dbo].[Order]\n"
                    + "   SET \n"
                    + "      [totalprice] = ?\n"
                    + "      \n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setDouble(1, total);
            statement.setInt(2, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrderDetails(String id) {
        try {
            String sql = "DELETE FROM [OrderDetail]\n"
                    + "      WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, s.getId());
            statement.setString(1, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrder(String id) {
        try {
            String sql1 = "DELETE FROM [Assignment].[dbo].[OrderDetail]\n"
                    + "      WHERE order_id=?";
            PreparedStatement statement1 = connection.prepareStatement(sql1);
            statement1.setString(1, id);
            statement1.executeUpdate();

            String sql = "DELETE FROM [Order]\n"
                    + "      WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrderDetails(String id, int amount, double price) {

        try {

            String sql = "UPDATE [Assignment].[dbo].[OrderDetail]\n"
                    + "   SET \n"
                    + "      [price] = ?\n"
                    + "      ,[amount] = ?\n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, price);
            statement.setInt(2, amount);
            statement.setString(3, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccount(String id) {
        Account a = new Account();
        String sql = "SELECT [Account].[id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[firstname]\n"
                + "      ,[lastname]\n"
                + "      ,[phonenumber]\n"
                + "      ,[address1]\n"
                + "      ,[address2]\n"
                + "      ,[city]\n"
                + "      ,[zip]\n"
                + "      ,name\n"
                + "  FROM [Assignment].[dbo].[Account] inner join Account_Role\n"
                + "  on Account.id=Account_Role.id inner join Role on Role.id=Account_Role.role\n"
                + "  where [Account].id=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
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
                a.setRole(rs.getString("name"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return a;

    }

    public void updateAccount(String username, String email, String firstname, String lastname, String phonenumber, String address1, String address2, String city, String zip, String id) {

        try {

            String sql = "UPDATE [Assignment].[dbo].[Account]\n"
                    + "   SET [username] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[firstname] = ?\n"
                    + "      ,[lastname] = ?\n"
                    + "      ,[phonenumber] =?\n"
                    + "      ,[address1] = ?\n"
                    + "      ,[address2] = ?\n"
                    + "      ,[city] = ?\n"
                    + "      ,[zip] = ?\n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, firstname);
            statement.setString(4, lastname);
            statement.setString(5, phonenumber);
            statement.setString(6, address1);
            statement.setString(7, address2);
            statement.setString(8, city);
            statement.setString(9, zip);
            statement.setString(10, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateRole(String role, String id) {

        try {

            String sql = "UPDATE [Assignment].[dbo].[Account_Role]\n"
                    + "   SET \n"
                    + "      [role] = ?\n"
                    + " WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccount(String id) {
        try {
            String sql = "DELETE FROM [Assignment].[dbo].[Account_Role]\n"
                    + "      WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();

            String sql1 = "DELETE FROM [Assignment].[dbo].[Account]\n"
                    + "      WHERE id=?";
            PreparedStatement statement1 = connection.prepareStatement(sql1);
            statement1.setString(1, id);
            statement1.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteRating(String uid, String pid) {
        try {
            String sql = "DELETE FROM [Assignment].[dbo].[Rating]\n"
                    + "      WHERE userid=? and productid=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, uid);
            statement.setString(2, pid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateRating(String uid, String pid, String comment, int value) {
        try {
            String sql = "UPDATE [Assignment].[dbo].[Rating]\n"
                    + "   SET    [comment] = ?\n"
                    + "      ,[rating] = ?\n"
                    + " WHERE userid=? and productid=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, comment);
            statement.setInt(2, value);
            statement.setString(3, uid);
            statement.setString(4, pid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Rating getRating(String uid, String pid) {
        Rating a = new Rating();
        String sql = "  SELECT [userid]\n"
                + "                       ,[productid]\n"
                + "                       ,[varid]\n"
                + "                       ,[comment]\n"
                + "                       ,[rating]\n"
                + "                   FROM [Assignment].[dbo].[Rating]\n"
                + "                   where userid=? and productid=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, uid);
            statement.setString(2, pid);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                a.setUserid(rs.getInt("userid"));
                a.setProductid(rs.getInt("productid"));
//                a.setVarid(rs.getInt("varid"));
                a.setComment(rs.getString("comment"));
                a.setRating(rs.getInt("rating"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return a;

    }

    public static void main(String[] args) {
        DAO dao = new DAO();
//        ArrayList<Order> orders = dao.searchOrder("", "", "", "1", 2, 10);
//        for (Order o : orders) {
//            System.out.println(o.toString());
//        }
////        ArrayList<Rating> a = dao.getRatingsbyId("2");
////        for (Rating o : a) {
////            System.out.println(o.toString());
////        }
//        System.out.println(dao.checkBeenOrder("2", 1));
//        System.out.println(dao.checkBeenComment("2", 1));
////
////        System.out.println(dao.getAccountByUsernameAndPassword("trang", "1"));
////        System.out.println(dao.getPicture("10"));
////        System.out.println(dao.getLowestandHighestPrice("2")[1]);
////        System.out.println(dao.getProductVariation("3").toString());
////        System.out.println(dao.checkDuplicateUsername("trang"));
////
////        ArrayList<Order> ordersById = dao.getOrders();
////        for (Order o : ordersById) {
////            ArrayList<Product_Variation> listpv = o.getListpv();
////            for (Product_Variation b : listpv) {
////                System.out.println(b.toString());
////
////            }
////            System.out.println("Het mot order");
////        }
//        System.out.println(dao.getProductbyPID("2"));
//        ArrayList<Product_Variation> a = new ArrayList<>();
////        dao.deleteOrder("49");
//        System.out.println(dao.getAccount("1"));;
        dao.updateRating("1", "2", "Xau", 4);

    }

}
