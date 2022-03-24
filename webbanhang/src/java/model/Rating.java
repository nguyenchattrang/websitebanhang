/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Rating {

    private String username;
    private int userid;
    private int productid;
    private int varid;
    private String comment;
    private int rating;

    public Rating(String username, int productid, String comment, int rating) {
        this.username = username;
        this.productid = productid;
        this.comment = comment;
        this.rating = rating;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Rating(int userid, int productid, String comment, int rating) {
        this.userid = userid;
        this.productid = productid;
        this.comment = comment;
        this.rating = rating;
    }

    public Rating() {
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getVarid() {
        return varid;
    }

    public void setVarid(int varid) {
        this.varid = varid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Rating{" + "userid=" + userid + ", productid=" + productid + ", varid=" + varid + ", comment=" + comment + ", rating=" + rating + '}';
    }

}
