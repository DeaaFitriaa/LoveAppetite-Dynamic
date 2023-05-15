/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Controller;

import Logic.Query.CategoryQuery;
import java.sql.ResultSet;

/**
 *
 * @author rafih
 */
public class CategoryController extends MainController {
    
    CategoryQuery query = new CategoryQuery();
    
    public ResultSet get() {
        String sql = this.query.getCategories;
        
        return super.get(sql);
    }
    
}
