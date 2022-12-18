<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>카드 상세보기</title>

    <!-- <link rel="stylesheet" href="./user.css" /> -->
    <link rel="styleSheet" href="${pageContext.request.contextPath}/assets/css/main.css" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="styleSheet" href="${pageContext.request.contextPath}/assets/css/user.css" >

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/metisMenu.min.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/common-ui.js"></script>

</head>

<body>
<header>
    <div class="wrap_1X6t">

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
    <section class="cover_s55z6">
        <div class="container_qYBky">
            <h3 class="type_3m91o">
                <span id="cardCompanyName"></span>
                <span id="cardTypeName"></span>
            </h3>
            <img id="cardImage" class="landscapeImage_38GUs">
            <h1 class="name_3VjZR" id="cardName">
                신한 Hi-Point 카드
            </h1>
            <p class="desc_3SaCO">포인트! 백화점 상품권으로 돌려받자! 포인트최고5%적립</p>
            <div class="issueButtons_2jw-3">
                <button class="issueOnline_EvF4G issueButton_37i-7">온라인 신청</button>
                <button class="issueCall_rhkm0 issueButton_37i-7">전화 신청</button>
            </div>
        </div>
    </section>
    <section>
        <div class="container_qYBky"></div>
    </section>
    <section class="wrap_ibomw">
        <div class="container_qYBky">
            <div class="box_2nZJx">
                <ul class="tab_3qDVM">
                    <li class="activeTab_3xVMY" style="width:50%">
                        <button class="tabButton_174so">예상 월혜택</button>
                    </li>
                    <li style="width:50%;">
                    <button class="tabButton_174so">카드 정보</button>
                </li>
                </ul>
                <div>
                    <section class="summary_2yjca">
                        <span class="summaryCalculation_1OQa_">
                            월 혜택
                        </span>
                        <strong class="summaryTotal_INX9j" id="cardMonthMoney">28,750원</strong>
                    </section>
                    <%--<section class="recommend_2E5cm">
                        <span class="recommendMessage_2pm-u">
                            <span>
                                카드만 바꿔도,
                            </br>
                            연간
                            <b>
                                약345,000원의 혜택
                            </b>
                            을 받으시겠네요!
                            </span>
                        </span>
                    </section>--%>
                    <section class="calculation_38Lvq">
                        <h5 class="calculationTitle_iyh_C">
                            월 혜택에 반영된 소비내역
                            <b>
                                입력한 1 건중 1 건
                            </b>
                        </h5>
                        <ul class="calculationList_3GTqF" id="cardValueList">
                            <li class="total_3odGB">
                                <span class="expense_BpgfU">
                                    1,500,000원
                                </span>
                                <span class="discount_2y91Y">
                                    <span class="active_3nF0Q">0원</span>
                                </span>
                                <span class="point_1-kxM">
                                    <span class="active_3nF0Q">30,000원</span>
                                </span>
                                <span class="mileage_2WTqR">
                                    <span class="etc_tWDi4">0마일</span>
                                </span>
                            </li>
                            <li>
                                <input type="checkbox" id="profits-0">
                                <label for="profits-0">
                                    <span class="store_ywLxX">일반가맹점</span>
                                    <span class="expense_BpgfU">
                                        <span>1,500,000원</span>
                                    </span>
                                    <span class="discount_2y91Y">
                                        <span class="active_3nF0Q">0원</span>
                                    </span>
                                    <span class="point_1-kxM">
                                        30,000점
                                    </span>
                                    <%--<span class="mileage_2WTqR">0마일</span>--%>
                                </label>
                            </li>
                        </ul>
                    </section>
                    <div class="buttons_2BM3f">
                        <a href="#" class="main_2coZT">
                            <button class="issue_1UqsK">해당 카드사로 이동</button>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </section>

