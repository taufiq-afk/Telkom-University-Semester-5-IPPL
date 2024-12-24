/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;
import java.sql.*;

/**
 *
 * @author Fiqq``
 */
public class JDBC {
   public Connection con;  
   public Statement stmt;  
   public boolean isConnected;  
   public String message;
   
   public JDBC() {  
   try {  
      Class.forName("com.mysql.jdbc.Driver");  
      con = DriverManager.getConnection(                               
"jdbc:mysql://localhost:3306/db_barang","root","");  
      stmt = con.createStatement();  
      isConnected = true;  
      message = "DB connected";  
   }  catch(Exception e) {  
      isConnected = false;  
      message = e.getMessage();  
   }  
} 
   
   public void disconnect() {  
   try {  
      stmt.close();  
      con.close();  
      message = "DB disconnected";  
   }  catch(Exception e) {  
      message = e.getMessage();  
   }  
} 
}
