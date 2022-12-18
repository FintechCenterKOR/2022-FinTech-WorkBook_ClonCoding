<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko" xml:lang="ko" class="login">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>관리자 로그인</title>
    <meta name="robots" content="index,follow" />
    <meta name="referrer" contents="always" />
    <meta name="format-detection" content="telephone=no" />

    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta property="og:title" content="" />
    <meta property="og:site_name" content="" />
    <meta property="og:type" content="" />
    <meta property="og:url" content="" />
    <meta property="og:description" content="" />
    <meta property="og:image" content="" />

    <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico" />
	<link rel="stylesheet" href="../assets/css/adminLogin.css" />
	
</head>


<body>
	<div class="loginbox">
	<a href="/Main.do"><img src="../assets/css/images/avatar.png" class="avatar"></a>
		<h1>로그인</h1>
		<form>
			<p>Member ID</p>
			<input type="text" class="input" name="" id="adminId" title="아이디" placeholder="아이디" />
			<p>Member Password</p>
			<input type="password" class="input" name="" id="adminPassword" title="비밀번호" placeholder="비밀번호" />
			<input type="button" onclick="loginProcess()" class="button is-main is-fullwidth" value="Login">
		</form>
	</div>
</body>

<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/common-ui.js"></script>
<script>
	
	// 아이디 input 태그에서 엔터 누를 시
	$("#adminId").on('keyup', function (e) {
		if (e.keyCode === 13) {
   			$("#adminPassword").focus();
		}
	});
	
	// 패스워드 input 태그에서 엔터 누를 시
	$("#adminPassword").on('keyup', function (e) {
		if (e.keyCode === 13) {
			loginProcess();
		}
	});
	
	// 로그인시 유효성 검사와 데이터를 ajax로 보내는 함수
	function loginProcess(){
		
		if ($("#adminId").val() == "")
		{
			alert("관리자 아이디를 입력해 주세요!!");
			return false;
		}
		
		if ($("#adminPassword").val() == "")
		{
			alert("관리자 패스워를 입력해 주세요!!");
			return false;
		}
		
		var adminId = $("#adminId").val();
		var adminPassword = $("#adminPassword").val();
		
		
		$.ajax(
                {
                    type : 'POST',
                    url : "/admin/member/adminLoginProcess.ajax",
                    data : {
                        "adminId" : adminId
                       ,"adminPassword" : adminPassword
                    },
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function(data)
                    {
						if (data == "admin")
						{
							alert("관리자로 로그인 합니다.");
							location.href="member/memberList.do";
						} else if (data == "editor"){
							alert("에디터로 로그인 합니다.");
							location.href="board/boardList.do";
						} else {
							alert("아이디와 비밀번호를 확인해 주세요.");
						}
                    	
                    },
                    error : function(request, status, error)
                    {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
				
                });
	}

</script>

</html>