<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet" />
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet" />


<!-- 회원가입용 Load main stylesheet-->
<link href="/resources/css/template.css" rel="stylesheet" />





<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}

.id_ok {
	color: #6A82FB;
	display: none;
}

.id_already {
	color: red;
	display: none;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->


</head>

<body class="bg-primary">
	<!-- Layout wrapper-->
	<div id="layoutAuthentication">
		<!-- Layout content-->
		<div id="layoutAuthentication_content">
			<!-- ToolBar Start /////////////////////////////////////-->
			<div class="navbar  navbar-default">
				<div class="container">
					<a class="navbar-brand" href="http://127.0.0.1:8080/">로그인 화면으로</a>
				</div>
			</div>
			<!-- ToolBar End /////////////////////////////////////-->
			<!-- Main page content-->
			<main>
				<!-- Main content container-->
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xxl-7 col-xl-10">
							
								<div class="card-body p-5">
									<!-- Auth header with logo image-->
									<!--  화면구성 div Start /////////////////////////////////////-->
									<div id="layoutAuthentication">
										<div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-5">

											<div class="container">
												<div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-5">
													<h1 class="bg-primary text-center">회 원 가 입</h1>

													<!-- form Start /////////////////////////////////////-->
													<form class="form-horizontal">


														<select name="role" id="role">
															<option value="teacher">선생님</option>
															<option value="student">학생</option>
															<option value="parents">학부모</option>
														</select>

														<div class="form-group">
															<label for="userId"
																class="col-sm-offset-1 col-sm-3 control-label">아
																이 디</label>
															<div class="col-sm-4">
																<input type="text" class="form-control" id="userId"
																	name="userId" placeholder="아이디를 입력하세요"
																	oninput="checkDuplication()" /> <span class="id_ok">사용
																	가능한 아이디입니다.</span> <span class="id_already">사용중인 아이디
																	입니다.</span>
															</div>
														</div>

														<div class="form-group">
															<label for="password"
																class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
															<div class="col-sm-4">
																<input type="password" class="form-control"
																	id="password" name="password" placeholder="비밀번호">
															</div>
														</div>

														<div class="form-group">
															<label for="password2"
																class="col-sm-offset-1 col-sm-3 control-label">비밀번호
																확인</label>
															<div class="col-sm-4">
																<input type="password" class="form-control"
																	id="password2" name="password2" placeholder="비밀번호 확인">
															</div>
														</div>

														<div class="form-group">
															<label for="userName"
																class="col-sm-offset-1 col-sm-3 control-label">이름</label>
															<div class="col-sm-4">
																<input type="text" class="form-control" id="userName"
																	name="userName" placeholder="이름">
															</div>
														</div>


														<!--         <div class = "student" style = "display:none;" id="student">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="birth" name="birth" placeholder="앞자리 8자리">
		    	 <span class="error_next_box">
		      	 <strong class="text-danger">ex) 20001010 </strong>
		      </span>
		    </div>
		  </div>

 -->

														<!-- 핸드폰 인증 -->
														<div class="form-group">

															<label for="phone">휴대전화 ('-' 없이 번호만 입력해주세요) </label>
														</div>

														<div class="form-row">
															<div class="form-group col-md-8">
																<input type="text" class="form-control" id="phone"
																	name="phone" placeholder="ex)01012345678" required>
																<div id="phoneCheck"></div>
															</div>

															<div class="form-group col-md-4">
																<button type="button" class="genric-btn danger radius"
																	onclick="cert();">인증번호 받기</button>
															</div>

														</div>

														<div class="form-row">
															<div class="form-group col-md-8">
																<input type="text" class="form-control"
																	id="certification" placeholder="인증번호를 입력해주세요" required>
																<div class="form-group" id="certCheck"></div>
															</div>

															<div class="form-group col-md-4">
																<button type="button" class="genric-btn danger radius"
																	id="sms_AuthBtn" onclick="smsAuthBtn();">확인</button>
															</div>


														</div>

														<input type="hidden" id="randomVal" value="" />



														<!-- 학생 입력 정보 -->
														<div class="student" style="display: none;">
															<label for="school"
																class="col-sm-offset-1 col-sm-3 control-label">학교</label>
															<div class="col-sm-4">
																<input type="text" class="form-control" id="school"
																	name="school" placeholder="학교 이름">
															</div>



															<label for="grade"
																class="col-sm-offset-1 col-sm-3 control-label">학년</label>
															<div class="col-sm-4">
																<input type="text" class="form-control" id="grade"
																	name="grade" placeholder="숫자만 입력하세요">
															</div>



															<!--         <div class = "student" style = "display:none;">
		    <label for="parentPhone" class="col-sm-offset-1 col-sm-4 control-label">부모님 핸드폰번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="parentPhone" name="parentPhone" placeholder="숫자만 입력하세요">
		    </div>
		  </div>
