/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Controller;

import Logic.Query.ProductQuery;
import java.sql.ResultSet;

/**
 *
 * @author rafih
 */
public class ProductController extends MainController {
   
    ProductQuery query = new ProductQuery();
    
    public ResultSet get() {
        String sql = this.query.get;
        
        return super.get(sql);
    }}
