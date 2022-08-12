        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.SQLException"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.DriverManager"%>
        
<%
    String user = null;
    int user_id = (int)session.getAttribute("user_id");
    if(session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        
    }else {user = (String)session.getAttribute("user");}
%>


    <!-- Statistics -->
    <% 
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                        st = conn.createStatement();
                        String sql = "SELECT COUNT(*) FROM users";
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                        
                            int count_row = rs.getInt(1);
                    %>
                   
    <div class="container-fluid pt-5" id="statistics">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"><%out.println(count_row);%></h1>
                    <h5 class="font-weight-semi-bold m-0">USERS</h5>
                </div>
            </div>
<%
                    }
                    }catch(ClassNotFoundException | SQLException c){
                    out.println(c.getMessage());
                    }  
%>


 <% 
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                        st = conn.createStatement();
                        String sql = "SELECT SUM(quantity) as num, SUM(quantity_left) as lef FROM products";
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                            int lef = rs.getInt("lef");
                            int add = rs.getInt("num");
                            double sales = Math.round((100.0-((double)lef/add)*100.0));
                            //out.println(add);
                    %>
              
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2" style="font-size: 33.3px"><%out.println(sales);%>%</h1>
                    <h5 class="font-weight-semi-bold m-0">SOLD</h5>
                </div>
            </div>
                    
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"><%out.println(lef);%></h1>
                    <h5 class="font-weight-semi-bold m-0">AVAILABLE</h5>
                </div>
            </div>        
<%
                    }
                    }catch(ClassNotFoundException | SQLException c){
                    out.println(c.getMessage());
                    }  
%>
    
            
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Statistics -->

    <!-- Categories Start -->
    <div class="container-fluid pt-5" id="category">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
        <div class="row px-xl-5 pb-3">
            <% 
                try{ 
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                    Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
                    st = conn.createStatement();
                    String sql = "SELECT *, COUNT(categories.id)"
                                    + " FROM products INNER JOIN categories ON products.category = categories.id"
                                    + " GROUP BY products.category";
                    ResultSet rs = st.executeQuery(sql);
                    while(rs.next()){
            %>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="">
                    <div class="cat-item d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="img/<%=rs.getString("cat_image") %>" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6><%=rs.getString("categories.category") %></h6>
                            <small class="text-body"><%=rs.getInt("COUNT(categories.id)") %> Products</small>
                        </div>
                    </div>
                </a>
            </div>
            <%
                }
       
                }catch(ClassNotFoundException | SQLException c){
                    out.println(c.getMessage());
                }  
            %>
        </div>
    </div>
    <!-- Categories End -->



    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3" id="featured_products">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Featured Products</span></h2>
        <div class="row px-xl-5">
            
            <% 
                try{ 
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                    Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
                    st = conn.createStatement();
                    String sql = "SELECT * FROM products INNER JOIN categories ON products.category = categories.id INNER JOIN product_line ON products.product_term = product_line.id";
                    ResultSet rs = st.executeQuery(sql);
                    while(rs.next()){
                    int product_id = rs.getInt("products.id");
            %>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <div class="product-item bg-light mb-4">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/<%=rs.getString("image") %>" alt="">
                            <div class="product-action">
                                <form method="POST" action="manager_cart">
                                    <input hidden="true" value="<%=user_id%>" name="user_id">
                                    <input hidden="true" value="<%=product_id%>" name="product_id">

                                    <button type="submit" class="btn btn-outline-dark btn-square"><i class="fa fa-shopping-cart"></i></button>
                                </form>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href=""><%=rs.getString("products") %></a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>$<%=rs.getString("price") %></h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small>(99)</small>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                    }
       
                    }catch(ClassNotFoundException | SQLException c){
                    out.println(c.getMessage());
                    }  
             %>
        </div>
    </div>
    <!-- Products End -->