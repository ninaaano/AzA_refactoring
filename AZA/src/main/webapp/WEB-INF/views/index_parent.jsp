<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Aza : main</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script defer src="https://kit.fontawesome.com/57ea3feb1d.js" crossorigin="anonymous"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
<script defer src="/resources/javascript/alert/alertUI.js"></script>
<script defer src="/resources/javascript/common/indexUI.js"></script>

<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<!-- Load Simple DataTables Stylesheet-->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet">
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
	
<style>
*, body { 
font-family: Pretendard, 'Noto Sans KR';
}
</style>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script type="text/javascript">

function resetForm() {
	document.addStudentsRecordForm.reset();
	$('.lessonCheck').removeClass('show');
	$('.valCheck').removeClass('show');	
}

$(function() {
	// addStudentsRecord
	$('#addStudentsRecordBtn').on("click", function() {

		var valFlag = false;
		const lessonCode = document.addStudentsRecordForm.lessonCode.value;
		const lessonStartDate = document.addStudentsRecordForm.lessonStartDate.value;
		const fees = document.addStudentsRecordForm.fees.value;
		const payDueDate = document.addStudentsRecordForm.payDueDate.value;
		
		// ��ȿ�� check
		if(lessonCode.length < 8 || lessonCode == null || lessonStartDate.length < 1 || lessonStartDate.length == null || fees.length < 1 || fees == null || payDueDate < 1 || payDueDate == null) {
			$('.valCheck').addClass('show');
		} else {
			$.ajax({
				 url: "/lesson/rest/checkLessonCode/"+lessonCode,
		            type: "GET",
		            headers : {
		                    "Accept" : "application/json",
		                    "Content-Type" : "application/json",                                    
		                },
		            success: function(result) {
		                if(result) {
		                	console.log(result);
		                	
		                	if(result == true) {
		                		valFlag = true;
		                	}
		                	
		                	if(!valFlag) {
		                		$('.lessonCheck').addClass('show');
		                		return;
		                	}
		                	
		                	console.log(valFlag);
		                	
		                	if(valFlag) {
		            			document.addStudentsRecordForm.action = "/students/addStudentsRecord";
		            			document.addStudentsRecordForm.method = "POST";
		            			document.addStudentsRecordForm.submit();		
		            		}
		                } else {
		                	console.log("lesson/rest/checkLessonCode :: error || null");			                	
		                	$('.lessonCheck').addClass('show');
		                }
		            }
			})
		}
		
    	

	})
})



function deleteAlert(alertCode) {
	$.ajax({
		url:"/alert/rest/deleteAlert/"+alertCode,
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("deleteAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(!alertReadAt) {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">����</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger" onclick="return deleteAlert(`+alertCode+`)">delete</span>
						<p class="text-danger">����</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}              		
            	})
            	
            	$('.alertLi').remove();
	        	$("#alertDropDown").html("");
	        	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">�˸�</h6></li>
						<li><hr class="dropdown-divider my-0" /></li>`);
	        	$("#alertDropDown").append(listAlertView);
	        	$("#alertDropDown").addClass("show").attr("data-bs-popper", "static");

            } else {
            	console.log("faile");
            }
       }
	})
	
	
	
	
}



function listAlert() {
	$.ajax({
		url:"/alert/rest/listAlert",
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("listAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(!alertReadAt) {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">����</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger" onclick="return deleteAlert(`+alertCode+`)">delete</span>
						<p class="text-danger">����</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}              		
            	})
            	
            	$('.alertLi').remove();
            	$("#alertDropDown").html("");
            	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">�˸�</h6></li>
    					<li><hr class="dropdown-divider my-0" /></li>`);
            	$("#alertDropDown").append(listAlertView);

            } else {
            	console.log("faile");
            }
       }
	})
	
}

