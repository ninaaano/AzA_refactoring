<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>



<head>
   
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Reset Password - Material Admin Pro</title>
        <!-- Load Favicon-->
        <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
        <!-- Load Material Icons from Google Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
        <!-- Roboto and Roboto Mono fonts from Google Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet">
        <!-- Load main stylesheet-->
<link href="/resources/css/template.css" rel="stylesheet" />
<link href="/resources/css/common.css" rel="stylesheet" />
<link href="/resources/css/main.css" rel="stylesheet" />    
 
 <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />

<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet" />



<meta charset="UTF-8">
<title>Find ID</title>
<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

*, body {
   font-family: Pretendard, 'Noto Sans KR';

  
}


body {
	background-color: white;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
	overflow: hidden;
}


.form-signin .btn {
	font-size: 100%;
	
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}

.form-label-group {
	position: relative;
	margin-bottom: 1rem;
	
}

.form-label-group input {
	height: auto;
	
	
}

.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: inline_block;
	width: 100%;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
	color: transparent;
}

.form-label-group input:-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-moz-placeholder {
	color: transparent;
}

.form-label-group input::placeholder {
	color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}

.form-label-group input:not(:placeholder-shown) ~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 15px;
	color: #777;
}


</style>
<!-- Load Favicon-->


</head>

		<body class="bg-primary">
        <!-- Layout wrapper-->
        <div id="layoutAuthentication">
            <!-- Layout content-->
            <div id="layoutAuthentication_content">
                <!-- Main page content-->
                <main>
                    <!-- Main content container-->
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
                                <div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4">
                                    <div class="card-body p-5">
                                        <!-- Auth header with logo image-->
                                        <div class="text-center">
                                           <img class="mb-3" src="/resources/img/logo2.png" alt="..."
                                 style="height: 100px">
                                            <h1 class="display-5 mb-4">아이디 찾기</h1>
                                        </div>
                                        <!-- Reset password submission form-->
                                        <form method="post" class="form-signin" action="find_id" name="findform">
                                        
                                        
                                        
                                        
                                        
                             
                                            
<div class="row mb-4">
    <label for="name" class="col-sm-4 col-form-label">이름</label>
    <div class="col-auto">
      <input type="text" class="form-control" id="userName" name="userName">
    </div>
  </div>
  
  
  <div class="row mb-4">
    <label for="phone" class="col-sm-4 col-form-label">핸드폰번호</label>
    <div class="col-auto">
      <input type="text" class="form-control" id="phone" name="phone">
    </div>
  </div>
                                            
                                            
<div class="form-label-group d-flex align-items-center justify-content-between">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
			<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button">취소</button>
		</div>           
		
		
				<!-- 이름과 전화번호가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.userName.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0 }">
		<label>찾으시는 아이디는 '${id}' 입니다.</label>
		<div class="form-label-group d-flex align-items-center justify-content-between my-8">
					<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button">비밀번호 재설정</button>
					<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button">로그인 화면으로</button>
			</div>
		</c:if>                               
                                        
                                            
                                 </form>
                                    </div>
                                </div>
                                <!-- Auth card message-->
                                <div class="text-center mb-5"><a class="small fw-500 text-decoration-none link-white" href="/user/addUser">가입된 정보가 없으신가용? 회원가입하세요!</a></div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <!-- Layout footer-->
            <div id="layoutAuthentication_footer">
                <!-- Auth footer-->
             
            </div>
        </div>
        <!-- Load Bootstrap JS bundle-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- Load global scripts-->
 

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	$( function() {
		$("button:contains('비밀번호 재설정')").on("click" , function() {
			self.location = "/user/findPassword"
		});
	});
	
	$( function() {
		$("button:contains('로그인 화면으로')").on("click" , function() {
			self.location = "http://127.0.0.1:8080/"
		});
	});
	
	$( function() {
		$("button:contains('취소')").on("click" , function() {
			self.location = "http://127.0.0.1:8080/"
		});
	});

		
	</script>
</body>
</html>