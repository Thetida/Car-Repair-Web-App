<!DOCTYPE html>
<html lang="en">
<head>
    <title>Car Repair</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/loginForm.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

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
            <!--<ul class="nav navbar-nav navbar-right">
             <li id="pagingNum"> 1 of 20</li>
            </ul>   -->
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <form action="/action_page.php">
            <div class="imgcontainer">
                <img src="img_avatar2.png" alt="Avatar" class="avatar">
            </div>

            <div class="container">
                <label><b>Username</b></label>
                <input type="text" placeholder="Enter Name" name="uname" required>

                <label><b>Surname</b></label>
                <input type="password" placeholder="Enter Surname" name="psw" required>

                <label><b>Password</b></label>
                <input type="text" placeholder="Enter Password" name="uname" required>

                <div class="col-25">
                    <label for="country">Type</label>
                </div>
                <div class="col-75">
                    <select id="country" name="Type">
                        <option value="User">Admin</option>
                        <option value="Owner">Owner</option>

                    </select>
                </div>


                <button type="submit">Login</button>
                <input type="checkbox" checked="checked"> Remember me
            </div>

            <div class="container" style="background-color:#f1f1f1">
                <button type="button" class="cancelbtn">Cancel</button>
                <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
        </form>


    </div>
</div>

</body>
</html>