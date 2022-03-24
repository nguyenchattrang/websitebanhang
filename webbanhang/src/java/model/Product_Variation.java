/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import DAL.DAO;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Product_Variation {
    private Product product;
    private Variation var;
    private String categoryname;
    private int amount;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DAO getDao() {
        return dao;
    }

    public void setDao(DAO dao) {
        this.dao = dao;
    }



    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public Product_Variation() {
    }

    public Product_Variation(Product product, Variation var, String categoryname) {
        this.product = product;
        this.var = var;
        this.categoryname = categoryname;
    }

    public Product_Variation(Product product, Variation var, String categoryname, int amount) {
        this.product = product;
        this.var = var;
        this.categoryname = categoryname;
        this.amount = amount;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPicture() {
        DAO dao = new DAO();
        return dao.getPicture("" + product.getId());
        

    }

    public double getTotal(){
        return  (amount*var.getPrice());
    }
public Variation varInfo (int varid){
        return dao.getSingleVariation(varid+"");
    
}
   DAO dao = new DAO();
    public ArrayList<Variation> getListvar() {
     
                
        return dao.getVariation(product.getId()+"");
    }

    public Variation getVar() {
        return var;
    }

    public void setVar(Variation var) {
        this.var = var;
    }



    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Product_Variation{" + "product=" + product + ", var=" + var + ", categoryname=" + categoryname + ", amount=" + amount + ", dao=" + dao + '}';
    }




}
