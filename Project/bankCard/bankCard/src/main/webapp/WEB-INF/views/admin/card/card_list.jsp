<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-10-03
  Time: 오전 12:16
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
    <title>관리자 - 카드관리</title>
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

    <script src="../../assets/js/jquery.min.js"></script>
    <script src="../../assets/js/metisMenu.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../../assets/js/common-ui.js"></script>

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
                <a href="/Main.do"><h2 class="title">카드관리</h2></a>
            </div>
        </div>
    </div>
    <!-- 본문 타이틀 -->
	
    <!-- s : 본문 -->
    <div class="container">
        <div class="tab-block-wrap">
            <nav class="tabs">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/admin/member/memberList.do">회원관리</a></li>
                    <li class="is-active"><a href="${pageContext.request.contextPath}/admin/card/cardList.do">카드관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/board/boardList.do">매거진</a></li>
                </ul>
            </nav>
        </div>
        <div class="clear mb2">
            <div class="float-right button-wrap">
                <a href="${pageContext.request.contextPath}/admin/cardInsert.do" class="button is-large is-success">카드 등록하기</a>
            </div>
        </div>
        <div class="box-gray">
            <form action="cardList.do">
                <fieldset>
                    <div class="row">
                        <div class="field is-grouped">
                            <div class="control is-width-30"></div>
							
							<select id="searchSelect" name="searchSelect">
								<option value="searchCardname">카드이름</option>
								<option value="searchCardCompany">카드사</option>
							</select>

                            <div class="control is-width-500">
                                <input type="text" id="searchInput" name="searchInput" onkeypress="JavaScript:press(this.form)" 
                                	class="input is-fullwidth" placeholder="검색어를 입력해 주세요."/>
                            </div>
                            <div class="control">
                                <button type="submit" class="button-search-icon">
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
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                    <col style="width: 15%" />
                    <col style="width: 10%" />
                    <col />
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                    <col style="width: 10%" />
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">카드 타입</th>
                    <th scope="col">카드 혜택 종류</th>
                    <th scope="col">카드사</th>
                    <th scope="col">카드이름</th>
                    <th scope="col">그림</th>
                    <th scope="col">조회수(인기점수)</th>
                    <th scope="col">카드 혜택 수</th>
                    <th scope="col">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${cardList.size() > 0 }">
	                    <c:forEach items="${cardList}" var="list">
		                    <tr>
		                        <td>
		                            <c:choose>
		                                <c:when test="${list.cardTypeSeq eq '1'}">
		                                    <span class="button is-success">신용</span>
		                                </c:when>
		                                <c:otherwise>
		                                    <span class="button is-main">체크카드</span>
		                                </c:otherwise>
		                            </c:choose>
		
		                        </td>
		
		                        <td>
		                            <c:choose>
		                                <c:when test="${list.cardPointSel eq '1'}">
		                                    <span class="button is-main">마일리지</span>
		                                </c:when>
		                                <c:otherwise>
		                                    <span class="button is-success">적립 / 혜택</span>
		                                </c:otherwise>
		                            </c:choose>
		                        </td>
		                        <td>${list.cardCompanyName}</td>
		                        <td class="th-new">${list.cardName}</td>
		                        <td><img src="${pageContext.request.contextPath}/card/${list.cardImage}" style="width: 350px; height: 200px;"/></td>
		
		                        <td>${list.cardCount}</td>
		                        <td>
		                            <button type="button" class="button is-outlined is-blue" onclick="CardDetail(${list.cardSeq})">상세보기</button>
		                            <c:if test="${list.cardState == 'Y'}">
			                            <button type="button" class="button is-outlined is-blue modal-state-view" id="cardStateButton${list.cardSeq }" onclick="cardState(${list.cardSeq})">상태변경</button>
		                            </c:if>
		                            <c:if test="${list.cardState == 'N' }">
		                            	<button type="button" class="button is-danger">삭제</button>
		                            </c:if>
		                        </td>
		                        <td>
		                            <button type="button" class="button is-outlined is-blue" onClick="popup_card(${list.cardSeq}, ${list.cardPointSel})">혜택 수정</button>
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
                	<a href="cardList.do?nowPage=${completePaging.startPage - 1 }&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect }&searchInput=${searchInput}" class="pagination-previous">
                		<i class="ico-chevron-left-thin"></i><span class="sr-only">이전 페이지 목록</span></a>
                </c:if>
                <ul class="pagination-list">
                <c:forEach begin="${completePaging.startPage }" end="${completePaging.endPage }" var="p">
                	<c:choose>
                		<c:when test="${p == completePaging.nowPage}">
							<li><a href="#" class="pagination-link is-current">${p }</a></li>
						</c:when>
						<c:when test="${p != completePaging.nowPage}">
							<li><a class="pagination-link" href="cardList.do?nowPage=${p}&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect }&searchInput=${searchInput}">${p}</a></li>
						</c:when>
                    </c:choose>
                </c:forEach>
                </ul>
                <c:if test="${completePaging.endPage != completePaging.lastPage}">
                	<a href="cardList.do?nowPage=${completePaging.endPage+1 }&cntPerPage=${completePaging.cntPerPage}&searchSelect=${searchSelect }&searchInput=${searchInput}" class="pagination-next">
                		<i class="ico-chevron-right-thin"></i><span class="sr-only">다음 페이지 목록</span></a>
                </c:if>
            </nav>
        </div>
    </div>
    
    <!-- e : 본문 -->


    <!-- S : 상태변경  팝업 -->
    <!-- <div id="modal-state" class="modal modal-alert is-clipped">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">상태변경</p>
            </header>
            <div class="modal-card-body">
                <div class="radio">
                    <input type="radio" name="radio01" id="radio01" />
                    <label for="radio01">심사중</label>
                </div>
                <div class="radio">
                    <input type="radio" name="radio01" id="radio02" />
                    <label for="radio02">반려</label>
                </div>
                <div class="radio">
                    <input type="radio" name="radio01" id="radio03" />
                    <label for="radio03">허가</label>
                </div>
                <div class="radio">
                    <input type="radio" name="radio01" id="radio04" />
                    <label for="radio04">취소</label>
                </div>
            </div>
            <div class="modal-card-foot">
                <button type="button" class="button is-primary">변경</button>
                <button type="button" class="button is-dark button-modal-close">취소</button>
            </div>
        </div>
    </div> -->
    <!-- E : 상태변경 팝업 -->




    <!-- S : 적립 / 혜택 등록하기  팝업 -->
    <div id="modal-auth" class="modal modal-alert is-clipped">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">적립 / 혜택</p>
            </header>
            <div class="modal-card-body">
                <div class="table-wrap mb2">
                    <table class="table is-bordered is-vertical is-fullwidth">
                        <colgroup>
                            <col/>
                            <col style="width: 25%" />
                            <col style="width: 25%" />
                            <col style="width: 12%" />
                        </colgroup>
                        <thead>
                            <th>브랜드</th>
                            <th>금액</th>
                            <th>할인금액</th>
                            <th>기능</th>
                        </thead>
                        <tbody id="popup_card_tbody">

                        </tbody>
                    </table>
                    <button type="button" class="button is-primary" onclick="popup_card_add()">카드 혜택 등록하기</button>
                    <button type="button" class="button is-dark button-modal-close" id="popup_card_close">취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- E : 적립 / 혜택 등록하기  -->


    <!-- S : 마일리지 등록하기  팝업 -->
    <div id="modal-mileage" class="modal modal-alert is-clipped">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">카드 마일리지</p>
            </header>
            <div class="modal-card-body">
                <div class="table-wrap mb2">
                    <table class="table is-bordered is-vertical is-fullwidth">
                        <colgroup>
                            <col/>
                            <col style="width: 50%" />
                            <col style="width: 12%" />
                        </colgroup>
                        <thead>
                        <th>금액</th>
                        <th>마일리지 포인트</th>
                        <th>기능</th>
                        </thead>
                        <tbody id="popup_card_mileage">

                        </tbody>
                    </table>
                    <button type="button" class="button is-primary" onclick="popup_mileage_add()">카드 혜택 등록하기</button>
                    <button type="button" class="button is-dark button-modal-close" id="popup_card_close1">취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- E : 마일리지 등록하기  -->

	
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

    let popup_cardSeq = 0;
    
	// 검색란에서 엔터 눌렀을 시 이벤트 발생
	function press(f){
	    if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
	    	
	    	searchForm.submit(); //formname에 사용자가 지정한 form의 name입력
	    }
	}

    function CardDetail(num) {
        location.href='${pageContext.request.contextPath}/admin/card/cardDetail.do?cardSeq='+num;
    }



    //카드 혜택 정보
    //카드 관련 팝업 생성
    function popup_card(num, cardPointSel) {

        ADD_CHECK = true;
        popup_cardSeq = num;
        //cardPointSel :1  - 마일리지
        if(cardPointSel === 1) {

            cardSelectMileage(num);
            $("#modal-auth").removeClass("is-active");
            $('#modal-mileage').addClass("is-active");
        }
        //cardPointSel : 2 - 적립 / 혜택
        else if(cardPointSel ===2) {
            cardSelectSale(num);
            $('#modal-mileage').removeClass("is-active");
            $('#modal-auth').addClass("is-active");
        }
    }

    //카드등록 팝업 종료
    $("#popup_card_close").click(function() {

        ADD_CHECK = true;   //카드 등록하기 reset
        $("#modal-auth").removeClass("is-active");
        $("#modal-mileage").removeClass("is-active");
    })

    function cardSelectMileage(num) {

        let Url = '${pageContext.request.contextPath}/admin/card/SelectMileageList.ajax';

        $.ajax({
            url : Url,
            type : 'post',
            data : {cardSeq : num},
            dataType : 'json',
            success : function (data) {
                console.log(data);
                let str_arr = '';
                if(data.RST_CD == 0) {
                    let dataList = data.mileageList;
                    for(var i=0; i < data.mileageList.length; i++) {

                        str_arr += '<tr>';
                        str_arr += '<th scope="row">'+dataList[i].cardPrice+'</th>';
                        str_arr += '<th>'+dataList[i].mileageValue+'</th>';
                        str_arr += '<td>';
                        str_arr += '<div class="control">';
                        str_arr += '<button type="button" class="button-delete" onclick="cardMileageDelete('+dataList[i].mileageSeq+','+dataList[i].cardSeq+')">';
                        str_arr += '<i class="ico-cross"></i><span class="sr-only">삭제</span></button>';
                        str_arr += '</div>';
                        str_arr += '</td>';
                        str_arr += '</tr>';
                    }
                } else {
                    str_arr = '<tr><td colspan="3">등록된 혜택이 없습니다.</td></tr>';
                }

                $('#popup_card_mileage').html(str_arr);
            }
        })
    }

    //카드 적립 / 혜택 정보 불러오기
    function cardSelectSale(num) {

        let Url = '${pageContext.request.contextPath}/admin/card/SelectBenefitList.ajax'
        let str_arr = '';

        $.ajax({
            url: Url,
            type: 'post',
            data : {cardSeq : num},
            dataType : 'json',
            success : function(data) {
                console.log(data);

                if(data.RST_CD == 0) {
                    let dataList = data.benefitList;
                    for(var i=0; i < data.benefitList.length; i++) {

                        str_arr += '<tr>';
                        str_arr += '<th scope="row">'+dataList[i].placeName+'</th>';
                        str_arr += '<th>'+dataList[i].cardPrice+'</th>';
                        str_arr += '<td>'+dataList[i].cardSale+'</td>';
                        str_arr += '<td>';
                        str_arr += '<div class="control">';
                        str_arr += '<button type="button" class="button-delete" onclick="cardBenefitDelete('+dataList[i].benefitSeq+','+dataList[i].cardSeq+')">';
                        str_arr += '<i class="ico-cross"></i><span class="sr-only">삭제</span></button>';
                        str_arr += '</div>';
                        str_arr += '</td>';
                        str_arr += '</tr>';
                    }
                } else {
                    str_arr = '<tr><td colspan="3">등록된 혜택이 없습니다.</td></tr>';
                }


                $('#popup_card_tbody').html(str_arr);
            }
        })
    }

    //selectBox에서 사용하는 html
    let card_select = '<select id="card_select">';
    card_select += '<option>선택</oprion>';
    card_select += '<option value="100000">10만원</option>';
    card_select += '<option value="150000">15만원</option>';
    card_select += '<option value="200000">20만원</option>';
    card_select += '<option value="250000">25만원</option>';
    card_select += '<option value="300000">30만원</option>';
    card_select += '</select>';

    let card_sale = '';
    card_sale += '<select id="card_sale">';
    card_sale += '<option value="1000">1000원</option>';
    card_sale += '<option value="2000">2000원</option>';
    card_sale += '<option value="3000">3000원</option>';
    card_sale += '<option value="4000">4000원</option>';
    card_sale += '<option value="5000">5000원</option>';
    card_sale += '<option value="6000">6000원</option>';
    card_sale += '<option value="7000">7000원</option>';
    card_sale += '<option value="8000">8000원</option>';
    card_sale += '<option value="9000">9000원</option>';
    card_sale += '<option value="10000">10000원</option>';
    card_sale += '<option value="15000">15000원</option>';
    card_sale += '<option value="20000">20000원</option>';
    card_sale += '<option value="25000">25000원</option>';
    card_sale += '<option value="30000">30000원</option>';
    card_sale += '<option value="1%">1%</option>';
    card_sale += '<option value="2%">2%</option>';
    card_sale += '<option value="3%">3%</option>';
    card_sale += '<option value="4%">4%</option>';
    card_sale += '<option value="5%">5%</option>';
    card_sale += '<option value="6%">6%</option>';
    card_sale += '<option value="7%">7%</option>';
    card_sale += '<option value="8%">8%</option>';
    card_sale += '<option value="9%">9%</option>';
    card_sale += '<option value="10%">10%</option>';
    card_sale += '</select>';



    //카드 적립 / 혜택 등록하기
    let ADD_CHECK = true;
    function popup_card_add() {


        if(ADD_CHECK) {

            //BrandList 불러오기
            let url = '${pageContext.request.contextPath}/admin/card/placeGroupList.ajax';
            $.ajax({
                url : url,
                type : 'get',
                dataType: 'json',
                success : function(data) {
                    if(data.RST_CD == 0) {


                        let arr_str = '';
                        arr_str += '<tr>';
                        arr_str += '<th scope="row">';

                        //selectBox 생성
                        arr_str += '<div class="select is-fullwidth">';
                        arr_str += '<select id="placeList">';
                        arr_str += '<option value="0">선택</option>';
                        for(var i=0; i < data.placeList.length; i++ ) {
                            arr_str += '<option value="'+data.placeList[i].placeMstSeq+'">['+data.placeList[i].placeType+']'+data.placeList[i].placeName+'</option>';
                        }
                        arr_str += '</select>';
                        arr_str += '</div>';
                        arr_str += '<th>';
                        arr_str += '<div class="select is-fullwidth">'+card_select;
                        arr_str += '</div>';
                        arr_str += '</th>';
                        arr_str += '<th>';
                        arr_str += '<div class="select is-fullwidth">'+card_sale;
                        arr_str += '</div>';
                        arr_str += '</th>';
                        arr_str += '<td>';
                        arr_str += '</td>';
                        arr_str += '</tr>';
                        $('#popup_card_tbody').append(arr_str);

                    }
                }
            })

            ADD_CHECK = false;
        } else {
            ADD_CHECK = true;
            card_add();
        }
    }


    //카드 마일리지 등록하기
    let ADD_MILEAGE_CHECK = true;
    function popup_mileage_add() {


        if(ADD_MILEAGE_CHECK) {

            let arr_str = '';
            arr_str += '<tr>';

            arr_str += '<th>';
            arr_str += '<div class="select is-fullwidth">'+card_select;
            arr_str += '</div>';
            arr_str += '</th>';
            arr_str += '<th>';
            arr_str += '<div class="select is-fullwidth">'+card_sale;
            arr_str += '</div>';
            arr_str += '</th>';
            arr_str += '<td>';
            arr_str += '</td>';
            arr_str += '</tr>';
            $('#popup_card_mileage').append(arr_str);

            ADD_MILEAGE_CHECK = false;
        } else {
            ADD_MILEAGE_CHECK = true;
            card_mileage_add();
        }
    }


    //카드 혜택 삭제하기
    function cardBenefitDelete(seq, cardSeq) {


        let url = '${pageContext.request.contextPath}/admin/card/deleteBenefit.do';
        $.ajax({
            url : url,
            type : 'post',
            data : {benefitSeq : seq,
            cardSeq : cardSeq},
            dataType: 'json',
            success : function(data) {
                cardSelectSale(popup_cardSeq);
            }
        })
    }

    //카드 마일리지 삭제하기
    function cardMileageDelete(seq, cardSeq) {

        let url = '${pageContext.request.contextPath}/admin/card/deleteMileage.ajax'
        $.ajax({
            url : url,
            type : 'post',
            data : {mileageSeq : seq,
            cardSeq : cardSeq},
            dataType : 'json',
            success : function(data) {
                cardSelectMileage(popup_cardSeq);
            }
        })

    }



    //카드 마일리지 추가하기
    function card_mileage_add() {
        let url = '${pageContext.request.contextPath}/admin/card/InsertMileage.ajax';

        let cardPrice = $('#card_select').val();
        let mileageValue = $('#card_sale').val();

        $.ajax({
            url : url,
            data : {
                'cardSeq' : popup_cardSeq,
                'cardPrice' : cardPrice,
                'mileageValue' : mileageValue
            },
            type : 'post',
            dataType : 'json',
            success : function(data) {
                cardSelectMileage(popup_cardSeq);
            }
        })
    }


    //카드 혜택 / 적립 추가하기
    function card_add() {
        let url = '${pageContext.request.contextPath}/admin/card/InsertBenefit.ajax';


        let cardPrice = $('#card_select').val();
        let cardSale = $('#card_sale').val();
        let placeList = $('#placeList').val();

        if(cardPrice === '0' || cardSale === '0' || placeList === '0') {
            ADD_CHECK = false;
            return;
        }

        $.ajax({
            url : url,
            type : 'post',
            data : {
                'cardSeq' : popup_cardSeq,
                'cardPrice' : cardPrice,
                'cardSale' : cardSale,
                'placeMstSeq' : placeList},
            dataType: 'json',
            success : function(data) {
                cardSelectSale(popup_cardSeq);
            }
        })
    }
    
    // 카드 상태 변경
    function cardState(seq){
    	if (confirm("카드를 삭제 하시겠습니까?") == false)
		{
			return false;
		}
    	
    	let url = '${pageContext.request.contextPath}/admin/card/cardState.ajax';
    	
    	$.ajax({
            url : url,
            type : 'post',
            data : {
                'cardSeq' : seq},
            success : function() {
            
            	$("#cardStateButton"+seq).html('삭제');
            	$("#cardStateButton"+seq).removeClass("button is-outlined is-blue modal-state-view");
            	$("#cardStateButton"+seq).addClass("button is-danger");
            	$("#cardStateButton"+seq).attr('onclick', '').unbind('click');
            }
        })
    	
    }
</script>
</body>

</html>