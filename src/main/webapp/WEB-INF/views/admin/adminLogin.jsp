<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hello World!</title>
<link rel="icon" type="image/png" href="adminLogin/images/icons/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="adminLogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="adminLogin/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="adminLogin/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="adminLogin/css/util.css">
<link rel="stylesheet" type="text/css" href="adminLogin/css/main.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="adminLogin/vendor/animsition/js/animsition.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="adminLogin/js/main.js"></script>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form action="admin/adminLogin" method="post" class="login100-form validate-form flex-sb flex-w" id="frm">
					<span class="login100-form-title p-b-51">
						ADMIN LOGIN
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input id="name" class="input100" type="text" name="name" placeholder="Username">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input id="pw" class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
							
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button id="loginBtn" class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>