-->
															<!-- BIRTH -->

															<h3 class="join_title">
																<label for="yy">생년월일</label>
															</h3>

															<div id="bir_wrap">
																<!-- BIRTH_YY -->
																<div id="bir_yy">
																	<span class="box"> <input type="text" id="yy"
																		class="int" maxlength="4" placeholder="년(4자)">
																	</span>
																</div>

																<!-- BIRTH_MM -->
																<div id="bir_mm">
																	<span class="box"> <select id="mm" class="sel">
																			<option>월</option>
																			<option value="01">1</option>
																			<option value="02">2</option>
																			<option value="03">3</option>
																			<option value="04">4</option>
																			<option value="05">5</option>
																			<option value="06">6</option>
																			<option value="07">7</option>
																			<option value="08">8</option>
																			<option value="09">9</option>
																			<option value="10">10</option>
																			<option value="11">11</option>
																			<option value="12">12</option>
																	</select>
																	</span>
																</div>

																<!-- BIRTH_DD -->
																<div id="bir_dd">
																	<span class="box"> <input type="text" id="dd"
																		class="int" maxlength="2" placeholder="일">
																	</span>
																</div>

															</div>
															<span class="error_next_box"></span>
														</div>


														<!-- 14세 미만일때 -->
														<!-- 		<div class="student" style="display: none;">
				<label for="parentName"
					class="col-sm-offset-1 col-sm-4 control-label">보호자 이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" placeholder="숫자만 입력하세요">
				</div>
			</div>

			<div class="student" style="display: none;">
				<label for="parentPhone"
					class="col-sm-offset-1 col-sm-4 control-label">보호자 생년월일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" placeholder="숫자만 입력하세요">
				</div>
			</div>

			<div class="student" style="display: none;">
				<label for="parentPhone"
					class="col-sm-offset-1 col-sm-4 control-label">통신사</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" placeholder="숫자만 입력하세요">
				</div>
			</div>
			<div class="student" style="display: none;">
				<div class="form-group">
					<label for="phone">휴대전화 ('-' 없이 번호만 입력해주세요) </label>
				</div>

				<div class="form-row">
					<div class="form-group col-md-8">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="ex)01012345678" required>
						<div id="phoneCheck"></div>
					</div>

					<div class="form-group col-md-4">
						<button type="button" class="genric-btn danger radius"
							onclick="cert();">인증번호 받기</button>
					</div>

				</div>

				<div class="form-row">
					<div class="form-group col-md-8">
						<input type="text" class="form-control" id="certification"
							placeholder="인증번호를 입력해주세요" required>
						<div class="form-group" id="certCheck"></div>
					</div>

					<div class="form-group col-md-4">
						<button type="button" class="genric-btn danger radius"
							id="sms_AuthBtn" onclick="smsAuthBtn();">확인</button>
					</div>


				</div>

				<input type="hidden" id="randomVal" value="" />
			</div>
			 -->


														<div class="parents" style="display: none;">
															<label for="firstStudentId"
																class="col-sm-offset-1 col-sm-4 control-label">학생
																아이디</label>
															<div class="form-group col-md-8">
																<input type="text" class="form-control"
																	id="firstStudentId" name="firstStudentId"
																	placeholder="자녀 아이디" oninput="checkStudent()" />
																<div class="form-group" id="certCheck2"></div>
															</div>
														</div>

														<div class="parents" style="display: none;">
															<label for="relationName"
																class="col-sm-offset-1 col-sm-3 control-label">학생과의
																관계</label>
															<div class="col-sm-4">
																<input type="text" class="form-control"
																	id="relationName" name="relationName"
																	placeholder="학생과의 관계">
															</div>
														</div>

														<div class="agree-checkbox">
															<div class="agree__all">
																<div class="all-wrap">
																	<input type="checkbox" id="check_all" name="selectall"
																		onclick="selectAll(this)" /> <label for="check_all">사용자
																		약관 전체 동의</label>
																</div>
															</div>
															<details>
																<summary>
																	<div class="agree__box">
																		<input type="checkbox" id="check_service"
																			name="agreecheck" onclick="checkSelectAll()" /> <label
																			for="check_service"> 서비스 이용 약관 동의 (필수) </label>
																	</div>
																</summary>
																<div class="agree__text">
																	개인정보 수집 및 이용 동의 <br /> 1. 수집항목: [필수] 이름, 연락처 <br />
																	2. 수집 및 이용목적: 서비스 이용을 위한 수집 <br /> 3. 보관기간: 회원탈퇴 등
																	개인정보 이용목적 달성 시까지 보관. 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’
																	등 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함 <br /> 4.
																	동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이
																	경우 상품 및 서비스 예약이 제한될 수 있습니다. 개인정보 제3자 제공 동의 <br /> <br />
																	1. 개인정보를 제공받는 자: AZA 호스트 <br /> 2. 제공하는 개인정보 항목: [필수]
																	AZA 아이디, 이름, 연락처 <br /> 3. 개인정보를 제공받는 자의 개인정보 보유 및
																	이용기간: 개인정보 이용목적 달성 시 까지 보존합니다. <br /> 4. 동의 거부권 등에 대한
																	고지: 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이
																	제한될 수 있습니다.
																</div>
															</details>
															<details>
																<summary>
																	<div class="agree__box">
																		<input type="checkbox" id="check_privacy"
																			name="agreecheck" onclick="checkSelectAll()" /> <label
																			for="check_privacy"> 개인정보 취급방침 동의 (필수) </label>
																	</div>
																</summary>
																<div class="agree__text">
																	제 1조 (총칙) <br /> 1. 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어
																	있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보 (당해 정보만으로는
																	특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다.)
																	를 말합니다. <br /> 2. AZA는 귀하의 개인정보 보호를 매우 중요시하며,
																	‘정보통신망이용촉진 및 정보보호에 관한 법률’ 상의 개인정보 보호규정 및 정보통신부가 제정한
																	‘개인정보 보호지침’을 준수하고 있습니다. <br /> 3. AZA는 개인정보취급방침을 정하고
																	이를 귀하께서 언제나 쉽게 확인할 수 있게 공개하도록 하고 있습니다. <br /> 4. AZA는
																	개인정보 처리방침의 지속적인 개선을 위하여 개정하는데 필요한 절차를 정하고 있으며, 개인정보
																	처리방침을 회사의 필요한 사회적 변화에 맞게 변경할 수 있습니다. 그리고 개인정보처리방침을 개정하는
																	경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고 있습니다. <br />
																	<br /> 제 2조 (수집하는 개인정보 항목 및 수집방법) <br /> 1. AZA의 서비스를
																	이용하시고자 할 경우 다음의 정보를 입력해주셔야 합니다. <br /> - 입력항목 : 희망ID,
																	비밀번호, 성명, 연락처 <br /> 2. 또한 서비스 이용과정이나 사업 처리 과정에서 아래와
																	같은 정보들이 생성되어 수집될 수 있습니다. <br /> - 회원가입 시 회원이 원하시는 경우에
																	한하여 추가 정보를 선택, 제공하실 수 있도록 되어있으며, 일부 재화 또는 용역 상품에 대한 주문
																	및 예약 시 회원이 원하는 정확한 주문 내용 파악을 통한 원활한 고객 응대 및 예약 처리를 위하여
																	추가적인 정보를 요구하고 있습니다. <br /> 3. AZA는 다음과 같은 방법으로 개인정보를
																	수집합니다. <br /> - 로그 분석 프로그램을 통한 생성정보 수집 <br /> 4. 개인정보
																	수집에 대한 동의 <br /> - AZA는 귀하께서 AZA의 개인정보취급방침 및 이용약관의 내용에
																	대해 「동의한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여,
																	「동의한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다. <br /> 5. 14세
																	미만 아동의 개인정보보호 <br /> AZA는 법정 대리인의 동의가 필요한 만14세 미만 아동의
																	회원가입은 받고 있지 않습니다. <br />

																</div>
															</details>
															<details>
																<summary>
																	<div class="agree__box">
																		<input type="checkbox" id="check_above"
																			name="agreecheck" onclick="checkSelectAll()" /> <label
																			for="check_above">만14세 이상 확인 (필수)</label>
																	</div>
																</summary>
																<div class="agree__text">
																	정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 만 14세 미만 아동의 개인정보 수집 시
																	법정대리인의 동의를 받도록 규정하고 있습니다. <br /> 만 14세 미만 아동이 법정대리인 동의
																	없이 회원가입을 할 경우 회원탈퇴 또는 서비스 이용에 제한이 있을 수 있습니다.
																</div>
															</details>
														</div>

														<div class="form-group">
															<div class="col-sm-offset-4  col-sm-4 text-center">
																<button type="button" class="btn btn-primary">가
																	&nbsp;입</button>
																<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
															</div>
														</div>
													</form>
													<!-- form Start /////////////////////////////////////-->
												</div>
											</div>
										</div>
									</div>
								</div>
								</div>
								</div>
								</div>
								
								
			</main>
			</div>
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}

