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
    private String shipname;
    private String email;
    private double price;
    private String phone;
    private String shipaddress;
    private String shipaddress2;
    private String city;
    private String zip;
    private String orderdate;
    private String status;
    private double shippingfee;
    private ArrayList<Product_Variation> listpv;



    public Order(int id, double price, double shippingfee, ArrayList<Product_Variation> listpv) {
        this.id = id;
        this.price = price;
        this.shippingfee = shippingfee;
        this.listpv = listpv;
    }

    public Order(int id, String shipname, String email, double price, String phone, String shipaddress, String shipaddress2, String city, String zip, String orderdate, String status, double shippingfee, ArrayList<Product_Variation> listpv) {
        this.id = id;
        this.shipname = shipname;
        this.email = email;
        this.price = price;
        this.phone = phone;
        this.shipaddress = shipaddress;
        this.shipaddress2 = shipaddress2;
        this.city = city;
        this.zip = zip;
        this.orderdate = orderdate;
        this.status = status;
        this.shippingfee = shippingfee;
        this.listpv = listpv;
    }

    public String getShipname() {
        return shipname;
    }

    public void setShipname(String shipname) {
        this.shipname = shipname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getShipaddress() {
        return shipaddress;
    }

    public void setShipaddress(String shipaddress) {
        this.shipaddress = shipaddress;
    }

    public String getShipaddress2() {
        return shipaddress2;
    }

    public void setShipaddress2(String shipaddress2) {
        this.shipaddress2 = shipaddress2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
        return "Order{" + "id=" + id + ", shipname=" + shipname + ", email=" + email + ", price=" + price + ", phone=" + phone + ", shipaddress=" + shipaddress + ", shipaddress2=" + shipaddress2 + ", city=" + city + ", zip=" + zip + ", orderdate=" + orderdate + ", status=" + status + ", shippingfee=" + shippingfee + ", listpv=" + listpv + '}';
    }

}
