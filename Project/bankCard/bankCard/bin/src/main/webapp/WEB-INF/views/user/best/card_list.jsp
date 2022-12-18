<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-11-01
  Time: 오후 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css" />
    <!-- <link rel="stylesheet" href="../assets/css/user.css" /> -->

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/metisMenu.min.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/common-ui.js"></script>

</head>
<body style="height: auto; overflow: visible;">

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
                <div class="container_3FVpE">
                    <a href="/" class="bi_qs1LR"></a>
                    <h1>뱅크셀러드</h1>
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
                <h3 class="head_1kEDv">
                    입력하신
                    <strong>1,000,000원</strong>
                    의 소비로
                    <br>
                    가장 많은 혜택을 받을 수 있는 카드를 찾았어요!
                </h3>
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
                                        <input type="checkbox" name="cardTypeCheckBox" id="card_types-1" value="신용" checked>
                                        <label for="card_types-1">신용</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardTypeCheckBox" id="card_types-0" value="체크" checked>
                                        <label for="card_types-0">체크</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" name="cardTypeCheckBox" id="card_types-2" value="하이브리드" checked>
                                        <label for="card_types-2">하이브리드</label>
                                    </li>
                                </ul>
                                <h5 class="title_XmGna">혜택 종류</h5>
                                <ul class="tabs_1VQ6k">
                                    <li>
                                        <input type="radio" id="benefit_group-discount" name="benefit_group" checked>
                                        <label for="benefit_group-discount">할인/적립</label>
                                    </li>
                                    <li>
                                        <input type="radio" id="benefit_group-mileage" name="benefit_group">
                                        <label for="benefit_group-mileage">항공마일</label>
                                    </li>
                                </ul>


                                <h5 class="title_XmGna">
                                    연회비
                                </h5>

                                <div>
                                    <section class="texts_1enJM">
                                        <span class="min_3wWaG">0원</span>
                                        <span class="max_EqXFd">50,000원</span>
                                    </section>

                                    <section class="bar_1vf2E">
                                        <div class="sticks_Knwpd">
                                            <span style="left: 0%;"></span>
                                            <span style="left: 20%;"></span>
                                            <span style="left: 40%;"></span>
                                            <span style="left: 60%;"></span>
                                            <span style="left: 80%;"></span>
                                            <span style="left: 100%;"></span>
                                        </div>
                                        <div class="active_2AseH">
                                            <span class="range_71eNb" style="left:0%; width: 60%;"></span>
                                            <button class="min_3wWaG" style="left : 0%;">연회비 최소 0원</button>
                                            <button class="max_EqXFd" style="left:60%;">연회비 최대 50000원</button>
                                        </div>
                                    </section>
                                </div>

                                <ul class="checks_3avrQ event_2Vd1l">
                                    <li>
                                        <input type="checkbox" id="promotion-annual_cost">
                                        <label for="promotion-annual_cost" class="eventLabel_1i-Lt">
                                            연회비 지원상품만 보기
                                        </label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="free-interest-fee">
                                        <label for="free-interest-fee">전가맹점 무이자할부 카드만 보기</label>
                                    </li>
                                </ul>

                                <h5 class="title_XmGna">카드사
                                    <button class="all_1idVF">전체</button>
                                </h5>
                                <ul class="checks_3avrQ">
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-shinhan" checked>
                                        <label for="company-shinhan">신한</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-hyundai">
                                        <label for="company-hyundai">현대</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-ibk">
                                        <label for="company-ibk">IBK기업</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-kb">
                                        <label for="company-kb">KB국민</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-lotte">
                                        <label for="company-lotte">롯데</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-samsung">
                                        <label for="company-samsung">삼성</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-sk">
                                        <label for="company-sk">하나</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-woori">
                                        <label for="company-woori">우리</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-bc">
                                        <label for="company-bc">BC바로</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="company-hyundai_department_store">
                                        <label for="company-hyundai_department_store">현대백화점</label>
                                    </li>

                                </ul>

                                <h5 class="title_XmGna">
                                    브랜드
                                    <button class="all_1idVF">전체</button>
                                </h5>
                                <ul class="checks_3avrQ">
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-국내전용" checked>
                                        <label for="brand-국내전용">국내전용</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-VISA" checked>
                                        <label for="brand-VISA">VISA</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-MASTER" checked>
                                        <label for="brand-MASTER">MASTER</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-MAESTRO" checked>
                                        <label for="brand-MAESTRO">MAESTRO</label>
                                    </li>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-AMEX" checked>
                                        <label for="brand-AMEX">AMEX</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-UNION PAY" checked>
                                        <label for="brand-UNION PAY">UNION PAY</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-BC Global" checked>
                                        <label for="brand-BC Global">BC Global</label>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-BC" checked>
                                        <label for="brand-BC">BC</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-URS" checked>
                                        <label for="brand-URS">URS</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-JCB" checked>
                                        <label for="brand-JCB">JCB</label>
                                    </li>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-K-World" checked>
                                        <label for="brand-K-World">K-World</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-채움" checked>
                                        <label for="brand-채움">채움</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-S&" checked>
                                        <label for="brand-S&">S&</label>
                                    </li>

                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-DINERS" checked>
                                        <label for="brand-DINERS">DINERS</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-CIRRUS" checked>
                                        <label for="brand-CIRRUS">CIRRUS</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-L.GLOBAL" checked>
                                        <label for="brand-L.GLOBAL">LGLOBAL</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-One Way" checked>
                                        <label for="brand-One Way">One Way</label>
                                    </li>
                                    <li class="half_1Pugz">
                                        <input type="checkbox" id="brand-UPI" checked>
                                        <label for="brand-UPI">UPI</label>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </section>

                    <section class="result_1gDkk">
                        <div class="compare_3Y6q2">
                            <div class="compareContainer_xWyq8">
                                <div class="wrap_2dE29">
                                    <button class="button_g2k_6">
                                        <div class="card_3I94S">카드선택</div>
                                        <div class="desc_2uHdy">
                                            <h5>지금 쓰고 있는 내 카드의 혜택은?</h5>
                                            <p> 내 카드 VS 추천카드, 혜택을 비교하세요.</p>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <ul class="cards_1g3qf">
                            <li id="bestCardList">
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

    let cardType = '';
    let cardData = new Object();

    let beforeValue = '';
    $(document).ready(function() {


        beforeValue = ${RST_CD};
        console.log('RST_cd = '+ beforeValue);


        //전으로부터 키가 제대로 가져와야 입력.
        if(beforeValue =='0' || beforeValue == '1') {

            cardData = ${obj};


            if(beforeValue == '1') {
                cardData.pstMst = ${keyValue};
            }
            console.log(cardData);

            //카드 타입 넣기
        }
        selectList();

    });

    function selectList() {

        console.log('selectList 실행');

        let URL = '';


        console.log(cardData);

        //카드타입이 1개 이상일 경우.
        if(cardData.Arr_cardTypeName.length > 0) {
            cardData.cardTypeName=  cardType;
        }

        //카드 타입이 없는 경우.
        else {
            return false;
        }


        if(cardData.cardPointSel == 1) {

            console.log('아직 없음');
        }
        else if(cardData.cardPointSel == 2) {
            URL = '${pageContext.request.contextPath}/user/best/SelectcardList.ajax';
        } else {

        }

        //이전에 값이 있었을 경우
        if(beforeValue =='1') {
            console.log('담기');
            console.log(cardData);
            console.log('=================');

            let arr_key = new Array();
            let arr_value = new Array();
            console.log(cardData.pstMst);
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
               console.log(data);

               let str_arr = '';

               for(var i=0; i<data.result.length; i++) {

                   let cardResult = data.result[i];


                   str_arr +='<div>';
                   str_arr +='<section class="head_32_Bt">';
                   str_arr +='<img src="" alt="국민" class="ci_1S1GK">';

                   str_arr +='<span class="type_m6TmM">';
                   if(cardResult.card_type_seq == 1) {
                       str_arr +='신용';
                   } else if(cardResult.card_type_seq === 2) {
                       str_arr +='체크';
                   } else {
                       str_arr += '하이브리드';
                   }
                   str_arr +='</span>';
                   str_arr +='<h4 class="name_3a6il">가온 올포인트 체크카드</h4>';
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
                   str_arr += '<dt>할인</dt>';
                   str_arr += '<dd>0원</dd>';
                   str_arr += '<dt>적립</dt>';
                   str_arr += '<dd>2,000점</dd>';
                   str_arr += '<dt>연회비</dt>';
                   str_arr += '<dd>0원</dd>';
                   str_arr += '<dt class="result_3Oxxn">월 혜택</dt>';
                   str_arr += '<dd class="result_3Oxxn">2,000원</dd>';
                   str_arr += '</dl>';

                   str_arr += '<div class="buttons_2yqfU">';
                   str_arr += '<a href="#" class="button_uLc_T">상세보기</a>';
                   str_arr += '<button class="button_uLc_T filled_1doK6">카드신청</button>';
                   str_arr += '</div>';
                   str_arr += '</section>';
                   str_arr += '</div>';
                   //id=bestCardList
               }
                $('#bestCardList').html(str_arr);
            }
        })
    }

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

        cardType = '';
        $('input[name="cardTypeCheckBox"]:checked').each(function(idx, val) {

            cardType.push($(this).val());

        });

        if(cardType.length > 1) {
            selectList();
        }
    }
</script>
</body>
</html>