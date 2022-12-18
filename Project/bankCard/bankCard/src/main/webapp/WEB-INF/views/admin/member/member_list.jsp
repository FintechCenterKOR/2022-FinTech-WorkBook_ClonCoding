<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-10-03
  Time: 오전 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" xml:lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>회원 관리</title>
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

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/metisMenu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
</head>

<body>



<div id="container">
    <!-- 본문 타이틀 -->
    <div class="content-title-wrap">
        <div class="container">
            <div class="content-title">
                <a href="/Main.do"><h2 class="title">회원관리</h2></a>
            </div>
        </div>
    </div>
    <!-- 본문 타이틀 -->
	
    <!-- s : 본문 -->
    <div class="container">
        <div class="tab-block-wrap">
            <nav class="tabs">
                <ul>
                    <li class="is-active"><a href="${pageContext.request.contextPath}/admin/member/memberList.do">회원관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/card/cardList.do">카드관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/board/boardList.do">매거진</a></li>
                </ul>
            </nav>
        </div>
        <div class="clear mb2">
            <div class="float-right button-wrap">
                <a href="${pageContext.request.contextPath}/admin/memberInsert.do" class="button is-large is-success">에디터 등록하기</a>
            </div>
        </div>
        <div class="box-gray">
            <form name="searchForm" action="/admin/member/memberList.do" method="get">
                <fieldset>
                    <div class="row">
                        <div class="field is-grouped">

							<select id="searchSelect" name="searchSelect">
								<option value="searchId">아이디</option>
								<option value="searchNick">닉네임</option>
							</select>

                            <div class="control is-width-500">
                                <input type="text" id="searchInput" name="searchInput" onkeypress="JavaScript:press(this.form)" 
                                	class="input is-fullwidth" placeholder="검색어를 입력해 주세요."/>
                            </div>
                            <div class="control">
                                <button type="submit" id="searchButton" class="button-search-icon">
                                    <i class="icon-search"></i>
                                    <span class="sr-only">검색</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        
        <div class="table-wrap">
            <table class="table is-bordered is-center is-fullwidth">
                <colgroup>
                    <col style="width: 15%" />
                    <col style="width: 15%" />
                    <col style="width: 15%" />
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">아이디</th>
                    <th scope="col">마지막 로그인 날짜</th>
                    <th scope="col">닉네임</th>
                    <th scope="col">가입날짜</th>
                    <th scope="col">상태여부</th>
                    <th scope="col">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                   <c:when test="${memberList.size() > 0 }">
		                <c:forEach var="MemberVO" items="${memberList }">
		                <tr>
		                    <td class="th-new">${MemberVO.memberId }</td>
		                    <td>${MemberVO.memberLastlogin}</td>
		                    <td>${MemberVO.memberNickname }</td>
		                    <td>${MemberVO.memberInstDate }</td>
		                    <c:choose>
		                    	<c:when test="${MemberVO.memberState == 'Y' }">
				                    <td>
				                        <button onclick="activityStop(${MemberVO.memberSeq})"><span id="activityStop${MemberVO.memberSeq }" class="button is-dark">활동정지</span></button>
				                        <button onclick="activiting(${MemberVO.memberSeq})"><span id="activitySt${MemberVO.memberSeq }" class="button is-success">활동</span></button>
				                    </td>
			                    </c:when>
		                    	<c:when test="${MemberVO.memberState == 'N' }">
				                    <td>
				                        <button onclick="activityStop(${MemberVO.memberSeq})"><span id="activityStop2${MemberVO.memberSeq }" class="button is-red">활동정지</span></button>
				                        <button onclick="activiting(${MemberVO.memberSeq})"><span id="activitySt2${MemberVO.memberSeq }" class="button is-dark">활동</span></button>
				                    </td>
			                    </c:when>
							</c:choose>
		                    <td>
		                        <button type="button" onclick="passwordInitialization(${MemberVO.memberSeq})" class="button is-outlined is-blue modal-state-view">비밀번호 초기화</button>
		                    </td>
		                </tr>
		                </c:forEach>
					</c:when>
					<c:otherwise>
                    	<tr>
                        	<td class="ac none" colspan="12" style="text-align:center !important;">+++ 등록된 데이터가 없습니다. +++</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>
                </tbody>
            </table>
        </div>
        
        
        <div class="pagination-wrap">
            <nav class="pagination is-centered" role="navigation" aria-label="pagination">
            	<c:if test="${completePaging.startPage != 1 }">
                	<a href="memberList.do?nowPage=${completePaging.startPage - 1 }&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect}&searchInput=${searchInput}" class="pagination-previous">
                		<i class="ico-chevron-left-thin"></i><span class="sr-only">이전 페이지 목록</span></a>
                </c:if>
                <ul class="pagination-list">
                <c:forEach begin="${completePaging.startPage }" end="${completePaging.endPage }" var="p">
                	<c:choose>
                		<c:when test="${p == completePaging.nowPage}">
							<li><a href="#" class="pagination-link is-current">${p }</a></li>
						</c:when>
						<c:when test="${p != completePaging.nowPage}">
							<li><a class="pagination-link" href="memberList.do?nowPage=${p}&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect}&searchInput=${searchInput}">${p}</a></li>
						</c:when>
                    </c:choose>
                </c:forEach>
                </ul>
                <c:if test="${completePaging.endPage != completePaging.lastPage}">
                	<a href="memberList.do?nowPage=${completePaging.endPage+1 }&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect}&searchInput=${searchInput}" class="pagination-next">
                		<i class="ico-chevron-right-thin"></i><span class="sr-only">다음 페이지 목록</span></a>
                </c:if>
            </nav>
        </div>
    </div>
    <!-- e : 본문 -->

