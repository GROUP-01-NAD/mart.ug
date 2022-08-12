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
            String all_likes = request.getParameter("likes");
            
            switch(all_likes) {
                case "customer_likes": {
                    String user_id = request.getParameter("user_id");
                    String product_id = request.getParameter("product_id");
                    
                    Statement st = null;
                    PreparedStatement ps = null;
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        
                        String mysql = "SELECT * FROM reviews WHERE user = ? and product = ?";
                            ps = con.prepareStatement(mysql);
                
                            ps.setString(1, user_id);
                            ps.setString(2, product_id);
                            ResultSet rs = ps.executeQuery();
                        
                        if(rs.next()){
                                request.setAttribute("error", "You already like this product!");
                                request.getRequestDispatcher("DashboardCustomer.jsp").forward(request, response);
                                return;
                            }else {
                
                                st = con.createStatement();
                                st.executeUpdate("insert into reviews set user='"+user_id+"', product='"+product_id+"'");
                                //request.getRequestDispatcher("/login.jsp").forward(request, response);
                                response.sendRedirect(request.getContextPath() + "/DashboardCustomer.jsp");
                                return;
                            }
                    
                        }catch(ClassNotFoundException | SQLException c) {
                                out.println(c.getMessage());
                        }
                }
                
//                case "checkout_staff": {
//                    int user_id = (int) Integer.parseInt(request.getParameter("staff_id"));
//                    
//                    Statement st = null;
//                    try{ 
//                        Class.forName("com.mysql.jdbc.Driver");
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
//                        
//                        st = con.createStatement();
//                        st.executeUpdate("UPDATE cart SET status = 0 WHERE user_id='"+user_id+"'");
//                        
//                        st.executeUpdate("UPDATE products INNER JOIN cart ON products.status = cart.status SET products.quantity_left = quantity_left-1");
//                        
//                        st.executeUpdate("DELETE cart FROM cart WHERE user_id='"+user_id+"'");
//                            
//                        request.setAttribute("error", "Checkout Successful! Wait For Delivery");
//                        request.getRequestDispatcher("/staff_cart.jsp").forward(request, response);
//                       // response.sendRedirect(request.getContextPath() + "/staff_cart.jsp");
//                        return;
//                    
//                        }catch(ClassNotFoundException | SQLException c) {
//                                out.println(c.getMessage());
//                        }
//                }
//                
//                case "checkout_manager": {
//                    int user_id = (int) Integer.parseInt(request.getParameter("manager_id"));
//                    
//                    Statement st = null;
//                    try{ 
//                        Class.forName("com.mysql.jdbc.Driver");
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
//                        
//                        st = con.createStatement();
//                        st.executeUpdate("UPDATE cart SET status = 0 WHERE user_id='"+user_id+"'");
//                        
//                        st.executeUpdate("UPDATE products INNER JOIN cart ON products.status = cart.status SET products.quantity_left = quantity_left-1");
//                        
//                        st.executeUpdate("DELETE cart FROM cart WHERE user_id='"+user_id+"'");
//                            
//                        request.setAttribute("error", "Checkout Successful! Wait For Delivery");
//                        request.getRequestDispatcher("/manager_cart.jsp").forward(request, response);
//                       // response.sendRedirect(request.getContextPath() + "/manager_cart.jsp");
//                        return;
//                    
//                        }catch(ClassNotFoundException | SQLException c) {
//                                out.println(c.getMessage());
//                        }
//                }

                
            }
        %>