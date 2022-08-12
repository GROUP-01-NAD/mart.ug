/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/TagHandler.java to edit this template
 */
package Product.sales;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import static jakarta.servlet.jsp.tagext.Tag.SKIP_BODY;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import static jdk.internal.vm.vector.VectorSupport.insert;


/**
 *
 * @author samuel
 */
public class InCart extends SimpleTagSupport {
 private final String driver = "com.mysql.jdbc.Driver";

   private final String database_type = "mysql";

   private final String database_url = "\"jdbc:mysql://localhost:3306/vaccinationtracker\"";

   private final String database_username = "root";

   private final String database_password = "";
    private final String table = "cart";
    private String user_id;
    private String product_id;
    public void setUser_id(String user_id){
        this.user_id = user_id;
    }
    public void setProduct_id(String product_id){
        this.product_id = product_id;
    }

    
    
    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
     public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        
        try{ 
           Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
           Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
            st = conn.createStatement();
            String sql = "SELECT * FROM cart WHERE user_id = '"+user_id+"'";
            ResultSet rs = st.executeQuery(sql);
            int rowCount =0;
            while(rs.next()){
                if(rs.getInt("status")== 1){
            
                rowCount++;
            }
            }
            
            out.println(rowCount);
            //out.println(user_id);
            
            
            rs.close();
            st.close();
            conn.close();
            } catch (ClassNotFoundException ex) {
         Logger.getLogger(InCart.class.getName()).log(Level.SEVERE, null, ex);
     } catch (SQLException ex) {
         Logger.getLogger(InCart.class.getName()).log(Level.SEVERE, null, ex);
     }
       
     }
}