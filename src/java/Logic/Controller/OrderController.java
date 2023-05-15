/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Controller;

import Logic.Model.OrderModel;
import Logic.Query.OrderQuery;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author rafih
 */
public class OrderController extends MainController {
    
    OrderQuery queries = new OrderQuery();
    
    public ResultSet getProductId(String productName) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, productName);
        
        String query = this.queries.getProductId;
        
        return super.get(map, query);
    }
    
    public boolean createOrderUser(OrderModel model) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getProductId());
        map.put(2, model.getUserId());
        map.put(3, model.getName());
        map.put(4, model.getEmail());
        map.put(5, model.getPhoneNumber());
        map.put(6, model.getAddress());
        map.put(7, model.getPaymentId());
        
        String query = this.queries.createWithUser;
        
        return super.preparedStatement(map, query);
    }
    
    public boolean createOrderPublic(OrderModel model) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getProductId());
        map.put(2, model.getName());
        map.put(3, model.getEmail());
        map.put(4, model.getPhoneNumber());
        map.put(5, model.getAddress());
        map.put(6, model.getPaymentId());
        
        String query = this.queries.createWithoutUser;
        
        return super.preparedStatement(map, query);
    }
    
    public ResultSet getTransaction(String id) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        String sql = this.queries.getTransactionById;
        
        return super.get(map, sql);
    }
}
