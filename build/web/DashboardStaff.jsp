
<%
    String user = null;
    if(session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        
    }else {user = (String)session.getAttribute("user");}
%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.SQLException"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.DriverManager"%>




<!-- Head -->
<jsp:include page="includes/header.jsp" flush="true"></jsp:include>
<!-- Head -->

<!-- Topbar & Navbar -->
<jsp:include page="includes/staff_navbar.jsp" flush="true"></jsp:include>
<!-- Topbar & Navbar -->

<!-- Staff Allocation  -->
    <button  id="allocate_staff" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Allocating Staffs To Different Product Line</button>
       <div class="container-fluid">
           <div class="row px-xl-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Date Added</th>
                            <th>Gender</th>
                            <th>Emails</th>
                            <th>Quantity</th>
                            <th>Remainders</th>
                            <th>Performance</th>
                            <th>Product-Line</th>
                        </tr>
                    </thead>
                    <% 
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart","root","");
                        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                        st = conn.createStatement();
                        String sql = "SELECT * FROM users INNER JOIN product_line ON users.product_line = product_line.id";
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                        if(user.equals(rs.getString("user"))) {
                        
                        
                        
                            int total = rs.getInt("quantity");
                            int left = rs.getInt("quantity_left");
                            double percentage = 100-((double)left/total)*100;
                    %>
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><%=rs.getInt("id") %></td>
                            <td class="align-middle"><%=rs.getString("user") %></td>
                            <td class="align-middle"><%=rs.getString("date_added") %></td>
                            <td class="align-middle"><%=rs.getString("gender") %></td>
                            <td class="align-middle"><%=rs.getString("email") %></td>
                            <td class="align-middle"><%=rs.getString("product_line.quantity") %></td>
                            <td class="align-middle"><%=rs.getString("product_line.quantity_left") %></td>
                            <td class="align-middle"><%=percentage%>%</td>
                            <td class="align-middle"><%=rs.getString("product_line.product_term") %></td>
                            
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
<!-- staff_allocation -->

<!-- Statistics -->
<jsp:include page="includes/customer_body.jsp" flush="true"></jsp:include>
<!-- Statistics -->


<!-- Footer -->
<jsp:include page="includes/footer.jsp" flush="true"></jsp:include>
<!-- Footer -->