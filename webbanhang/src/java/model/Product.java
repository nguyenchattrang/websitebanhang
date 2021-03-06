/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import DAL.DAO;

/**
 *
 * @author ADMIN
 */
public class Product {

    private int id;
    private String name;
    private String sdesc;
    private String longdesc;
    private int categoryid;
    

    public double getRating() {
        DAO dao = new DAO();
        return dao.getRatings(id);
    }



    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public int getSubcategoryid() {
        return subcategoryid;
    }

    public void setSubcategoryid(int subcategoryid) {
        this.subcategoryid = subcategoryid;
    }

    public int getBrandid() {
        return brandid;
    }

    public void setBrandid(int brandid) {
        this.brandid = brandid;
    }
    private int subcategoryid;
    private int brandid;

    public Product() {
    }

    public Product(int id, String name, String sdesc, String longdesc) {
        this.id = id;
        this.name = name;
        this.sdesc = sdesc;
        this.longdesc = longdesc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSdesc() {
        return sdesc;
    }

    public void setSdesc(String sdesc) {
        this.sdesc = sdesc;
    }

    public String getLongdesc() {
        return longdesc;
    }

    public void setLongdesc(String longdesc) {
        this.longdesc = longdesc;
    }

    public String getPicture() {
        DAO dao = new DAO();
        return dao.getPicture("" + id);

    }

    public String[] getLowestandHighestPrice() {
        DAO dao = new DAO();
        return dao.getLowestandHighestPrice("" + id);

    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", sdesc=" + sdesc + ", longdesc=" + longdesc + '}';
    }

}
