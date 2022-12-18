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
    <title>이력관리</title>
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
                <a href="/Main.do"><h2 class="title">매거진 관리</h2></a>
            </div>
        </div>
    </div>
    <!-- 본문 타이틀 -->
	
    <!-- s : 본문 -->
    <div class="container">
        <div class="tab-block-wrap">
            <nav class="tabs">
                <ul>
                	<c:if test="${sessionScope.admin_id eq 'admin'}">
	                    <li><a href="${pageContext.request.contextPath}/admin/member/memberList.do">회원관리</a></li>
	                    <li><a href="${pageContext.request.contextPath}/admin/card/cardList.do">카드관리</a></li>
                    </c:if>
                    <li class="is-active"><a href="${pageContext.request.contextPath}/admin/board/boardList.do">매거진</a></li>
                </ul>
            </nav>
        </div>
        <div class="clear mb2">
            <div class="float-right button-wrap">
                <a href="${pageContext.request.contextPath}/admin/boardInsert.do" class="button is-large is-success">매거진 등록하기</a>
            </div>
        </div>
        <div class="box-gray">
            <form name="searchForm" action="/admin/board/boardList.do" method="get">
                <fieldset>
                    <div class="row">
                        <div class="field is-grouped">
                       		<select id="searchSelect" name="searchSelect">
								<option value="searchTitle">제목</option>
								<c:if test="${sessionScope.admin_id eq 'admin'}">
									<option value="searchNick">닉네임</option>
								</c:if>
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
                    <col />
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                    <col style="width: 8%" />
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자(닉네임)</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                    <th scope="col">공개여부</th>
                    <th scope="col">상태여부</th>
                </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${boardList.size() > 0 }">
	                        <c:forEach var="BoardVO" items="${boardList }">
			                <tr>
			                    <td class="th-new">${BoardVO.boardSeq }</td>
			                    <td><a href="/admin/board/boardContent.do?boardSeq=${BoardVO.boardSeq }&contentState=false">${BoardVO.boardTitle }</a></td>
			                    <td>${BoardVO.memberNickname }</td>
			                    <td>${BoardVO.boardInsdate }</td>
			                    <td>${BoardVO.boardCount }</td>
			                    <c:if test="${BoardVO.boardPublic eq 'Y'}">
				                    <td>
				                        <span id="boardpublicOther${BoardVO.boardSeq }" onclick="publicState(${BoardVO.boardSeq}, 'N')" class="button is-dark">비공개</span>
				                        <span id="boardpublic${BoardVO.boardSeq }" onclick="publicState(${BoardVO.boardSeq}, 'Y')" class="button is-success">공개</span>
				                    </td>
			                    </c:if>
			                    <c:if test="${BoardVO.boardPublic eq 'N'}">
				                    <td>
				                        <span id="boardpublicOther${BoardVO.boardSeq }" onclick="publicState(${BoardVO.boardSeq}, 'N')" class="button is-danger">비공개</span>
				                        <span id="boardpublic${BoardVO.boardSeq }" onclick="publicState(${BoardVO.boardSeq}, 'Y')" class="button is-dark">공개</span>
				                    </td>
			                    </c:if>
								
								<c:if test="${BoardVO.boardState eq 'Y'}">
				                    <td>
				                        <button type="button" id="boardStateButton${BoardVO.boardSeq }" onclick="boardStateChange(${BoardVO.boardSeq})" 
				                        	class="button is-outlined is-blue modal-state-view">상태변경</button>
				                    </td>
			                    </c:if>
			                    <c:if test="${BoardVO.boardState eq 'N'}">
				                    <td>
				                        <button type="button" class="button is-danger">삭제</button>
				                    </td>
			                    </c:if>
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
                	<a href="boardList.do?nowPage=${completePaging.startPage - 1 }&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect}&searchInput=${searchInput}" class="pagination-previous">
                		<i class="ico-chevron-left-thin"></i><span class="sr-only">이전 페이지 목록</span></a>
                </c:if>
                <ul class="pagination-list">
                <c:forEach begin="${completePaging.startPage }" end="${completePaging.endPage }" var="p">
                	<c:choose>
                		<c:when test="${p == completePaging.nowPage}">
							<li><a href="#" class="pagination-link is-current">${p }</a></li>
						</c:when>
						<c:when test="${p != completePaging.nowPage}">
							<li><a class="pagination-link" href="boardList.do?nowPage=${p}&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect}&searchInput=${searchInput}">${p}</a></li>
						</c:when>
                    </c:choose>
                </c:forEach>
                </ul>
                <c:if test="${completePaging.endPage != completePaging.lastPage}">
                	<a href="boardList.do?nowPage=${completePaging.endPage+1 }&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect}&searchInput=${searchInput}" class="pagination-next">
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

	// 세션이 없을 시 로그인 창으로 이동
	$( document ).ready(function() {
	    var session = "${sessionScope.admin_id}";
	    
		if (session == null || session == "")
		{
			alert("로그인 후 진행해 주세요");
			location.href="${pageContext.request.contextPath}/admin/adminLogin.do";
		}
		
	    
	});

	//검색란에서 엔터 눌렀을 시 이벤트 발생
	function press(f){
	    if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
	    	
	    	searchForm.submit(); //formname에 사용자가 지정한 form의 name입력
	    }
	}

	// 게시글 공개 여부 바꾸기
	function publicState(boardSeq, state){
		
		$.ajax(
                {
                    type : 'GET',
                    url : "/admin/board/boardPublicState.ajax",
                    data : {
                        "board_seq" : boardSeq,
                    	"board_public" : state
                    },
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function()
                    {
                    	if (state == 'Y')
						{
                    		alert("게시글이 공개 상태로 변경됩니다.");
                    		$("#boardpublicOther"+boardSeq).removeClass("button is-danger");
                    		$("#boardpublicOther"+boardSeq).addClass("button is-dark");
                    		
                    		$("#boardpublic"+boardSeq).removeClass("button is-dark");
                    		$("#boardpublic"+boardSeq).addClass("button is-success");
						} else if(state == 'N'){
							alert("게시글이 비공개 상태로 변경됩니다.");
                    		$("#boardpublic"+boardSeq).removeClass("button is-success");
                    		$("#boardpublic"+boardSeq).addClass("button is-dark");
							
							$("#boardpublicOther"+boardSeq).removeClass("button is-dark");
                    		$("#boardpublicOther"+boardSeq).addClass("button is-danger");
                    		
						}
                    },
                    error : function(request, status, error)
                    {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }

                });
	}

	// 게시글 상태변경(삭제로 변경)
	function boardStateChange(boardSeq){
		
		if (confirm("게시글을 삭제 상태로 변경하시겠습니까?") == false)
		{
			return false;
		}
		
		$.ajax(
                {
                    type : 'GET',
                    url : "/admin/board/boardState.ajax",
                    data : {
                        "board_seq" : boardSeq
                    },
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function()
                    {
                    	$("#boardStateButton"+boardSeq).html('삭제');
                    	$("#boardStateButton"+boardSeq).removeClass("button is-outlined is-blue modal-state-view");
                    	$("#boardStateButton"+boardSeq).addClass("button is-danger");
                    	$("#boardStateButton"+boardSeq).attr('onclick', '').unbind('click');
                    	
                    	
                    },
                    error : function(request, status, error)
                    {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }

                });
	}

</script>

</html>