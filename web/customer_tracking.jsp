<!-- Head -->
<jsp:include page="includes/header.jsp" flush="true"></jsp:include>
<!-- Head -->
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.SQLException"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.DriverManager"%>


<!-- Product_category  -->
<button class="btn btn-block btn-primary font-weight-bold my-3 py-3">Customer Base Tracking</button>
    <div class="container-fluid">
        <a href="DashboardManager.jsp" class="btn btn-block btn-primary col-md-6 form-group">DASHBOARD</a>
        <a href="#reviews" class="h6 text-primary bg-dark px-2" style="color: yellow; font-size: 30px;">Reviews</a>
            <div class="col-lg-8 table-responsive mb-5">
                <div class="col-md-6 form-group">
                    <p class="table table-light table-borderless table-hover text-center mb-0">Products Already Ordered</p>
                </div>
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Product</th>
                            <th>Customer</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <% 
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                        st = conn.createStatement();
                        String sql = "select * from cart INNER JOIN products ON products.id = cart.product_id INNER JOIN users ON users.id = cart.user_id";
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                        if(rs.getInt("status") == 0){
                    %>
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><%=rs.getInt("cart.id") %></td>
                            <td class="align-middle"><%=rs.getString("products.products") %></td>
                            <td class="align-middle"><%=rs.getString("users.user") %></td>
                            <td class="align-middle"><%=rs.getString("products.price") %></td>
                        </tr>
                    </tbody>
                    <%
                        }
                        }
       
                    }catch(ClassNotFoundException | SQLException c){
                    out.println(c.getMessage());
                    }  
                    %>
                </table>
            </div>
                
    </div>

    
                
<!-- Product_category  -->
<button class="btn btn-block btn-primary font-weight-bold my-3 py-3" id="reviews">Customer Reviews</button>
    <div class="container-fluid">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Product</th>
                            <th>Customer</th>
                            <th>Likes</th>
                        </tr>
                    </thead>
                    <% 
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                        st = conn.createStatement();
                        String sql = "SELECT * "
                                     + " FROM reviews INNER JOIN products ON products.id = reviews.product INNER JOIN users ON users.id = reviews.user";
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                    %>
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><%=rs.getInt("reviews.id") %></td>
                            <td class="align-middle"><%=rs.getString("products.products") %></td>
                            <td class="align-middle"><%=rs.getString("users.user") %></td>
                            <td class="align-middle"><%=rs.getString("reviews.like") %></td>
                        </tr>
                    </tbody>
                    <%
                        }
       
                    }catch(ClassNotFoundException | SQLException c){
                    out.println(c.getMessage());
                    }  
                    %>
                </table>
               
            </div>
                
    <button class="btn btn-block btn-primary font-weight-bold my-3 py-3" id="reviews">Summaries of Reviews By Products</button>            
      <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Product ID</th>
                            <th>Total Likes</th>
                        </tr>
                    </thead>
                    <% 
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                        st = conn.createStatement();
                        String sql = "SELECT reviews.product, SUM(reviews.like) as total_likes "
                        + " FROM reviews GROUP BY reviews.product HAVING SUM(reviews.product) > 0 ";
                        ResultSet rs = st.executeQuery(sql);
                        
                        while(rs.next()){
                            
                    %>
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><%=rs.getInt("reviews.product") %></td>
                            <td class="align-middle"><%=rs.getInt("total_likes") %></td>
                        </tr>
                    </tbody>
                    <%
                        }
       
                    }catch(ClassNotFoundException | SQLException c){
                    out.println(c.getMessage());
                    }  
                    %>
                </table>
            </div>          
                
    </div>

                
                     
                
                
                


<!-- Footer -->
<jsp:include page="includes/footer.jsp" flush="true"></jsp:include>
<!--ter -->