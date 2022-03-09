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
public class Picture {
    private int id;
    private String alt;
    private String link;

    public Picture(int id, String alt, String link) {
        this.id = id;
        this.alt = alt;
        this.link = link;
    }

    public Picture() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public String toString() {
        return "Picture{" + "id=" + id + ", alt=" + alt + ", link=" + link + '}';
    }
    
}
