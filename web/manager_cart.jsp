<%-- 
    Document   : customer_cart
    Created on : Aug 11, 2022, 4:12:36 PM
    Author     : samuel
--%>

<%
    int total = 0;
    String user = null;
    int user_id = (int)session.getAttribute("user_id");
    if(session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        
    }else {user = (String)session.getAttribute("user");}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/In_cart.tld" prefix="cart" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%> 
<% ArrayList<String> cart_products = new ArrayList<String>();%>


<!-- Head -->
<jsp:include page="includes/header.jsp" flush="true"></jsp:include>
<!-- Head -->
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-1 px-xl-5">
            <div class="col-lg-6 text-center text-lg-right">
                
                <div class="d-inline-flex align-items-center d-block d-lg-none">
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-heart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                    </a>
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-shopping-cart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">MART</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">SHOP</span>
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-4 col-6 text-right">
                <div class="d-inline-flex align-items-center">  
                    <div class="hh1 text-uppercase text-dark bg-primary px-2 ml-n1">
                        <p style="color:dark">${requestScope.success}</p>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Manager Dashboard</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item"><%=user %></button>
                            <form method="post" action="auth_login.jsp">
                                <input type="hidden" id="action" name="auth" value="mart_logout" hidden>
                                <input type="submit" class="dropdown-item" value="logout">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->

    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                    <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown dropright">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                <a href="" class="dropdown-item">Men's Dresses</a>
                                <a href="" class="dropdown-item">Women's Dresses</a>
                                <a href="" class="dropdown-item">Baby's Dresses</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">Shirts <i class="fa fa-angle-right float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                <a href="" class="dropdown-item">Men's Shirts</a>
                                <a href="" class="dropdown-item">Women's Shirts</a>
                                <a href="" class="dropdown-item">Baby's Shirts</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <span class="h1 text-uppercase text-dark bg-light px-2">Mart</span>
                        <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="DashboardManager.jsp" class="nav-item nav-link">Home</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                            <a href="" class="btn px-0">
                                <i class="fas fa-heart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>
                            <a href="manager_cart.jsp" class="btn px-0 ml-3">
                                <i class="fas fa-shopping-cart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;"><cart:cart user_id="${user_id}"/></span>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="#">Home</a>
                    <a class="breadcrumb-item text-dark" href="#">Shop</a>
                    <span class="breadcrumb-item active">Shopping Cart</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="col-md-6 form-group">
            <p style="color:green">${requestScope.error}</p>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Products</th>
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
                        String sql = "SELECT * FROM cart INNER JOIN products ON cart.product_id = products.id INNER JOIN users ON cart.user_id = users.id";
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                        if(user_id == rs.getInt("user_id")) {
                        cart_products.add(rs.getString("products.products"));
                        total = total + rs.getInt("products.price");
                    %>
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><img class="img-fluid w-5" src="img/<%=rs.getString("products.image") %>" style="width: 50px; alt=""><%=rs.getString("products.products") %></td>
                            <td class="align-middle">$<%=rs.getString("products.price") %></td>
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
                
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5>$<%out.println(total);%></h5>
                        </div>
                        <form action="checkout_all.jsp" method="post">
                            <input type="hidden" id="action" name="checkout" value="checkout_manager" hidden>
                            <input hidden="true" value="<%=user_id%>" name="manager_id">
                            <button type="submit" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</button>
                        </form>
                 
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- Cart End -->



<!-- Footer -->
<jsp:include page="includes/footer.jsp" flush="true"></jsp:include>
<!--End Footer -->