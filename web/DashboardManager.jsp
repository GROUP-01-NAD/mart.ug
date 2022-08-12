
<%
    String user = null;
    if(session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        
    }else {user = (String)session.getAttribute("user");}
%>

<!-- Head -->
<jsp:include page="includes/header.jsp" flush="true"></jsp:include>
<!-- Head -->

<!-- Topbar & Navbar -->
<jsp:include page="includes/manager_navbar.jsp" flush="true"></jsp:include>
<!-- Topbar & Navbar -->


<!-- Statistics -->
<jsp:include page="includes/manager_body.jsp" flush="true"></jsp:include>
<!-- Statistics -->



<!-- Footer -->
<jsp:include page="includes/footer.jsp" flush="true"></jsp:include>
<!-- Footer -->