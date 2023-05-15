/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Model;

/**
 *
 * @author rafih
 */
public class PaymentModel {
    
    private String[] id;
    private String[] name;
    
    public void instantiatePayment(int i) {
        id = new String[i];
        name = new String[i];
    }
    
    public void setId(int i, String id) {
        this.id[i] = id;
    }
    
    public String getId(int i) {
        return id[i];
    }
    
    public void setName(int i, String name) {
        this.name[i] = name;
    }
    
    public String getName(int i) {
        return name[i];
    }
}
