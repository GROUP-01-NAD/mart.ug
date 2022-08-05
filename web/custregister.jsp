<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration | Mart</title>
    <link rel="stylesheet" href="style.css">
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Mart</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
            </a>
        </div>
            
        <div class="content">
            <h1 class="h1 text-primary bg-dark px-2" style="color: yellow; font-size: 46px;">Complete Registration And Join Mart</h1>
                <div class="form">
                    <form method="post" action="customerdb.jsp">
                        <h2>Register Here</h2>
                        
                        <div class="col-md-6 form-group">
                            <p style="color:red">${requestScope.user}</p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Full Name</label>
                            <input class="form-control" type="text" placeholder="Eluk Sam" name="name" id="name" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Gender</label>
                            <select class="custom-select" name="gender" id="gender">
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Location</label>
                            <input class="form-control" type="text" placeholder="Kampala" name="location" id="location" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Email</label>
                            <input class="form-control" type="email" placeholder="John@mm" name="email" id="email" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>User Name</label>
                            <input class="form-control" type="text" placeholder="John" name="username" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <p style="color:red">${requestScope.error}</p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Password</label>
                            <input class="form-control" type="password" name="password" id="password" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Confirm Password</label>
                            <input class="form-control" type="password" name="confirm" id="confirm" required>
                        </div>
                        <input type="submit" class="btn btn-block btn-primary col-md-6 form-group" name="submit" value="Register Details">
                    </form>
                    <p class="link">HAVE AN ACCOUNT?</p><br>
                    <a href="login.jsp">LOGIN HERE</a>
                 </div>
        </div>
    </div>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>