<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-10-03
  Time: 오전 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %> : JSTL 버전에 따라서 명령어가 다르다.--%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="ko" xml:lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>관리자</title>
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
                <h2 class="title">카드 신청하기</h2>
            </div>
        </div>
    </div>
    <!-- 본문 타이틀 -->

    <!-- s : 본문 -->
    <div class="container">

        <!-- 데이터를 전송할 때, 데이터 크기 또한 제한을 없앤다. -->
        <form id="formCard" method="post" action="${pageContext.request.contextPath}/admin/card/InsertCard.do" enctype="multipart/form-data" autocomplete="off">
        <div class="table-wrap mb4">
            <table class="table is-bordered is-vertical is-fullwidth">
                <colgroup>
                    <col style="width: 250px" />
                    <col style="width: calc(50%- 250px)" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">카드 타입</th>
                    <td>

                    <c:forEach items="${cardTypeList}" var="list" varStatus="li">
                        <div class="radio">
                            <input type="radio" name="cardTypeSeq" id="radio${li.count}" value="${list.cardTypeSeq}"/>
                            <label for="radio${li.count}">${list.cardTypeName}</label>
                        </div>
                    </c:forEach>
                </td>
                </tr>

                <tr>
                    <th scope="row">카드 혜택</th>
                    <td>
                        <div class="radio">
                            <input type="radio" name="cardPointSel" id="cardPoint01" value="1"/>
                            <label for="cardPoint01">마일리지</label>
                        </div>
                        <div class="radio">
                            <input type="radio" name="cardPointSel" id="cardPoint02" value="2"/>
                            <label for="cardPoint02">할인/적립</label>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th scope="row">카드 회사</th>
                    <td>
                        <div class="control is-width-300">
                            <div class="select is-fullwidth">
                                <select name="cardCompanySeq" id="cardCompanySeq">
                                    <c:forEach items="${cardCompanyList}" var="list" varStatus="li">
                                        <div class="radio">
                                            <option value="${list.cardCompanySeq}">${list.cardCompanyName}</option>
                                        </div>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th scope="row">카드 브랜드</th>
                    <td>
                        <c:forEach items="${cardBrandList}" var="list" varStatus="li">
                            <div class="checkbox">
                                <input type="checkbox" name="cardBrandList" id="cardBrand${li.count}" value="${list.brandSeq}"/>
                                <label for="cardBrand${li.count}">${list.brandName}</label>
                            </div>
                        </c:forEach>
                    </td>
                </tr>

                <tr>
                    <th scope="row">카드 이름</th>
                    <td>
                        <div class="control is-width-500">
                            <input type="text" class="input is-fullwidth" name="cardName" id="cardName" />
                        </div>
                    </td>
                </tr>

                <tr>
                    <th scope="row">카드 이미지</th>
                    <td>
                        <div class="field is-vertical-center is-grouped">
                            <div class="control">
                                <input type="file" id="card_image" name="card_image" onchange="fileCheck(this)" accept="image/gif, image/jpeg, image/png" style="display:none">
                                <button type="button" class="button is-outlined is-primary is-width-100" onclick="imageFind()">파일찾기</button>
                            </div>
                            <div class="control" id="imageName">카드 이미지를 등록해 주세요.</div>
                            <div class="control">
                                <button type="button" id="imageDelete" class="button-delete"><i class="ico-cross"></i><span class="sr-only">삭제</span></button>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        </form>



        <div class="clear">
            <div class="text-center button-wrap">
                <button type="button" id="btn_cardInsert" class="button is-large is-main">등록</button>
                <button type="button" onclick="location.href='/admin/card/cardList.do'" class="button is-large is-dark">취소</button>

            </div>
        </div>
    </div>
    <!-- e : 본문 -->

    <!-- S : 지도보기  팝업 -->
    <div id="modal-address" class="modal is-clipped">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">지도보기</p>
                <button type="button" class="delete is-large" aria-label="close"></button>
            </header>
            <div class="modal-card-body">
                <div class="box-desc">
                    <div class="txt-0"><strong>주소</strong> : 서울특별시 강남구 도곡동 가로수길 25번길</div>
                    <div class="txt-0"><strong>면적</strong> : 55 평방미터</div>
                </div>
                <div style="height: 500px">지도영역</div>
            </div>
        </div>
    </div>
    <!-- E : 지도보기 팝업 -->
</div>

<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery-ui.js"></script>
<script src="../assets/js/common-ui.js"></script>
<script>


	//이미지 찾기 버튼 이벤트
	function imageFind(){
		$("#card_image").click();
	}



	//이미지 파일만 등록할 수 있도록 유효성 검사
	function fileCheck(obj)
	{
		pathpoint = obj.value.lastIndexOf('.');
		filepoint = obj.value.substring(pathpoint + 1, obj.length);
		filetype = filepoint.toLowerCase();
		if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png'	|| filetype == 'jpeg' || filetype == 'bmp')
		{
			// 정상적인 이미지 확장자 파일일 경우 ...
		}
		else
		{
			alert('이미지 파일만 선택할 수 있습니다.');
			parentObj = obj.parentNode
			node = parentObj.replaceChild(obj.cloneNode(true), obj);
			return false;
		}
		if (filetype == 'bmp')
		{
			upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 계속 하시겠습니까?');
			if (!upload)
				return false;
		}
		
		// 프로필 파일명 보여주기
		var fileValue = $("#card_image").val().split("\\");
		var fileName = fileValue[fileValue.length-1];
		$("#imageName").text(fileName);
		
	}
	
	// 프로필 삭제 버튼
    $("#imageDelete").click(function() {
			
    	$("#card_image").val("");
    	$("#imageName").text("카드 이미지를 등록해 주세요.");
    	
    })
//

    //등록버튼 클릭
    $('#btn_cardInsert').click(function() {

    	if (confirm("카드 신청 하시겠습니까?") == true)
		{
			alert("카드 신청이 완료되었습니다.");
			$('#formCard').submit();
		}
    })
</script>
</body>

</html>