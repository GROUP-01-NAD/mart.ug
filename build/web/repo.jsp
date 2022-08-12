<%-- 
    Document   : repo
    Created on : Aug 11, 2022, 3:53:39 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%!Integer y[]={};%>
<%!String x[]={};%>
<%ArrayList<Integer> ylabel=new ArrayList<Integer>(Arrays.asList(y));%>

<%ArrayList<String> xlabel=new ArrayList<String>(Arrays.asList(x));%>
<%!ResultSet res;%>

<%!Integer pay[]={};%>
<%!Integer name[]={};%>
<%ArrayList<Integer> paylabel=new ArrayList<Integer>(Arrays.asList(pay));%>
<%ArrayList<Integer> namelabel=new ArrayList<Integer>(Arrays.asList(name));%>


<%!ResultSet rest;%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>REPORTS</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  </head>
  <body>
       <%
        try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart", "root", "");
                    Statement st = conn.createStatement();
                    
                    //BAR CHART
                    res=st.executeQuery("select quantity,quantity_left,products from products");
                    while(res.next()){
                        xlabel.add("'"+res.getString("Products")+"'");
                     int n=   res.getInt("quantity");
                     int m =  res.getInt("quantity_left");
                        int Quantity =n-m;
                        
                       ylabel.add(Quantity);
                    }
                    
//                     res=st.executeQuery("select quantity,quantity_left,products from products");
//                    while(res.next()){
//                        xlabel.add("'"+res.getString("Products")+"'");
//                     int n=   res.getInt("quantity");
//                     int m =  res.getInt("quantity_left");
//                        int Quantity =n-m;
//                        
//                       ylabel.add(Quantity);
//                    }
//                    out.println(ylabel);
                    //PIE CHART
//                    rest=st.executeQuery("select product from preferences");
//                    while(rest.next()){
//                  xlabel.add("'"+res.getString("Product")+"'");
//                     int n=   res.getInt("quantity");
//                     int m =  res.getInt("quantity_left");
//                        int Quantity =n-m;
//                        
//                       ylabel.add(Quantity);
//                    }
//                    out(ylabel);.println
//                    //PIE CHART
//                   st.executUpdate("SELECT COUNT(CASE WHEN UPPER(Gender) = 'M' THEN 1 END) Male"+','+ "COUNT(CASE WHEN UPPER(Gender) = 'F' THEN 1 END) Female"+"from users");
//                    rest=st.executeQuery("select Male,Female from users");
//                    while(rest.next()){
//                        int male= res.getInt("Males");
//                        int female=res.getInt("Females");
//                      
//                        
//                          namelabel.add(male);
//           
//                     paylabel.add(female);
//                     
//                    }
//                    out.println(paylabel);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
        
<!--<div class="row px-xl-5">-->
                <a href="DashboardManager.jsp" class="btn btn-block btn-primary col-md-6 form-group">DASHBOARD</a>
               
<!--</div>-->
    <h1>GENERAL REPORT</h1>
    <div class="container">
        <div class="row">
            <div class="col-6 chart">
                <canvas id="myChart" width="500" height="400"></canvas>
            </div>
            <div class="col-6 chart">
                <canvas id="myChart2" width="500" height="400"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-6 chart">
                <canvas id="myChart3" width="500" height="400"></canvas>
            </div>
            <div class="col-6 chart">
                <canvas id="myChart4" width="500" height="400"></canvas>
            </div>
        </div>
    </div>
    <script>
        let labels1 = ['MALE', 'FEMALE'];
        let data1 = [69, 31];
        let colors1 = ['#49A9EA', '#36CAAB'];
        
        let myDoughnutChart = document.getElementById("myChart").getContext('2d');
        
        let chart1 = new Chart(myDoughnutChart, {
            type: 'doughnut',
            data: {
                  labels: ['MALE', 'FEMALE'],
                datasets: [ {
                    data: [7, 2],
                    backgroundColor: ['#49A9EA', '#36CAAB']
                }]
            },
            options: {
                title: {
                    text: "GENDER",
                    display: true
                }
            }
        });
        
//        let labels2 = ['Books', 'Pens', 'Pencil', 'Towels'];
//        let data2 = [199.6, 130.3, 126.3, 130];
        let colors2 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF','#36CAAB'];
        
        let myChart2 = document.getElementById("myChart2").getContext('2d');
        
        let chart2 = new Chart(myChart2, {
            type: 'bar',
            data: {
                labels: <%out.println(xlabel);%>,
        datasets: [{
            label: 'Sales',
            data: <%out.println(ylabel);%>,
                    backgroundColor: colors2
                }]
            },
            options: {
                title: {
                    text: "SALES",
                    display: true
                },
                legend: {
                  display: false
                }
            }
        });
        
        
//        let labels3 = ['Attack', 'Defense', 'Passing', 'Tackle', 'Speed'];
//        let myChart3 = document.getElementById("myChart3").getContext('2d');
//        
//        let chart3 = new Chart(myChart3, {
//            type: 'radar',
//            data: {
//                labels: labels3,
//                datasets: [
//                  {
//                    label: 'Messi',
//                    fill: true,
//                    backgroundColor: "rgba(179, 181, 198, 0.2)",
//                    borderColor: "rgba(179, 181, 198, 1)",
//                    pointBorderColor: "#fff",
//                    pointBackgroundColor: "rgba(179, 181, 198, 1)",
//                    data: [50, 12, 55, 7, 29]
//                  },
//                  {
//                    label: 'Ronaldo',
//                    fill: true,
//                    backgroundColor: "rgba(255, 99, 132, 0.2)",
//                    borderColor: "rgba(255, 99, 132, 1)",
//                    pointBorderColor: "#fff",
//                    pointBackgroundColor: "rgba(255, 99, 132, 1)",
//                    data: [51, 10, 32, 20, 44]
//                  }
//                ]
//            },
//            options: {
//                title: {
//                    text: "Skills",
//                    display: true
//                }
//            }
//        });
//        
        let labels4 = ['Shoes', 'Fake Phone', 'Dior Shirts', 'Clarks', 'Red Dresses', 'Indian Posho','German Sherperd'];
        let data4 = [83, 67, 66, 61, 47, 187,50];
        let colors4 = ['#49A9EA', '#36CAAB', '#34495E', '#B370CF', '#AC5353', '#CFD4D8', '#FF0000'];
        
        let myChart4 = document.getElementById("myChart4").getContext('2d');
        
        let chart4 = new Chart(myChart4, {
            type: 'pie',
            data: {
                labels: labels4,
                datasets: [ {
                    data: data4,
                    backgroundColor: colors4
                }]
            },
            options: {
                title: {
                    text: "Products likes",
                    display: true
                }
            }
        });
        </script>
  </body>
</html>

