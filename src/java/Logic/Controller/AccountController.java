/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Controller;

import Logic.Model.AccountModel;
import Logic.Query.AccountQuery;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author rafih
 */
public class AccountController extends MainController {
    
    
    AccountQuery query = new AccountQuery();
    
    public ResultSet login(AccountModel model) {
        String sql = this.query.login;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getEmail());
        map.put(2, model.getPassword());
        
        return super.get(map, sql);
    }
    
    public boolean register(AccountModel model) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getEmail());
        map.put(2, model.getPassword());
        map.put(3, model.getName());
        map.put(4, model.getPhoneNumber());
        map.put(5, model.getAddress());
        
        String sql = this.query.register;
        
        return super.preparedStatement(map, sql);
    }
    
    public boolean update(AccountModel model) {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getPassword());
        map.put(2, model.getPhoneNumber());
        map.put(3, model.getAddress());
        map.put(4, model.getId());
        
        String sql = this.query.update;
        
        return super.preparedStatement(map, sql);
    }
    
}