.id_ok {
	color: #6A82FB;
	display: none;
}

.id_already {
	color: red;
	display: none;
}
</style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	

        
		//아이디 체크
		const checkDuplication = _.debounce(async (id) => {
			//var userId = $('#userId').val(); // id값이 userId인 인력란의 값 저장
			var id = $("#userId").val();
			
			
			var isID = /^[a-z0-9][a-z0-9_\-]{4,10}$/;
      		  if (!isID.test(id)) {
					alert("5~10자의 영문 소문자, 숫자만 사용 가능합니다.");
					return false;
      		  }			
      		  
			
			$.ajax({
			//	header :
			//	url:'localhost:8080/user/rest/checkDuplication',
				url:'/user/rest/checkDuplication',
				type:'post',
				data:{id},
				success:function(cnt){ //컨트롤러에서 넘어온 cnt값 받기
					if(cnt == 0) { //0이면 사용가능 아이디
						$('.id_ok').css("display","inline-block");
						$('.id_already').css("display", "none");
						}else{
						$('.id_ok').css("display","none");
						$('.id_already').css("display", "inline-block");
					}
				},
				error:function(){
					alert("에러입니다");
				}
			});
		},1000);
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		

		$(function(){
			$('#password2').blur(function(){
				if($('#password').val() != $('#password2').val()){
					if($('#password2').val() != ''){
						alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
						$('#password2').val('');
						$('#password2').focus();
					}
				}
			})
		});
		
	
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var phone=$("input[name='phone']").val();
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(id.length < 5 || id.length > 11){
				alert("아이디는 5~10자 이내로 만들어주세요.");
				return;
			}
			
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
			
			if(phone == null || phone.length <1){
				alert("핸드폰 인증은 필수입니다.");
				return;
			}
				
			
			
			$("form").attr("method" , "POST").attr("action" , "/user/rest/addUser").submit();
		}
		
		
			$('#role').on('change', function(){
				if($(this).val()=='teacher'){
				$('.student').hide();
				$('.parents').hide();
				} else if ($(this).val()=='student'){
				$('.student').show();
				$('.parents').hide();
				}else{
				$('.student').hide();
				$('.parents').show();

				
				}
			});
	
		/* 생년월일 유효성 검사 */
	var yy = document.querySelector('#yy');
	var mm = document.querySelector('#mm');
	var dd = document.querySelector('#dd');
	var error = document.querySelectorAll('.error_next_box');
	yy.addEventListener("focusout", isBirthCompleted);
	mm.addEventListener("focusout", isBirthCompleted);
	dd.addEventListener("focusout", isBirthCompleted);
	
	function isBirthCompleted() {
	    var yearPattern = /[0-9]{4}/;

	    if(!yearPattern.test(yy.value)) {
	        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
	        error[4].style.display = "block";
	    } else {
	        isMonthSelected();
	    }


	    function isMonthSelected() {
	        if(mm.value === "월") {
	            error[4].innerHTML = "태어난 월을 선택하세요.";
	        } else {
	            isDateCompleted();
	        }
	    }

	    function isDateCompleted() {
	        if(dd.value === "") {
	            error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
	        } else {
	            isBirthRight();
	        }
	    }
	}
	
	function isBirthRight() {
	    var datePattern = /\d{1,2}/;
	    if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
	        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
	    } else {
	        checkAge();
	    }
	}

	function checkAge() {
	    if(Number(yy.value) < 1920) {
	        error[4].innerHTML = "정말이세요?";
	        error[4].style.display = "block";
	    } else if(Number(yy.value) > 2020) {
	        error[4].innerHTML = "미래에서 오셨군요. ^^";
	        error[4].style.display = "block";
	    } else if(Number(yy.value) > 2005) {
	        error[4].innerHTML = "만 14세 미만의 어린이는 보호자 동의가 필요합니다.";
	        error[4].style.display = "block";
	    } else {
	        error[4].style.display = "none";
	    }
	}
	