<script>

    $(document).ready(function() {
        CardDetail();
    });

    let cardSeq = ${seq};                   //상세보기 카드 값
    let obj = ${mst};                       //사용자 선택 값
    let cardMoneyValue = ${cardMoneyValue}; //월 사용액

    let str_arr = '';   //결과값

    function CardDetail() {

        let URL = '${pageContext.request.contextPath}/user/best/cardDetail.ajax';
        $.ajax({
           url : URL,
            type : 'post',
            data : {'cardSeq' : cardSeq},
            dataType : 'json',
            success : function (data) {
               console.log(data);

                if(data.RST_CD === 0) {

                    //카드사 이름
                    const cardCompanyName = data.result.cardCompanyName;
                    $('#cardCompanyName').html(cardCompanyName+'카드');

                    //카드타입 이름
                    const cardTypeName = data.result.cardTypeName;
                    $('#cardTypeName').html(cardTypeName+'카드');

                    //카드 이미지 넣기
                    const cardImage = data.result.cardImage;
                    $('#cardImage').prop("src", '${pageContext.request.contextPath}/card/'+cardImage);


                    const cardName = data.result.cardName;
                    $('#cardName').html(cardName+' 카드');


                    //카드 타입 종류
                    const cardPointSel = data.result.cardPointSel;
                    if(cardPointSel === 1) {
                        fn_cardMileage();
                    }
                    else if(cardPointSel === 2) {
                        fn_cardBenefit();
                    }

                }


            }
        });
    }

    //카드 적립 기능
    function fn_cardBenefit() {

        let cardData = new Object();
        cardData.cardSeq = cardSeq;

        let arr_key = new Array();
        let arr_value = new Array();
        for(const [key, value] of Object.entries(obj)) {

            arr_key.push(key);
            arr_value.push(value);
        }

        cardData.arrPriceName = arr_key;
        cardData.arrPriceValue = arr_value;

        let URL = '${pageContext.request.contextPath}/user/best/cardPoint.ajax';

        $.ajax({
            url : URL,
            type : 'post',
            data : cardData,
            dataType: 'json',
            success : function(data) {
                console.log(data);

                str_arr+='<li class="total_3odGB">';
                str_arr+='<span class="expense_BpgfU">';
                str_arr+=cardMoneyValue.toLocaleString()+'원';
                str_arr+='</span>';
                str_arr+='<span class="point_1-kxM">';
                str_arr+='<span class="active_3nF0Q">'+data.totalPrice+'원</span>';
                str_arr+='</span>';
                str_arr+='</li>';

                for(var i =0; i < data.list.length; i++) {

                    let list = data.list[i];

                    str_arr+='<li>';
                    str_arr+='<input type="checkbox" id="profits-0">';
                    str_arr+='<label for="profits-0">';
                    str_arr+='<span class="store_ywLxX">'+list.placeName+'</span>';
                    str_arr+='<span class="expense_BpgfU">';
                    str_arr+='<span>'+list.cardPrice.toLocaleString()+'원</span>';
                    str_arr+='</span>';
                    str_arr+='<span class="discount_2y91Y">';
                    str_arr+='<span class="active_3nF0Q">'+list.cardSale.toLocaleString()+'원</span>';
                    str_arr+='</span>';
                    str_arr+='</label>';
                    str_arr+='</li>';
                }

                $('#cardMonthMoney').html(data.totalPrice.toLocaleString()+'원');
                $('#cardValueList').html(str_arr);
            }
        });
    }


    //카드 마일리지 기능
    function fn_cardMileage() {

        let cardData = new Object();
        cardData.cardSeq = cardSeq;

        let arr_key = new Array();
        let arr_value = new Array();

        //소비자가 사용된 브랜드 리스트를 한 바퀴 돌린다.
        //전체 금액에서 소비자가 사용한 금액만큼 - 한다.
        for(const [key, value] of Object.entries(obj)) {

            cardMoneyValue-=value;
        }

        cardData.cardMoneyValue = cardMoneyValue;

        let URL = '${pageContext.request.contextPath}/user/best/cardMileage.ajax';

        $.ajax({
            url : URL,
            type : 'post',
            data : cardData,
            dataType: 'json',
            success : function(data) {
                console.log(data);

                let result = data.result;

                str_arr+='<li class="total_3odGB">';
                str_arr+='<span class="expense_BpgfU">';
                str_arr+=cardMoneyValue.toLocaleString()+'원';
                str_arr+='</span>';
                str_arr+='<span class="mileage_2WTqR">';
                str_arr+='<span class="etc_tWDi4">'+result.cardMoneyValue.toLocaleString()+'마일</span>';
                str_arr+='</span>';
                str_arr+='</li>';




                str_arr+='<li>';
                str_arr+='<input type="checkbox" id="profits-0">';
                str_arr+='<label for="profits-0">';
                str_arr+='<span class="store_ywLxX">항공 마일리지</span>';
                str_arr+='<span class="expense_BpgfU">';
                str_arr+='<span>'+cardMoneyValue.toLocaleString()+'원</span>';
                str_arr+='</span>';
                str_arr+='<span class="mileage_2WTqR">'+result.cardMoneyValue.toLocaleString()+'마일</span>';
                str_arr+='</span>';
                str_arr+='</label>';
                str_arr+='</li>';

                $('#cardMonthMoney').html(result.cardMoneyValue.toLocaleString()+'마일');
                $('#cardValueList').html(str_arr);
            }
        });
    }


</script>

</body>
</html>