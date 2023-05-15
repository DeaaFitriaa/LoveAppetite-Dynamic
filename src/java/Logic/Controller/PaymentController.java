/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Controller;

import Logic.Query.PaymentQuery;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author rafih
 */
public class PaymentController extends MainController {
    
    PaymentQuery query = new PaymentQuery();
    
    public ResultSet get() {
        String sql = this.query.getName;
        
        return super.get(sql);
    }
}