</div>
</body>

<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/metisMenu.min.js"></script>
<script src="../../assets/js/jquery-ui.js"></script>
<script src="../../assets/js/common-ui.js"></script>
<script>

	//세션이 없을 시 로그인 창으로 이동
	$( document ).ready(function() {
	    var session = "${sessionScope.admin_id}";
	    
		if (session == null || session == "")
		{
			alert("관리자로 로그인 후 진행해 주세요");
			location.href="${pageContext.request.contextPath}/admin/adminLogin.do";
		}
		
	    
	});


	// 검색란에서 엔터 눌렀을 시 이벤트 발생
	function press(f){
	    if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
	    	
	    	searchForm.submit(); //formname에 사용자가 지정한 form의 name입력
	    }
	}


	// 활동정지 상태로 만들기
	function activityStop(memberSeq){
		
		if (confirm("해당 유저를 활동정지 상태로 만드시겠습니까?") == false) {
			return false;
		}
		
		$.ajax(
                {
                    type : 'GET',
                    url : "/admin/member/memberState.ajax",
                    data : {
                        "member_seq" : memberSeq
                       ,"member_state" : "N"
                    },
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function(data)
                    {
						$("#activityStop"+memberSeq).removeClass("button is-dark");
						$("#activityStop"+memberSeq).addClass("button is-red");
						$("#activitySt"+memberSeq).removeClass("button is-success");
						$("#activitySt"+memberSeq).addClass("button is-dark");
						
						$("#activityStop"+memberSeq).attr('id','activityStop2'+memberSeq);
						$("#activitySt"+memberSeq).attr('id', 'activitySt2'+memberSeq);
                    	
                    },
                    error : function(request, status, error)
                    {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }

                });
	}
	
	// 활동 상태로 만들기
	function activiting(memberSeq){
		
		if (confirm("해당 유저를 활동 상태로 만드시겠습니까?") == false) {
			return false;
		}
		
		$.ajax(
                {
                    type : 'GET',
                    url : "/admin/member/memberState.ajax",
                    data : {
                        "member_seq" : memberSeq
                       ,"member_state" : "Y"
                    },
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function(data)
                    {
                    	$("#activityStop2"+memberSeq).removeClass("button is-red");		
                		$("#activityStop2"+memberSeq).addClass("button is-dark");	
                		$("#activitySt2"+memberSeq).removeClass("button is-dark");
                		$("#activitySt2"+memberSeq).addClass("button is-success");
                		
                		$("#activityStop2"+memberSeq).attr('id','activityStop'+memberSeq);
                		$("#activitySt2"+memberSeq).attr('id', 'activitySt'+memberSeq);
                		
                    	
                    },
                    error : function(request, status, error)
                    {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }

                });
		
	}
	
	
	// 비밀번호 초기화
	function passwordInitialization(memberSeq){
		
		if (confirm("비밀번호를 초기화 하시겠습니까?") == false) {
			return false;
		}
		
		$.ajax(
                {
                    type : 'GET',
                    url : "/admin/member/passwordInitialization.ajax",
                    data : {
                        "member_seq" : memberSeq
                    },
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function(data)
                    {
                		alert("비밀번호가 0000으로 변경되었습니다.");
                    	
                    },
                    error : function(request, status, error)
                    {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }

                });
		
	}


</script>

</html>