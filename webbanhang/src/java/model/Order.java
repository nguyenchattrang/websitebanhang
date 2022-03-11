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
public class Order {
   private int id;
   private double price;
   private double shippingfee;
   private ArrayList<Product_Variation> listpv;

    public Order(int id, double price, double shippingfee, ArrayList<Product_Variation> listpv) {
        this.id = id;
        this.price = price;
        this.shippingfee = shippingfee;
        this.listpv = listpv;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getShippingfee() {
        return shippingfee;
    }

    public void setShippingfee(double shippingfee) {
        this.shippingfee = shippingfee;
    }

    public ArrayList<Product_Variation> getListpv() {
     
        return listpv;
    }

    public void setListpv(ArrayList<Product_Variation> listpv) {
        this.listpv = listpv;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", price=" + price + ", shippingfee=" + shippingfee + ", listpv=" + listpv + '}';
    }
   
   
}