//		function checkBirth(birthDate){

//		    var birth = /^([0-9]{8})$/;
//		    var today = new Date();
///		    var yyyy = today.getFullYear();
//		    var mm = today.getMonth() < 9 ? "0" + (today.getMonth() + 1) : (today.getMonth() + 1); // getMonth()
//		    var dd  = today.getDate() < 10 ? "0" + today.getDate() : today.getDate();
		      
//		    return parseInt(yyyy+mm+dd) - parseInt(birthDate) - 140000 < 0;

//		}

	
	
	<!--휴대폰 인증 / SMS SENS API -->

	function cert() {
		 var random = Math.floor(Math.random() * 1000000)+"";
		 var phone = $("#phone").val();	
		 alert("phone"+phone);
		 $('#randomVal').val(random);
			var obj = {
					"type" : "SMS",
					"contentType" : "COMM",
					"from" : "01032030796",
					"subject" : "본인인증 문자입니다",
					"countryCode" : "82",
					"content" : random,
					"message" : [ {
						"to" : phone,
						"subject" : "인증 문자",
						"content" : "인증번호 [" + random +"]를 입력해주세요."
					} ]
				};
			
			$.ajax({
				type : 'POST',
				url :'/user/rest/sendSMS/' + phone,
				dataType : "json",
				data :  JSON.stringify(obj),				
				contentType: "application/json",
				success : function(data) {
					if(data.statusName == "success"){
						$('#certCheck').text("인증 번호가 전송되었습니다.");
						$('#certCheck').css('color','blue');
						$("#signup_btn").attr("disabled",true);
					}else {
						$('#certCheck').text("입력한 번호를 다시 확인해주세요.");
						$('#certCheck').css('color','red');
						$("#signup_btn").attr("disabled",true);
					}
				}
			});
	}
	
	function smsAuthBtn() {
		
		var userVal = $('#certification').val();
		var certVal = $('#randomVal').val();
	
			if(userVal == certVal){
				$('#certCheck').text("인증이 완료되었습니다.");
				$('#certCheck').css('color','blue');	
				$("#signup_btn").attr("disabled",false);
			}else{
				$('#certCheck').text("인증번호를 다시 확인해주세요");
				$('#certCheck').css('color','red');
				$("#signup_btn").attr("disabled",true);
			}
		
	};


	const checkStudent = _.debounce(async (id) => {
						    	
						    	var id = $("#firstStudentId").val();
						    	
						    	$.ajax({
						    		url:'/user/rest/checkStudent',
						    		type : "post",
						    		data:{id},
						    		success : function(cnt) {
						    			if(cnt == 1) {
						    				$('#certCheck2').text("확인이 완료되었습니다.");
						    				$('#certCheck2').css('color','blue');	
						    				
						    			}
						    			else {
						    				$('#certCheck2').text("확인되지 않은 정보입니다.");
						    				$('#certCheck2').css('color','red');
						    				
						    			}
						    		}
						    	});
						    },2000);
						 
						 
					
						function selectAll(selectAll) {
							  const checkboxes = document.getElementsByName("agreecheck");

							  checkboxes.forEach((checkbox) => (checkbox.checked = selectAll.checked));
							}

							function checkSelectAll() {
							  const checkboxes = document.querySelectorAll('input[name="agreecheck"]');
							  const checked = document.querySelectorAll('input[name="agreecheck"]:checked');
							  const selectAll = document.querySelector('input[name="selectall"]');

							  if (checkboxes.length === checked.length) {
							    selectAll.checked = true;
							  } else {
							    selectAll.checked = false;
							  }
							}
						</script>

</body>

</html>


