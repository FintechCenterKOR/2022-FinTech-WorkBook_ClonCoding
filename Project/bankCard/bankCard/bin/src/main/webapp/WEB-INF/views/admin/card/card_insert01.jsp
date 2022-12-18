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
                            <input type="radio" name="cardType" id="radio${li.count}" />
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
                                <select name="cardCompanyName" id="cardCompanyName">
                                    <c:forEach items="${cardCompanyList}" var="list" varStatus="li">
                                        <div class="radio">
                                            <option value="${list.cardComanySeq}">${list.cardComanyName}</option>
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
                                <input type="checkbox" name="cardBrand" id="cardBrand${li.count}" value="${list.brandSeq}"/>
                                <label for="cardBrand${li.count}">${list.brandName}</label>
                            </div>
                        </c:forEach>
                    </td>
                </tr>

                <tr>
                    <th scope="row">카드 이름</th>
                    <td>
                        <div class="control is-width-500">
                            <input type="text" class="input is-fullwidth" />
                        </div>
                    </td>
                </tr>

                <tr>
                    <th scope="row">카드 이미지</th>
                    <td>
                        <div class="field is-vertical-center is-grouped">
                            <div class="control">
                                <button type="button" class="button is-outlined is-primary is-width-100">파일찾기</button>
                            </div>
                            <div class="control">Bank 카드이미지.zip</div>
                            <div class="control">
                                <button type="button" class="button-delete"><i class="ico-cross"></i><span class="sr-only">삭제</span></button>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <button type="button" class="button is-large is-black" style="margin-bottom: 10px" id="btn_card">추가</button>
        <div class="table-wrap mb4">
            <table class="table is-bordered is-vertical is-fullwidth">
                <colgroup>
                    <col style="width: 250px" />
                    <col style="width: 250px" />
                    <col style="width: 250px" />
                    <col style="width: 250px" />
                    <col style="width: calc(50%- 250px)" />
                </colgroup>
                <thead id="cardTypeHead">
                    <tr>
                        <th scope="row">카드 혜택</th>
                        <td>구분</td>
                        <td>구분</td>
                        <td>내용</td>
                        <td>내용</td>
                    </tr>
                </thead>
                <tbody id="tbodyCheck">


                </tbody>
            </table>
        </div>



        <div id="BoxReturn" class="table-wrap mb4" style="display: none;">
            <table class="table is-bordered is-vertical is-fullwidth">
                <colgroup>
                    <col style="width: 250px" />
                    <col style="width: calc(50%- 250px)" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">사유등록</th>
                    <td>
                        <textarea class="textarea" name="" id="" cols="30" rows="10"></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="clear">
            <div class="text-center button-wrap">
                <button type="submit" class="button is-large is-main">등록</button>
                <button type="button" class="button is-large is-dark">취소</button>

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
<script src="../assets/js/metisMenu.min.js"></script>
<script src="../assets/js/jquery-ui.js"></script>
<script src="../assets/js/common-ui.js"></script>
<script>
    $(document).ready(function() {

    });

    let cardLow = 1;    //행의 개수


    //버튼 선택
    $('input[type=radio][name=cardPointSel]').change(function() {
        let radioChk = $('input[type=radio][name=cardPointSel]:checked').val();

        alert(radioChk);
        if(radioChk == 1) {
            $('#tbodyCheck').html('');
            cardLow = 1;
            cardType(1);
        }
        else {
            $('#tbodyCheck').html('');
            cardLow =1;
            cardType(2);
        }
    });

    $('#btn_card').click(function() {
        let radioChk = $('input[type=radio][name=cardPointSel]:checked').val();
        if(radioChk == 1) {
            cardMilege();
        }
        else if(radioChk == 2) {
            cardAddBetfit();
        }
    })
    //상단 목록 변경
    function cardType(num) {

        let str_arr = '';
        if(num == 1) {
            str_arr +='<tr>';
            str_arr +='<td>카드 혜택</td>';
            str_arr +='<td rowspan="2">마일리지 원 비율</td>';
            str_arr +='<td rowspan="3">획득 마일리지</td>';
            str_arr +='</tr>';
        }
        else if(num ==2) {
            str_arr +='<tr>';
            str_arr +='<td>카드 혜택</td>';
            str_arr +='<td>대분류</td>';
            str_arr +='<td>소분류</td>';
            str_arr +='<td>최소 카드 사용금액</td>';
            str_arr +='<td>할인 금액</td>';
            str_arr +='</tr>';
        }


        $('#cardTypeHead').html(str_arr);
    }

    function cardMilege() {
        let str_arr ='';
        str_arr+='<tr>';
        str_arr+='<th scope="row">카드 혜택정보</th>';
        str_arr+='<td>';
        str_arr+='<div class="control is-width-300">';
        str_arr+='<input type="text" class="input is-fullwidth" placeholder="적립 포인트"/>';
        str_arr+='</div>';
        str_arr+='</td>';

        str_arr+='<td>';
        str_arr+='<div class="control is-width-300" style="display: flex;">';
        str_arr+='<input type="text" class="input is-fullwidth" placeholder="적립 포인트"/>';
        str_arr+='<div class="control">';
        str_arr+='<button type="button" class="button-delete" style="top:7px; margin-left:6px;"><i class="ico-cross"></i><span class="sr-only">삭제</span></button>';
        str_arr+='</div>';
        str_arr+='</div>';
        str_arr+='</td>';

        $('#tbodyCheck').append(str_arr);
    }


    //할인 적립 추가 버튼 클릭
    function cardAddBetfit() {

        let url = '${pageContext.request.contextPath}/admin/card/placeGroupList.ajax'
        $.ajax({
            url : url,
            type : 'get',
            dataType : 'json',
            success : function(data) {
                console.log(data);

                let str_arr ='';
                str_arr+='<tr>';
                str_arr+='<th scope="row">카드 혜택정보</th>';
                str_arr+='<td>';
                str_arr+='<div class="control is-width-300">';
                str_arr+='<div class="select is-fullwidth">';
                str_arr+='<select name="placeGroupType'+cardLow+'" id="placeGroupType'+cardLow+'" sel_value ="'+cardLow+'">';
                str_arr+='<div class="radio">';
                str_arr+='<option value="00">선택</option>';
                for(var i=0; i< data.placeList.length; i++) {
                    str_arr+='<option value="'+data.placeList[i].placeType+'">'+data.placeList[i].placeType+'</option>';
                }

                str_arr+='</div>';
                str_arr+='</select>';
                str_arr+='</div>';
                str_arr+='</div>';
                str_arr+='</td>';
                str_arr+='<th scope="row">';
                str_arr+='<div class="control is-width-300">';
                str_arr+='<div class="select is-fullwidth">';
                str_arr+=' <select name="placeName" id="placeName'+cardLow+'">';
                str_arr+='         <div class="radio">';
                str_arr+='             <option value="0">선택</option>';
                str_arr+='         </div>';
                str_arr+=' </select>';
                str_arr+='        </div>';
                str_arr+='    </div>';
                str_arr+='</th>';
                str_arr+='<td>';

                str_arr+='<div class="control is-width-300">';
                str_arr+='<input type="text" class="input is-fullwidth" placeholder="일정금액이상 사용시"/>';
                str_arr+='</div>';

                str_arr+='</td>';
                str_arr+='<td>';

                str_arr+='<div style="display:flex;">';
                str_arr+='<div class="control is-width-300">';
                str_arr+='<input type="text" class="input is-fullwidth" placeholder="적립 포인트"/>';
                 str_arr+='</div>';

                str_arr+='<div class="control">';
                str_arr+='<button type="button" class="button-delete" style="top:7px; margin-left:6px;"><i class="ico-cross"></i><span class="sr-only">삭제</span></button>';
                str_arr+='</div>';
                str_arr+='</div>';

                str_arr+='</td>';
                str_arr+='</tr>';

                $('#tbodyCheck').append(str_arr);

                $('#placeGroupType'+cardLow).change(function(e) {

                })

                cardLow++;
            }
        });
    }



    function subBrand(num, type) {

        console.log(num);
        console.log(type);

        let url = '${pageContext.request.contextPath}/admin/card/placeList.ajax'
        $.ajax({
            url: url,
            type: 'get',
            data : {placeType:type},
            dataType: 'json',
            success: function (data) {
                console.log(data);

                let str_arr ='';
                for(var i=0; i < data.placeList.length; i++) {
                    str_arr+='<option value="0">'+data.placeList[i].placeName+'</option>';
                }

                $('#placeName'+num).html(str_arr);
            }
        });
    }
</script>
</body>

</html>