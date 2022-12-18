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
    <title>에디터 등록하기</title>
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
                <h2 class="title">에디터 등록하기</h2>
            </div>
        </div>
    </div>
    <!-- 본문 타이틀 -->

    <!-- s : 본문 -->
    <div class="container">

        <form id="formCard" method="post" action ="${pageContext.request.contextPath}/admin/member/MemberInsert.do"  enctype="multipart/form-data">
        <div class="table-wrap mb4">
            <table class="table is-bordered is-vertical is-fullwidth">
                <colgroup>
                    <col style="width: 250px" />
                    <col style="width: calc(50%- 250px)" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">회원 아이디</th>
                    <td>
                    <div style="display: flex;">
                        <div class="control is-width-500">
                            <input type="text" id="member_id" name="member_id" class="input is-fullwidth" />
                            <input type="hidden"/ id="hiddenMember_id">
                        </div>
                        <button type="button" class="button is-large is-black" style="margin-left: 10px" id="btn_memberCheck">중복체크</button>
                    </div>
                </td>
                </tr>

                <tr>
                    <th scope="row">닉네임</th>
                    <td>
                        <div class="control is-width-500">
                            <input type="text" id="member_nickname" name="member_nickname" class="input is-fullwidth" />
                        </div>
                    </td>
                </tr>

                <tr>
                    <th scope="row">핸드폰 번호</th>
                    <td>
                        <div class="control is-width-500">
                            <input type="text" id="member_phone" name="member_phone" class="input is-fullwidth" />
                        </div>
                    </td>
                </tr>

				<tr>
                    <th scope="row">프로필 사진</th>
                    <td>
                        <div class="field is-vertical-center is-grouped">
                            <div class="control">
                                <input type="file" id="member_image" name="member_image" onchange="fileCheck(this)" accept="image/gif, image/jpeg, image/png" style="display:none">
                                <button type="button" class="button is-outlined is-primary is-width-100" onclick="imageFind()">파일찾기</button>
                                <!-- <button type="button" class="button is-outlined is-primary is-width-100" onclick="onclick=document.all.member_image.click()">파일찾기</button> -->
                            </div>
                            <div class="control" id="imageName">프로필 이미지를 등록해 주세요.</div>
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
                <button type="submit" id="btn_editorInsert" class="button is-large is-main">등록</button>
                <button type="button" id="btn_cancel" class="button is-large is-dark">취소</button>

            </div>
        </div>
    </div>
    <!-- e : 본문 -->
</div>

<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/metisMenu.min.js"></script>
<script src="../assets/js/jquery-ui.js"></script>
<script src="../assets/js/common-ui.js"></script>
<script>
	
	
	// 이미지 찾기 버튼 이벤트
	function imageFind(){
		$("#member_image").click();
	}

	
	// 에디터 등록 가능한지 유효성 검사	
    $('#btn_memberCheck').click(function() {
    	
	    var member_id = $("#member_id").val();
	    
        if (member_id.length == 0)
		{
        	alert("아이디를 입력해 주세요");
        	$("#member_id").focus();
			return false;
		}
		
        $.ajax(
                {
                    type : 'GET',
                    url : "/admin/member/editorVali.ajax",
                    data : {
                        "member_id" : member_id
                    },
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function(data)
                    {
                    	
                    	$("#member_nickname").val(data.memberNickname);
                    	$("#member_phone").val(data.memberPhone);
                    	
                    	
                        if (data.memberSeq == 0){
                            alert("에디터 등록이 가능합니다.");
                            
	                    	$('#member_nickname').attr('readonly', true);
	                    	$('#member_phone').attr('readonly', true);

                        } else if (data.memberSeq == 1){
                            alert("이미 에디터 상태입니다.");
                            $('#member_nickname').attr('readonly', false);
	                    	$('#member_phone').attr('readonly', false);
	                    	$("#member_id").focus();
                        } else if (data.memberSeq == 2){
                        	alert("존재하지 않는 아이디입니다.");
                        	$('#member_nickname').attr('readonly', false);
	                    	$('#member_phone').attr('readonly', false);
	                    	$("#member_id").focus();
                        }
                        
                        $("#hiddenMember_id").val(member_id);
                    },
                    error : function(request, status, error)
                    {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }

                });
    })
    
    
	// 이미지 파일만 등록할 수 있도록 유효성 검사
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
		var fileValue = $("#member_image").val().split("\\");
		var fileName = fileValue[fileValue.length-1];
		$("#imageName").text(fileName);
		
		
	}
    
    // 프로필 삭제 버튼
    $("#imageDelete").click(function() {
			
    	$("#member_image").val("");
    	$("#imageName").text("프로필 이미지를 등록해 주세요.");
    	
    })

    
    
	//등록버튼 클릭
	$('#btn_editorInsert').click(function()
	{

		var member_id = $("#member_id").val();

		if (member_id.length == 0)
		{
			alert("아이디를 입력해 주세요");
			$("#member_id").focus();
			return false;
		} else if ($("#member_id").val() != $("#hiddenMember_id").val()){
			alert("변경하신 아이디를 중복체크해 주세요");
			return false;
		}
		
		if (confirm("해당 계정을 에디터로 등록하시겠습니까?") == true)
		{
			alert("에디터 등록이 완료되었습니다.");
			$('#formCard').submit();
		}

	})
	
	//취소버튼 클릭
	$('#btn_cancel').click(function(){
		if (confirm("회원 관리 페이지로 이동하시겠습니까?") == true)
		{
			location.href='/admin/member/memberList.do';
		}
	})
	
	
</script>
</body>

</html>