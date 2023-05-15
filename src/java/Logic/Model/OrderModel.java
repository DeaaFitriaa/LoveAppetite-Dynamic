/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Model;

/**
 *
 * @author rafih
 */
public class OrderModel {
    
    private String userId;
    private String productId;
    private String name;
    private String email;
    private String productName;
    private String phoneNumber;
    private String address;
    private String paymentId;
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setProductId(String productId) {
        this.productId = productId;
    }
    
    public String getProductId() {
        return productId;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getName() {
        return name;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getEmail() {
        return email;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    public String getProductName() {
        return productName;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }
    
    public String getPaymentId() {
        return paymentId;
    }
}
