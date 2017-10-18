<#import "/spring.ftl" as spring/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Car Repair</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<style>

    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
        margin-bottom: 0;
        border-radius: 0;
        background-color: #2B3A37;
    }

    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}

    /* Set gray background color and 100% height */
    .sidenav {
        padding-top: 20px;
        background-color: #e0f2f1;
        height: 100%;
    }

    /* Set black background color, white text and some padding */

    #Intro{
        padding-left:20px;
        padding-right:20px;
        font-size: 170%;
        font-weight: bold;
        padding-top:50px;
    }
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
        .sidenav {
            height: auto;
            padding: 15px;
        }
        .row.content {height:auto;}
    }
    form {
        border: 3px solid #f1f1f1;
    }

    input[type=text], input[type=password] {

        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;

        width: 300px;
        height: 80px;
        border: solid #ccc;
        box-sizing: border-box;
    }

    button {
        background-color: #2B3A37;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }

    button:hover {
        opacity: 0.8;
    }

    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }

    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }

    span.psw {
        float: right;
        padding-top: 16px;
    }

    .col-25 {
        float: left;
        width: 100%;
        margin-top: 10px;
    }

    .col-75 {
        float: left;
        width: 100%;
        margin-top: 10px;
    }

    @media (max-width: 600px) {
        .col-25, .col-75, input[type=submit] {
            width: 100%;
            margin-top: 0;
        }
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
    #repairsId{
        font-weight: bold;
        font-size: 200%;
        font-style: normal ;
        color: white;
    }
</style>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    
        <div class="navbar-header">
            <p class="navbar-brand"id="repairsId">CAR Repairs<p>
        </div>
        <ul class="nav navbar-nav">
                <li class="#"><a href="#">Home</a></li>
        </ul>        

    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <#if owner??>
      <form  method="post" action="/editOwner" name="ownerEditForm"><#--TODO make an endpoint for this-->
        <div class="imgcontainer">
          <img src="img_avatar2.png" alt="Avatar" class="avatar">
        </div>
      
        <div class="container">
          <label><b>Enter Username</b></label>
          <input type="text" id="email" placeholder="email" name="email"  value=${owner.email} required>
        </br>
          <label><b> Enter Surnames</b></label>
          <input type="password" id="firstName" placeholder="firstName" name="firstName" value=${owner.firstName} required>
        </br>
          <label><b>Enter Your AFM</b></label>
          <input type="text" id="lastName" placeholder="lastName" name="lastName" value=${owner.lastName} required>
        </br>
          <label><b>Enter Password</b></label>
          <input type="text" id="password" placeholder="password" name="password" value=${owner.password} required>
        </br>     
          <label><b>Vehicle - Brand</b></label>
          <input type="text" id="vat" placeholder="vat" name="vat" value=${owner.vat} required>
        </br>
          <label><b>Vehicle - Plates</b></label>
          <input type="text" id="role" placeholder="role" name="role" value=${owner.role} required>

        </br>

            <button type="button" class=".btn-primary">Update</button>
          
            </br>
            <button type="button" class="cancelbtn">Delete</button>
        </div>
      </form>
    
    </#if>
  </div>
</div>

</body>

<script>

    $(document).ready(function(){
        var emailField = $('#email');
        emailField.attr('text', '${owner.email}');
    }

</script>

</html>