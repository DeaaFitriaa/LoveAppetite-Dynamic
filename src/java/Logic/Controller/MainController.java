/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logic.Controller;

import Config.DBCon;
import com.sun.rowset.CachedRowSetImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

/**
 *
 * @author rafih
 */
public class MainController {
    
    DBCon conn = new DBCon();
    
    protected CachedRowSetImpl get(String query) {
        
        try {
            Connection con = conn.open();
            
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(query);
            
            CachedRowSetImpl crs = new CachedRowSetImpl();
            crs.populate(rs);
            
            con.close();
            
            return crs;
        }
        catch(Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    protected CachedRowSetImpl get(Map<Integer, Object> map, String query) {
        try {
            Connection con = conn.open();
            
            PreparedStatement pst = con.prepareStatement(query);
            
            for (Map.Entry<Integer, Object> entry : map.entrySet()) {
                pst.setString(entry.getKey(), entry.getValue().toString());
            }
            
            ResultSet rs = pst.executeQuery();
            
            CachedRowSetImpl crs = new CachedRowSetImpl();
            crs.populate(rs);
            
            con.close();
            
            return crs;
        }
        catch(Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    protected boolean preparedStatement(Map<Integer, Object> map, String query) {
        try {
            Connection con = conn.open();
            
            PreparedStatement pst = con.prepareStatement(query);
            
            for (Map.Entry<Integer, Object> entry : map.entrySet()) {
                System.out.println("sebelum " + entry.getKey() + " " + entry.getValue().toString());
                pst.setString(entry.getKey(), entry.getValue().toString());
                System.out.println("sesudah " + entry.getKey() + " " + entry.getValue().toString());
            }
            
            int rows = pst.executeUpdate();
            con.close();
            
            return rows != 0;
        }
        catch(SQLException e) {
            System.out.println(e);
            return false;
        }
    }
}
