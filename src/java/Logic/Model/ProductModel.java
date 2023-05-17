/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Model;

/**
 *
 * @author rafih
 */
public class ProductModel {
    
    private String[] id;
    private String[] name;
    private String[] description;
    private String[] imageUrl;
    
    public void instantiateProducts(int i) {
        id = new String[i];
        name = new String[i];
        description = new String[i];
        imageUrl = new String[i];
    }
    
    public void setId(int i, String id) {
        this.id[i] = id;
    }
    
    public String getId(int i) {
        return id[i];
    }
    
    public void setName(int i,String name) {
        this.name[i] = name;
    }
    
    public String getName(int i) {
        return name[i];
    }
    
    public void setDescription(int i, String description) {
        this.description[i] = description;
    }
    
    public String getDescription(int i) {
        return description[i];
    }
    
    public void setImageUrl(int i, String url) {
        this.imageUrl[i] = url;
    }
    
    public String getImageUrl(int i) {
        return imageUrl[i];
    }
}