function readAlert(alertCode) {
	$.ajax({
		url:"/alert/rest/readAlert/"+alertCode,
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("readAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(alertReadAt == "") {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">����</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger">delete</span>
						<p class="text-danger">����</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}
            		
            		
            		
            	})
            	
            	$('.alertLi').remove();
            	$("#alertDropDown").html("");
            	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">�˸�</h6></li>
    					<li><hr class="dropdown-divider my-0" /></li>`);
            	$("#alertDropDown").append(listAlertView);
            	$("#alertDropDown").addClass("show").attr("data-bs-popper", "static");
            	
            } else {
            	console.log("faile");
            }
       }
	})
}



$(function() {

	// Alert
	 $('#dropdownMenuNotifications').on('click', function() {
		console.log("�˸� ��ư ����");
		listAlert();

	})

	// Message
	$("#open-messagePopup").on("click", function() {
		console.log("�޽��� ��ư ����");
		
        $.ajax({
            url: "http://localhost:8080/message/rest/listMessage",
            type: "GET",
            headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json",                                    
                },
            success: function(result) {
                if(result) {
                	console.log(result);
                	
                	sessionStorage.setItem('userId', result[0].userId);
                	
                	result.shift();
                	
                	console.log(result);
                	
                	var listOtherView = "";
                	
                	result.map((other,i) => {
               			
                		let studentId = other.studentId ? other.studentId : other.firstStudentId;
                		let studentName = other.studentId ? other.studentName : "�л��̷�";
                		let relationName = other.relationName ? other.relationName : "";
                		let userId = other.userId ? other.userId : studentId;
                		let userName = studentName + " " + relationName;
                		//console.log(i, studentId);
                		
                		listOtherView += `<ul id='getOtherMessage' class='list-unstyled mb-0' onclick="getOtherMessage('`+userId+`','`+userName+`')">
                		<li class='p-2 border-bottom' data-id=`+userId+`>
                            	<a class="d-flex justify-content-between">
                                    <div class="d-flex flex-row">
                                        <div class="pt-1">
                                            <p class="fw-bold mb-0">`+studentName+" "+relationName+`</p>
                                            <p class="small text-muted">�ֱٸ޽���</p>
                                        </div>
                                    </div>
                            	</a>
                        	</li>
                    	</ul>`;
                	});
                	
                	$('#getOtherMessage').remove();
                	$('#listOther').append(listOtherView);

                } else {
                    console.log("����");
                }
            } 
        })
	})
	


})	
</script>



</head>

<body class="nav-fixed bg-light">
<div class="nav-fixed bg-light">
	<!-- Top app bar navigation menu-->
	<nav class="top-app-bar navbar navbar-expand navbar-dark bg-primary">
		<div class="container-fluid px-4">
			<!-- Drawer toggle button-->
			<button class="btn btn-lg btn-icon order-1 order-lg-0"
				id="drawerToggle" href="javascript:void(0);">
				<i class="material-icons">menu</i>
			</button>
			<!-- Navbar brand-->
			<a class="navbar-brand me-auto" href="/index">
			<img class="px-0 mx-0" alt="" src="/resources/img/logo.png" style="height:45px;">
			</a>
			<!-- Navbar items-->
			<div class="d-flex align-items-center mx-3 me-lg-0">
				<!-- Navbar buttons-->
				<div class="d-flex">
					<!-- Messages dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuMessages" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons">mail_outline</i>
						</button>
					</div>				
					<!-- Notifications and alerts dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuNotifications" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="material-icons">notifications</i>
						</button>
						<ul id="alertDropDown"
							class="dropdown-menu dropdown-menu-end me-3 mt-3 py-0 overflow-hidden"
							aria-labelledby="dropdownMenuNotifications">
						</ul>
					</div>
					
					
					<!-- User profile dropdown-->
					<div class="dropdown">
						<button class="btn btn-lg btn-icon dropdown-toggle"
							id="dropdownMenuProfile" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons">person</i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end mt-3"
							aria-labelledby="dropdownMenuProfile">
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">person</i>
									<div class="me-3">Profile</div>
							</a></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">settings</i>
									<div class="me-3">Settings</div>
							</a></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">help</i>
									<div class="me-3">Help</div>
							</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">logout</i>
									<div class="me-3">Logout</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Layout wrapper-->
	<div id="layoutDrawer">
		<!-- Layout navigation-->
		<div id="layoutDrawer_nav">
			<!-- Drawer navigation-->
			<nav class="drawer accordion drawer-light bg-white"
				id="drawerAccordion">
				<div class="drawer-menu">
					<div class="nav">
						<!-- Drawer section heading (Account)-->
						<div class="drawer-menu-heading d-sm-none">Account</div>
						<!-- Drawer link (Notifications)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons">notifications</i>
							</div> Notifications
						</a>
						<!-- Drawer link (Messages)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons">mail</i>
							</div> Messages
						</a>
						<!-- Divider-->
						<div class="drawer-menu-divider d-sm-none"></div>
						<!-- Drawer section heading (Interface)-->
						<div class="drawer-menu-heading">MENU</div>
						<!-- Drawer link (Overview)-->
						<a class="nav-link left_nav" href="#" data-url='/students/listStudentsAttendance'>
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> �ڳ����
						</a>
						<a class="nav-link left_nav" href="#">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> ����
						</a>
						<a class="nav-link left_nav" href="#">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> Q&A
						</a>
					</div>
						<!-- Divider-->
					<div class="drawer-menu-divider"></div>
					<!-- Drawer footer        -->
					<div class="drawer-footer border-top">
						<div class="d-flex justify-content-center">
						<!-- ���� �߰� ��ư -->
							<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#addStudentsRecord">���� �߰�<i class="trailing-icon material-icons">launch</i></button>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
</div>
	<!-- Layout content-->
	<div id="layoutDrawer_content">
	
		<!-- Main page content-->
		<main class="mt-12">
			<header class="main-header" style="height:0px;">
				<!-- page header -->
					<div class="row justify-content-center gx-5">
	                  </div>
					<!-- ���� �߰� Modal-->
					<div class="modal fade" id="addStudentsRecord" tabindex="-1" aria-labelledby="addStudentsRecordLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
					    <div class="modal-dialog modal-dialog-centered">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h5 class="modal-title" id="addStudentsRecordLabel">���� �ڵ� ���</h5>
					                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" onclick="resetForm()"></button>
					            </div>
					            <div class="modal-body">
					             <c:url var="add_record" value="/students/listStudentsRecord"/>
						            <form name="addStudentsRecordForm" action="${add_record}">
							          <div class="form-group">
							            <label for="lessonCode" class="col-form-label">���� �ڵ�:</label>
							            <input type="text" class="form-control" id="recipient-name" name="lessonCode"/>
							          </div>
							          <div class="form-group">
							            <label for="lessonStartDate" class="col-form-label">���� �����:</label>
							            <input type="text" class="form-control" id="lessonStartDate" name="lessonStartDate"/>
							          </div>
							          <div class="form-group">
							            <label for="fees" class="col-form-label">������:</label>
							            <input type="text" class="form-control" id="fees" name="fees"/>
							          </div>
							          <div class="form-group">
							            <label for="payDueDate" class="col-form-label">������ ������:</label>
							            <input type="text" class="form-control" id="payDueDate" name="payDueDate"/>
							          </div>
							          <p class="lessonCheck text-danger hidden">�߸��� �����ڵ��Դϴ�(ToT)/></p>
							          <p class="valCheck text-danger hidden">�ٸ� ������ �Է����ּ���(��x��;)</p>
							          <div class="d-flex justify-content-end">
						              	<button class="btn btn-text-primary " type="submit" id="addStudentsRecordBtn">���</button>
						              </div>
						        </form>
					            </div>
					        </div>
					    </div>
					</div>
				</header>
				
			
			<!-- /////////////////////////////////////////////////////////////////////////////// -->
					<iframe id="mainFrame" src="" style="display:block; width:100vw; height: 100vh; z-index:9999;" allowfullscreen></iframe>
			<!-- /////////////////////////////////////////////////////////////////////////////// -->
			
			
		    <div class="messagePopup hidden" id="messagePopup">
            <section style="background-color: #eee;">
                
                <!-- list -->
                <div id="otherListContainer" class="container py-5">          
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-6">         
                        <div class="card" id="chat2">
                            <div class="card-header d-flex justify-content-between align-items-center p-3">
                                <div>
                                    <h5 class="mb-0">�����</h5>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text" id="basic-addon1">@</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                  </div>
                                <button id="getMessageBtn" type="button" class="btn btn-primary btn-sm" data-mdb-ripple-color="dark">�ӽ� getMessageContainer</button>
                            </div>

                            <div id="listOther" class="card-body scroll" style="height: 500px;">

                                 
                            </div>
                        </div>
                    </div>
                </div>
                </div>

               <!--  message -->
                <div id="getMessageContainer" class="container py-5 hidden">          
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-6">         
                        <div class="card py-10" id="chat2">
                            <div class="card-header d-flex justify-content-between align-items-center p-3">
                                <div id="otherInfo">
                                    <h5 class="mb-0">otherName</h5>
                                    <h6 class="mb-0">otherDetail</h6>
                                </div>
                                <button id="otherListBtn" type="button" class="btn btn-primary btn-sm" data-mdb-ripple-color="dark">���</button>
                            </div>
                            
                            <div id="messages" class="card-body scroll" style="position: relative; height: 400px">
                                
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                        
                            <form id="msgForm">
                                <div class="d-flex justify-content-around">
                                <input type="text" id="messageContent"  class="form-control form-control-lg" placeholder="�޽��� �Է�">
                                <button id="sendBtn" class="btn btn-primary"><i class="fas fa-paper-plane"></i></button>   
                            </div>     
                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </div>
		</main>

        		
	<!-- Footer-->
	<footer>
		<button type="button" id="open-messagePopup" class="btn float btn-lg btn-icon"><i class="material-icons">mail_outline</i></button>
	</footer>
	</div>
	  <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

	<script src="/resources/javascript/students/studentsUI.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="/resources/javascript/common/charts/chart-defaults.js"></script> -->
	<script src="/resources/javascript/common/prism.js"></script>
	<script src="/resources/javascript/common/material.js"></script>
	<script src="/resources/javascript/common/scripts.js"></script>
	<script src="https://kit.fontawesome.com/57ea3feb1d.js" crossorigin="anonymous"></script>
<!-- 	<script src="/resources/javascript/common/charts/demos/dashboard-chart-area-light-demo.js"></script> -->
	<script type="text/javascript">
	</script>
</body>
</html>