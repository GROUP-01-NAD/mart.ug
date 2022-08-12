<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout...</title>
    </head>
    <body>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.SQLException"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.PreparedStatement"%>
        <%@page import="java.sql.*"%>
        <%@page import="java.io.*"%>
        
        
        <%
            String checkOut = request.getParameter("checkout");
            
            switch(checkOut) {
                case "checkout_customer": {
                    int user_id = (int) Integer.parseInt(request.getParameter("customer_id"));
                    
                    Statement st = null;
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        
                        st = con.createStatement();
                        st.executeUpdate("UPDATE cart SET status = 0 WHERE user_id='"+user_id+"'");
                        
                        st.executeUpdate("UPDATE products INNER JOIN cart ON products.status = cart.status SET products.quantity_left = quantity_left-1");
                        
                            
                        //st.executeUpdate("insert into orders set user='"+user_id+"',product='"++"'");
                        
                        
                    
                        //st.executeUpdate("DELETE cart FROM cart WHERE user_id='"+user_id+"'");
                            
                        request.setAttribute("error", "Checkout Successful! Wait For Delivery");
                        request.getRequestDispatcher("/customer_cart.jsp").forward(request, response);
                       // response.sendRedirect(request.getContextPath() + "/customer_cart.jsp");
                        return;
                    
                        }catch(ClassNotFoundException | SQLException c) {
                                out.println(c.getMessage());
                        }
                }
                
                case "checkout_staff": {
                    int user_id = (int) Integer.parseInt(request.getParameter("staff_id"));
                    
                    Statement st = null;
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        
                        st = con.createStatement();
                        st.executeUpdate("UPDATE cart SET status = 0 WHERE user_id='"+user_id+"'");
                        
                        st.executeUpdate("UPDATE products INNER JOIN cart ON products.status = cart.status SET products.quantity_left = quantity_left-1");
                        
                        st.executeUpdate("DELETE cart FROM cart WHERE user_id='"+user_id+"'");
                            
                        request.setAttribute("error", "Checkout Successful! Wait For Delivery");
                        request.getRequestDispatcher("/staff_cart.jsp").forward(request, response);
                       // response.sendRedirect(request.getContextPath() + "/staff_cart.jsp");
                        return;
                    
                        }catch(ClassNotFoundException | SQLException c) {
                                out.println(c.getMessage());
                        }
                }
                
                case "checkout_manager": {
                    int user_id = (int) Integer.parseInt(request.getParameter("manager_id"));
                    
                    Statement st = null;
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        
                        st = con.createStatement();
                        st.executeUpdate("UPDATE cart SET status = 0 WHERE user_id='"+user_id+"'");
                        
                        st.executeUpdate("UPDATE products INNER JOIN cart ON products.status = cart.status SET products.quantity_left = quantity_left-1");
                        
                        st.executeUpdate("DELETE cart FROM cart WHERE user_id='"+user_id+"'");
                            
                        request.setAttribute("error", "Checkout Successful! Wait For Delivery");
                        request.getRequestDispatcher("/manager_cart.jsp").forward(request, response);
                       // response.sendRedirect(request.getContextPath() + "/manager_cart.jsp");
                        return;
                    
                        }catch(ClassNotFoundException | SQLException c) {
                                out.println(c.getMessage());
                        }
                }

                
            }
        %>