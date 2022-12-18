<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-11-01
  Time: 오후 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>

    <link rel="styleSheet" href="${pageContext.request.contextPath}/assets/css/main.css" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="styleSheet" href="${pageContext.request.contextPath}/assets/css/user.css" >
    <!-- <link rel="stylesheet" href="../assets/css/user.css" /> -->

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/metisMenu.min.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/common-ui.js"></script>

    <style>
        .cardList3f {
            font-size: 14px;
            color : blue;
        }

        .name_3a6il {
            display: block;
            width: 100%;
            margin: 12px 0 0;
            color: red;
            font-size: 16px;
            line-height: 1;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        
        .wrap_13JWz {
		    display: block;
		    padding: 0;
		    color: #7b7b7b;
		    font-size: 14px;
		    line-height: 1.3;
		    text-align: center;
		}

    </style>
</head>
<body style="height: auto; overflow: visible;">
<header>
    <div class="wrap_1X6t">
        <div class="cover_SgeC9">
            <h2 class="coverTitle_3574n">
                3,800개 카드 중
                <strong>나에게 가장 좋은 카드</strong>
            </h2>
            <p class="coverDescription_vsKJp">
                소비자패턴을 더 정확하게 입력할수록, 최고의 카드를 찾을 확률이 높아집니다!
            </p>
        </div>
        <div class="border border-3">
            <table>
                <tr>
                    <td align="left" class="leftTd">
                        <nav class="nav">
                            <img class="logoImageStyle" src="${pageContext.request.contextPath}/assets/images/MainLogo.png">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Main.do">메인</a>
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
<div id="wrap">
    <div>
        <div>
            <div class="wrap_1ubD1">
                <div class="common_3SzGI">
                    <div class="wrap_3A2yG">
                        <div class="menu_1BW0e">
                            <!-- <label for="headerAppLink" class="wrap_1ysgd">
                              <h3 class="title_2kh4i">"qo</h3>
                            </label> -->
                        </div>
                    </div>
                </div>

                <div class="shortcut_2XOKK">
                    <div class="wrap_3Jv9q">
                        <ul class="menu_n8xkG">
                            <li>
                                <a href="#" class="active_3tq8E"><span>카드</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="wrap_3BqTy">

                <div class="container_VGO_q">
                    <input type="checkbox" id="card-filter" class="filterTrigger_2TI2X">
                    <label for="card-filter"></label>
                    <section class="filter_mgC68">
                        <label for="card-filter" class="filterTitle_2p3MX"></label>
                        <div>
                            <div class="box_385Ls">
                                <h5 class="title_XmGna">
                                    카드종류
                                    <button class="all_1idVF" id="cardTypeAll">전체</button>
                                </h5>
                                <ul class="checks_3avrQ">
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardTypeCheckBox" id="card_types-1" value="신용">
                                        <label for="card_types-1">신용</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardTypeCheckBox" id="card_types-0" value="체크">
                                        <label for="card_types-0">체크</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardTypeCheckBox" id="card_types-2" value="하이브리드">
                                        <label for="card_types-2">하이브리드</label>
                                    </li>
                                </ul>
                                <h5 class="title_XmGna">혜택 종류</h5>
                                <ul class="tabs_1VQ6k">
                                    <li>
                                        <input type="radio" id="benefit_group-discount" onclick="selectCardPointSel(2)" name="benefit_group" checked>
                                        <label for="benefit_group-discount">할인/적립</label>
                                    </li>
                                    <li>
                                        <input type="radio" id="benefit_group-mileage" onclick="selectCardPointSel(1)" name="benefit_group">
                                        <label for="benefit_group-mileage">항공마일</label>
                                    </li>
                                </ul>




                                <h5 class="title_XmGna">카드사
                                    <button class="all_1idVF" id="cardCompanyAllCheck">전체</button>
                                </h5>
                                <ul class="checks_3avrQ">
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-shinhan" value="신한" checked>
                                        <label for="company-shinhan">신한</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-hyundai" value="현대" checked>
                                        <label for="company-hyundai">현대</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-ibk" value="IBK기업" checked>
                                        <label for="company-ibk">IBK기업</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-kb" value="KB국민" checked>
                                        <label for="company-kb">KB국민</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-lotte" value="롯데" checked>
                                        <label for="company-lotte">롯데</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-samsung" value="삼성" checked>
                                        <label for="company-samsung">삼성</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-sk" value="하나" checked>
                                        <label for="company-sk">하나</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-woori" value="우리" checked>
                                        <label for="company-woori">우리</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-bc" value="BC바로" checked>
                                        <label for="company-bc">BC바로</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardCompanyCheckBox" id="company-hyundai_department_store" value="현대백화점" checked>
                                        <label for="company-hyundai_department_store">현대백화점</label>
                                    </li>

                                </ul>

                                <h5 class="title_XmGna">
                                    브랜드
                                    <button class="all_1idVF" id="cardBrandAllCheck">전체</button>
                                </h5>
                                <ul class="checks_3avrQ">
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-국내전용" value="1" checked>
                                        <label for="brand-국내전용">국내전용</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-VISA" value="2" checked>
                                        <label for="brand-VISA">VISA</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-MASTER" value="3" checked>
                                        <label for="brand-MASTER">MASTER</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-MAESTRO" value="4" checked>
                                        <label for="brand-MAESTRO">MAESTRO</label>
                                    </li>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-AMEX" value="5" checked>
                                        <label for="brand-AMEX">AMEX</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-UNION PAY" value="6" checked>
                                        <label for="brand-UNION PAY">UNION PAY</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-BC Global" value="7" checked>
                                        <label for="brand-BC Global">BC Global</label>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-BC" value="8" checked>
                                        <label for="brand-BC">BC</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-URS" value="9" checked>
                                        <label for="brand-URS">URS</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-JCB" value="10" checked>
                                        <label for="brand-JCB">JCB</label>
                                    </li>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-K-World" value="11" checked>
                                        <label for="brand-K-World">K-World</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-채움" value="12" checked>
                                        <label for="brand-채움">채움</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-S&" value="13" checked>
                                        <label for="brand-S&">S&</label>
                                    </li>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-DINERS" value="14" checked>
                                        <label for="brand-DINERS">DINERS</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-CIRRUS" value="15" checked>
                                        <label for="brand-CIRRUS">CIRRUS</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-L.GLOBAL" value="16" checked>
                                        <label for="brand-L.GLOBAL">LGLOBAL</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-One Way" value="17" checked>
                                        <label for="brand-One Way">One Way</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardBrandCheckBox" id="brand-UPI" value="18" checked>
                                        <label for="brand-UPI">UPI</label>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </section>

                    <section class="result_1gDkk">


                        <ul class="cards_1g3qf">
                            <li id="bestCardList">
                            	<!-- <div class="wrap_133Wz" style="padding: 100px 0px;">
                            		::before
                            		"추천결과가 없습니다."
                            		<br>
                            		"필터를 수정해서 나에게 꼭 맞는 카드를 찾아보세요!"
                            	</div> -->
                            
                                <div>
                                    <section class="head_32_Bt">
                                        <img src="./kb_logo.png" alt="국민" class="ci_1S1GK">
                                        <span class="type_m6TmM">체크</span>
                                        <h4 class="name_3a6il">가온 올포인트 체크카드</h4>
                                        <ul class="flags_1yNE6"></ul>
                                    </section>
                                    <section class="body_3KEVG">
                                        <a href="#" class="link_3xWeu">
                                            <div class="landscapeImage_2Sb7P">
                                                <img src="./card.png" style="width: 126px;">
                                            </div>
                                            <div class="firstRank_3qtsX rank_QfBue">1</div>
                                        </a>
                                        <dl class="benefits_168iJ">
                                            <dt>할인</dt>
                                            <dd>0원</dd>
                                            <dt>적립</dt>
                                            <dd>2,000점</dd>
                                            <dt>연회비</dt>
                                            <dd>0원</dd>
                                            <dt class="result_3Oxxn">월 혜택</dt>
                                            <dd class="result_3Oxxn">2,000원</dd>
                                        </dl>
                                        <div class="buttons_2yqfU">
                                            <a href="#" class="button_uLc_T">상세보기</a>
                                            <button class="button_uLc_T filled_1doK6">카드신청</button>
                                        </div>
                                    </section>
                                </div>
                            </li>
                        </ul>

                    </section>
                </div>
            </div>


        </div>
    </div>
</div>

<script>

    let cardType = [];
    let cardData = new Object();

    let beforeValue = '';
    $(document).ready(function() {


        beforeValue = ${RST_CD};


        //전으로부터 키가 제대로 가져와야 입력.
        if(beforeValue =='0' || beforeValue == '1') {

            cardData = ${obj};

            //처음에 카드 선택값 주어주기
            if(cardData.Arr_cardTypeName.length >0) {


                for(var i=0; i < cardData.Arr_cardTypeName.length; i++) {

                    if(cardData.Arr_cardTypeName[i] ==='신용') {
                        $('#card_types-1').prop('checked', true);
                    }
                    else if(cardData.Arr_cardTypeName[i] ==='체크') {
                        $('#card_types-0').prop('checked', true);
                    }
                    else if(cardData.Arr_cardTypeName[i] ==='하이브리드') {
                        $('#card_types-2').prop('checked', true);
                    }

                }
            }


            //카드사 확인하기
            $('input[name=cardCompanyCheckBox]:checked').each(function(idx, val) {

                cardCompany.push($(this).val());
                //Arr_cardTypeName.push($(this).val());

            });

            //카드 브랜드 확인하기
            $('input[name=cardBrandCheckBox]:checked').each(function(idx, val) {

                cardBrand.push($(this).val());
                //Arr_cardTypeName.push($(this).val());

            });

            if(beforeValue == '1') {
                cardData.pstMst = ${keyValue};
            }
			
            if (cardData.cardPointSel === 1){
            	$("#benefit_group-mileage").prop('checked', true); // 선택하기
            	$("#benefit_group-discount").prop('checked', false); // 선택하기
            	selectCardPointSel(1);
			} else if(cardData.cardPointSel === 2){
				selectCardPointSel(2);
			}

            //카드 타입 넣기
        }
        selectList();

    });
    
    function selectCardPointSel(cardPointSel){
    	cardData.cardPointSel = cardPointSel;
    	selectList();
    }

    function selectList() {


        let URL = '';



        if(cardType.length> 0) {
            cardData.Arr_cardTypeName = cardType;
        }

        if(cardCompany.length > 0) {
            cardData.Arr_cardCompanyName = cardCompany;
        }

        if(cardBrand.length > 0) {
            cardData.Arr_BrandName = cardBrand;
        }

        if(cardData.cardPointSel == 1) {
			URL = '${pageContext.request.contextPath}/user/best/SelectMileageList.ajax';
        }
        else if(cardData.cardPointSel == 2) {
            URL = '${pageContext.request.contextPath}/user/best/SelectcardList.ajax';
        } else {

        }

        //이전에 값이 있었을 경우
        if(beforeValue =='1') {

            let arr_key = new Array();
            let arr_value = new Array();
            for(const [key, value] of Object.entries(cardData.pstMst)) {

                arr_key.push(key);
                arr_value.push(value);
            }

            cardData.arrPriceName = arr_key;
            cardData.arrPriceValue = arr_value;

        }
		console.log(cardData);

        $.ajax({
            url :URL,
            type : 'post',
            data : cardData,
            dataType : 'json',
            success : function (data) {

                let str_arr = '';

                if(data.result != undefined){
                	 for(var i=0; i<data.result.length; i++) {

                         let cardResult = data.result[i];


                         str_arr +='<div>';
                         str_arr +='<section class="head_32_Bt">';
                         //str_arr +='<img src="" alt="국민" class="ci_1S1GK">';
                         str_arr += '<span class="cardList3f">'+cardResult.cardCompanyName+'</span>';

                         str_arr +='<span class="type_m6TmM">';
                         str_arr += cardResult.cardTypeName;
                         str_arr +='</span>';
                         str_arr +='<h4 class="name_3a6il">'+cardResult.cardName+'</h4>';
                         str_arr +='<ul class="flags_1yNE6"></ul>';
                         str_arr +='</section>';
                         str_arr +='<section class="body_3KEVG">';
                         str_arr += '<a href="#" class="link_3xWeu">';
                         str_arr += '<div class="landscapeImage_2Sb7P">';
                         str_arr += '<img src="${pageContext.request.contextPath}/card/'+cardResult.cardImage+'" style="width: 126px;">';
                         str_arr += '</div>';
                         str_arr += '<div class="firstRank_3qtsX rank_QfBue">1</div>';
                         str_arr += '</a>';

                         str_arr += '<dl class="benefits_168iJ">';
                         /*str_arr += '<dt>할인</dt>';
                         str_arr += '<dd>0원</dd>';
                         str_arr += '<dt>적립</dt>';
                         str_arr += '<dd>2,000점</dd>';
                         str_arr += '<dt>연회비</dt>';
                         str_arr += '<dd>0원</dd>';*/
                         str_arr += '<dt class="result_3Oxxn">월 혜택</dt>';
                         str_arr += '<dd class="result_3Oxxn">'+cardResult.cardMoneyValue.toLocaleString()+'원</dd>';
                         str_arr += '</dl>';

                         str_arr += '<div class="buttons_2yqfU">';
                         str_arr += '<a href="javascript:fn_cardDetail(\''+cardResult.cardSeq+'\')" class="button_uLc_T">상세보기</a>';
                         str_arr += '<button class="button_uLc_T filled_1doK6">카드신청</button>';
                         str_arr += '</div>';
                         str_arr += '</section>';
                         str_arr += '</div>';
                         //id=bestCardList
                     }
                }else{
                	str_arr = '<div class="wrap_13JWz" style="padding: 100px 0px;">';
                	str_arr += '<img src="${pageContext.request.contextPath}/Magnifier.png" style="width: 100px;"><br>';
                	str_arr += '"추천 결과가 없습니다."';
                	str_arr += '<br>';
                	str_arr += '"필터를 수정해서 나에게 꼭 맞는 카드를 찾아보세요!"';
                	str_arr += '</div>';
                }
               
                $('#bestCardList').html(str_arr);
            }
        })
    }


    //카드타입 전체 체크
    $('#cardTypeAll').click(function() {

        let idx = 0;
        $('input[name="cardTypeCheckBox"]:checked').each(function() {

            idx++;
        });


        if(idx === 3) {
            $("input[name=cardTypeCheckBox]").prop("checked", false);
        }

        else {
            $("input[name=cardTypeCheckBox]").prop("checked", true);

        }

        cardTypeChange();

    });


    //카드 타입 변경하기(신용, 하이브리드, 체크)
    $('input[name="cardTypeCheckBox"]').click(function() {

        cardTypeChange();
    });

    function cardTypeChange() {


        cardType = [];
        $('input[name="cardTypeCheckBox"]:checked').each(function(idx, val) {

            cardType.push($(this).val());
            //Arr_cardTypeName.push($(this).val());

        });

		if (cardType.length == 0) {
			let str = '<div class="wrap_13JWz" style="padding: 100px 0px;">';
			str += '<img src="${pageContext.request.contextPath}/Magnifier.png" style="width: 100px;"><br>';
			str += '"추천 결과가 없습니다."';
			str += '<br>';
			str += '"필터를 수정해서 나에게 꼭 맞는 카드를 찾아보세요!"';
			str += '</div>';
 
			$('#bestCardList').html(str);
		}

        if(cardType.length > 0) {
            selectList();
        }
    }



    //카드 사 전체 체크
    $('#cardCompanyAllCheck').click(function() {

        let idx = 0;
        $('input[name=cardCompanyCheckBox]:checked').each(function() {
            idx++;
        })

        if(idx === 10) {
            $("input[name=cardCompanyCheckBox]").prop("checked", false);
        }

        else {
            $("input[name=cardCompanyCheckBox]").prop("checked", true);

        }

        cardCompanyChange();
    })

    //카드 일부가 변경되었을 경우
    $('input[name=cardCompanyCheckBox]').click(function() {

        cardCompanyChange();
    });

    //변경이 되었을 경우 실행
    let cardCompany = new Array();
    function cardCompanyChange() {


        cardCompany = [];
        $('input[name=cardCompanyCheckBox]:checked').each(function(idx, val) {

            cardCompany.push($(this).val());
            //Arr_cardTypeName.push($(this).val());

        });
        
        if (cardCompany.length == 0) {
			let str = '<div class="wrap_13JWz" style="padding: 100px 0px;">';
			str += '<img src="${pageContext.request.contextPath}/Magnifier.png" style="width: 100px;"><br>';
			str += '"추천 결과가 없습니다."';
			str += '<br>';
			str += '"필터를 수정해서 나에게 꼭 맞는 카드를 찾아보세요!"';
			str += '</div>';
 
			$('#bestCardList').html(str);
		}

        if(cardCompany.length > 0) {
            selectList();
        }
    }


    //카드 브랜드 전체 체크
    $('#cardBrandAllCheck').click(function() {

        let idx = 0;
        $('input[name=cardBrandCheckBox]:checked').each(function() {
            idx++;
        })

        if(idx === 18) {
            $("input[name=cardBrandCheckBox]").prop("checked", false);
        }

        else {
            $("input[name=cardBrandCheckBox]").prop("checked", true);

        }

        cardBrandChange();
    })

    //카드 브랜드가 변경되었을때
    $('input[name=cardBrandCheckBox]').click(function() {

        cardBrandChange();
    });

    //변경이 되었을 경우 실행
    let cardBrand = new Array();
    function cardBrandChange() {


        cardBrand = [];
        $('input[name=cardBrandCheckBox]:checked').each(function(idx, val) {

            cardBrand.push($(this).val());

        });

        if (cardBrand.length == 0) {
			let str = '<div class="wrap_13JWz" style="padding: 100px 0px;">';
			str += '<img src="${pageContext.request.contextPath}/Magnifier.png" style="width: 100px;"><br>';
			str += '"추천 결과가 없습니다."';
			str += '<br>';
			str += '"필터를 수정해서 나에게 꼭 맞는 카드를 찾아보세요!"';
			str += '</div>';
 
			$('#bestCardList').html(str);
		}

        if(cardBrand.length > 0) {
            selectList();
        }
    }


    function fn_cardDetail(seq) {

        let objStr = JSON.stringify(cardData.pstMst);

        console.log(cardData);

        location.href='${pageContext.request.contextPath}/user/card_detail.do?seq='+seq+'&mst='+encodeURI(objStr)+'&cardMoneyValue='+cardData.cardMoneyValue;
    }
</script>
</body>
</html>