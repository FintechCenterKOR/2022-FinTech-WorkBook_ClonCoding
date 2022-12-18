<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-10-03
  Time: 오후 7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko" xml:lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
  <title>지점관리</title>
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
  <link rel="stylesheet" href="../assets/css/metisMenu.css" />
  <link rel="stylesheet" href="../assets/css/style.css" />
</head>

<body>

<div id="container">
  <!-- 본문 타이틀 -->
  <div class="content-title-wrap">
    <div class="container">
      <div class="content-title">
        <h2 class="title">매거진 등록</h2>
      </div>
    </div>
  </div>
  <!-- 본문 타이틀 -->

  <!-- s : 본문 -->
  <form name="boardInsertForm" method="post" action="${pageContext.request.contextPath}/admin/board/boardInsertAction.do" enctype="multipart/form-data">
	  <div class="container">
	    <div class="content-sub-title">
	      <h3 class="title">자료실</h3>
	    </div>
	    <div id="BoxReturn" class="table-wrap mb4">
	      <table class="table is-bordered is-vertical is-fullwidth">
	        <colgroup>
	          <col style="width: 250px" />
	          <col style="width: calc(50%- 250px)" />
	        </colgroup>
	        <tbody>
	        <tr>
	          <th scope="row">제목</th>
	          <td>
	            <input type="text" id="boardTitle" name="boardTitle" class="input is-fullwidth" />
	          </td>
	        </tr>
	        <tr>
	          <th scope="row">내용</th>
	          <td>
	            <textarea class="textarea" id="boardContent" name="boardContent" id="" cols="30" rows="10"></textarea>
	          </td>
	        </tr>
	        <tr>
              <th scope="row">게시판 이미지</th>
                <td>
                    <div class="field is-vertical-center is-grouped">
                        <div class="control">
                            <input type="file" id="board_image_name" name=board_image_name onchange="fileCheck(this)" accept="image/gif, image/jpeg, image/png" style="display:none">
                            <button type="button" class="button is-outlined is-primary is-width-100" onclick="imageFind()">파일찾기</button>
                        </div>
                        <div class="control" id="imageName">게시판 이미지를 등록해 주세요.</div>
                        <div class="control">
                            <button type="button" id="imageDelete" class="button-delete"><i class="ico-cross"></i><span class="sr-only">삭제</span></button>
                        </div>
                    </div>
                </td>
             </tr>
             <tr>
             	<th scope="row">태그</th>
             	<td>
	             	<div class="field is-vertical-center is-grouped">
	                  	#<input type="text" id="board_tagView">
	                  	<input type="hidden" id="board_tag" name="boardTag">
	                	<button type="button" id="boardTagButton" onclick="boardTagAdd()" class="button is-outlined is-primary is-width-100">전송</button>
	                	<div class="control" id="board_tagDiv"></div>
	                </div>
                </td>
             </tr>
	        </tbody>
	      </table>
	    </div>
	
	    <div class="clear">
	      <div class="text-center button-wrap">
	        <button type="button" onclick="boardInsertFormSubmit()" class="button is-large is-main">등록</button>
	        <button type="button" id="btn_cancel" class="button is-large is-dark">취소</button>
	      </div>
	    </div>
	  </div>
  </form>
  <!-- e : 본문 -->
</div>
</body>

<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/metisMenu.min.js"></script>
<script src="../assets/js/jquery-ui.js"></script>
<script src="../assets/js/common-ui.js"></script>
<script>

	// 태그입력 창에서 엔터 누를 시
	$("#board_tagView").on('keyup', function (e) {
   		if (e.keyCode === 13) {
       		$("#boardTagButton").click();
    	}
	});

	
	//이미지 찾기 버튼 이벤트
	function imageFind(){
		$("#board_image_name").click();
	}
	
	// 파일 이미지만 등록하도록 유효성 검사
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
		
		// 게시판 이미지명 보여주기
		var fileValue = $("#board_image_name").val().split("\\");
		var fileName = fileValue[fileValue.length-1];
		$("#imageName").text(fileName);
		
	}
	
	// 이미지 삭제 버튼
    $("#imageDelete").click(function() {
			
    	$("#board_image_name").val("");
    	$("#imageName").text("게시판 이미지를 등록해 주세요.");
    })
    
	// 게시판 해시태그 추가
	function boardTagAdd(){
		var board_tagView = $("#board_tagView").val();
		var board_tag;
		
		
		if ($("#board_tag").val() == "")
		{
			board_tag = $("#board_tag").val($("#board_tag").val()+$("#board_tagView").val());
			$("#board_tagDiv").append("#"+board_tagView);
		} else {
			board_tag = $("#board_tag").val($("#board_tag").val()+", "+$("#board_tagView").val());
			$("#board_tagDiv").append(", #"+board_tagView);
		}
	  	
		$("#board_tagView").val("");
	}
    
	// 게시판 전송하기
	function boardInsertFormSubmit(){
		
		if ($("#boardTitle").val() == "")
		{
			alert("게시판 제목을 입력해 주세요!!");
			return false;
		}
		
		if ($("#boardContent").val() == "")
		{
			alert("게시판 내용을 입력해 주세요");
			return false;
		}
		
		if (confirm("매거진 등록을 진행하시겠습니까?") == false)
		{
			return false;
		}
		
		alert("매거진 등록이 완료되었습니다.");
		
		boardInsertForm.submit();
	}
    
    // 취소 버튼 누를 시
    $('#btn_cancel').click(function(){
		if (confirm("게시판 관리 페이지로 이동하시겠습니까?") == true)
		{
			location.href='/admin/board/boardList.do';
		}
	})

	

</script>

</html>