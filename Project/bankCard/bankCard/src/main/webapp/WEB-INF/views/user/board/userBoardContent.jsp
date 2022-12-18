<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserBoardContent</title>
<link rel="styleSheet" href="/../../assets/css/user.css" >
    <script src="/../../assets/js/jquery.min.js"></script>
    <script src="/../../assets/js/metisMenu.min.js"></script>
    <script src="/../../assets/js/jquery-ui.js"></script>
    <script src="/../../assets/js/common-ui.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="/../assets/images/favicon/favicon.ico" />
    <link rel="stylesheet" href="/../../assets/css/metisMenu.css" />
    <link rel="stylesheet" href="/../../assets/css/style.css" />
</head>
<body>
<div class="wrap_1X6t">
    <div class="cover_SgeC9">
        <h2 class="coverTitle_3574n">
            <strong>매거진</strong>
        </h2>
        <p class="coverDescription_vsKJp">
            카드 선택에 꿀팁 창고!
        </p>
    </div>
    
    <form name="" method="post" action="${pageContext.request.contextPath}/user/board/" enctype="multipart/form-data">
    <div class="container">
        <div id="BoxReturn" class="table-wrap mb4">
            <table class="table is-bordered is-vertical is-fullwidth">
                <colgroup>
                    <col style="width: 250px" />
                    <col style="width: calc(50%- 250px)" />
                </colgroup>
                <tbody>
                <tr>
                   	<th align="center" style="font-size: 30px;">${BoardVO.boardTitle }</th>
                </tr>
                <tr>
                	<th align="left">
	                   	<img src="${pageContext.request.contextPath}/profile/${BoardVO.memberImage}" style="width: 50px; height: 50px;"> 
	                   	<span>${BoardVO.memberNickname }</span>
	                   	<span style="margin-left: 50px;">작성일 : ${BoardVO.boardInsdate }</span>
	                   	<span style="margin-left: 50px;">최종 수정일 : ${BoardVO.boardUpdate }</span>
                   	</th>
                </tr>
                <tr>
                	<th>
                		<c:forTokens items="${BoardVO.boardTag }" delims="," var="item">
	                		<strong><span style="color: green; margin-left: 20px;">${item }</span></strong>
	                	</c:forTokens>
                	</th>
                </tr>
                <tr>
                	<td>
	                	<img src="${pageContext.request.contextPath}/board/${BoardVO.boardImageName}" style="width: 100%; height: 500px;">
                	</td>
                </tr>
                <tr>
                    <td>
                        <textarea class="textarea" name="boardContent" id="" cols="30" 
                        			rows="10" readonly="readonly" style="height: 100%; resize: none;">
                        			${BoardVO.boardContent }
              			</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        <div class="clear">
            <div class="text-center button-wrap">
            	<c:if test="${sessionScope.admin_id eq BoardVO.memberId && sessionScope.admin_id ne null}">
	            	<button type="button" 
	            			onclick="location.href='/admin/board/boardContent.do?boardSeq=${BoardVO.boardSeq}&contentState=true'" 
	            			class="button is-large is-main">수정하기</button>
            	</c:if>
        		<button type="button" onclick="location.href='${pageContext.request.contextPath}/Main.do'" 
        				class="button is-large is-dark">뒤로가기</button>
            </div>
        </div>
        </div>
    </div>
    </form>
</div>
</body>
</html>