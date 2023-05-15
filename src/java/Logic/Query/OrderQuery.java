/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Query;

/**
 *
 * @author rafih
 */
public class OrderQuery {
    
    public String getProductId = "SELECT ID FROM products WHERE Name = ?";
    public String createWithUser = "INSERT INTO transactions (ProductID, UserID, Name, Email, PhoneNumber, Address, PaymentID, Paid) VALUES "
            + "(?, ?, ?, ?, ?, ?, ?, 1)";
    public String createWithoutUser = "INSERT INTO transactions (ProductID, Name, Email, PhoneNumber, Address, PaymentID, Paid) VALUES "
            + "(?, ?, ?, ?, ?, ?, 1)";
    
    public String getTransactionById = "SELECT categories.Name as Category, products.Name as Product, transactions.Address as Address, payments.Name as Payment, transactions.Paid as Paid, cast(transactions.Timestamp as DATE) as Date, cast(transactions.Timestamp as TIME) as TimeOfPurchase FROM transactions INNER JOIN products ON transactions.ProductID = products.ID INNER JOIN categories ON products.CategoryID = categories.ID INNER JOIN users ON transactions.UserID = users.ID INNER JOIN payments ON transactions.PaymentID = payments.ID WHERE users.ID = ?";
}
