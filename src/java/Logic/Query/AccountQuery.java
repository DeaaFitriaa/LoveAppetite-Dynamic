/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Query;

/**
 *
 * @author rafih
 */
public class AccountQuery {
    
    public String register = "INSERT INTO users (Email, Password, Name, PhoneNumber, Address) VALUES (?, ?, ?, ?, ?)";
    public String login = "SELECT * FROM users WHERE Email = ? AND Password = ?";
    public String update = "UPDATE users SET Password = ?, PhoneNumber = ?, Address = ? WHERE ID = ?";
    
}
