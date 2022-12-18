<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<style>
</style>
<link rel="styleSheet" href="/../../assets/css/main.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="styleSheet" href="/../../assets/css/user.css" >
<body>
	<header>
		<div class="wrap_1X6t">
		    <div class="cover_SgeC9">
		        <h2 class="coverTitle_3574n">
		            <strong>메인 페이지</strong>
		        </h2>
		        <p class="coverDescription_vsKJp">
		            카드를 선택하는 당신이 자랑스럽습니다.!
		        </p>
		    </div>
			<div class="border border-3">
				<table>
					<tr>
						<td align="left" class="leftTd">
							<nav class="nav">
								<img class="logoImageStyle" src="${pageContext.request.contextPath}/assets/images/MainLogo.png">
							  	<a class="nav-link" href="${pageContext.request.contextPath}/">나의 Best 카드 추천하기</a>
								<a class="nav-link" href="${pageContext.request.contextPath}/user/board/userBoardContent.do?state=1">매거진</a>
							</nav>
						</td>
						<td align="right" class="rightTd">
							<c:if test="${sessionScope.admin_id eq null }">
								<button type="button" class="btn btn-success" onclick="location.href='/admin/adminLogin.do'">로그인</button>
							</c:if>
							<c:if test="${sessionScope.admin_id ne null }">
								<button type="button" class="btn btn-primary" onclick="location.href='/admin/board/boardList.do'">관리 페이지</button>
								<button type="button" class="btn btn-danger" onclick="location.href='/admin/board/logout.do'">로그아웃</button>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</header>
	<div class="section">
		<input type="radio" name="slide" id="slide01" checked>
		<input type="radio" name="slide" id="slide02">
		<input type="radio" name="slide" id="slide03">
		
		<div class="slidewrap">
			<ul class="slidelist">
				<li>
					<a>
						<label for="slide03" class="left"></label>
						<img src="${pageContext.request.contextPath}/assets/images/first.png">
						<label for="slide02" class="right"></label>
					</a>
				</li>
				<li>
					<a>
						<label for="slide01" class="left"></label>
						<img src="${pageContext.request.contextPath}/assets/images/second.png">
						<label for="slide03" class="right"></label>
					</a>
				</li>
				<li>
					<a>
						<label for="slide02" class="left"></label>
						<img src="${pageContext.request.contextPath}/assets/images/third.png">
						<label for="slide01" class="right"></label>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div align="center">
		<a href="${pageContext.request.contextPath}/user/board/userBoardContent.do?state=2&boardSeq=${BoardVO.boardSeq}">
			<img class="magazineImg" src="${pageContext.request.contextPath}/board/${BoardVO.boardImageName }"><br>
			<span class="boardTitleSpan">${BoardVO.boardTitle }</span>
		</a>
	</div>
	<div id="body-wrapper">
		<footer class="footer">
			문의 전화<br>
			010-XXXX-XXXXX
		</footer>
	</div>

</body>
</html>