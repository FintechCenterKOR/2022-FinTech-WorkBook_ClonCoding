<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>카드 상세보기</title>

    <!-- <link rel="stylesheet" href="./user.css" /> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css" />
</head>

<body>

    <section class="cover_s55z6">
        <div class="container_qYBky">
            <h3 class="type_3m91o">
                <span>신한카드</span>
                <span>
                    체크카드
                </span>
            </h3>
            <img src="${pageContext.request.contextPath}/card/2022년11월07일10시03분48초_카드4.png" class="landscapeImage_38GUs">
            <h1 class="name_3VjZR">
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
                            월 혜택 30,000원에서 연회비 차감후
                            <span class="wrap_1HOs_">
                                <span class="summaryQuestion_3iHCf">
                                    연회비 계산법
                                </span>
                                <span class="arrow_k8Utp" style="left:-20px; top:14px"></span>
                                <span class="message_1Ue12" style="left: -135px; top:10px;">연회비 15,000원 1개월 분인 1,250원 차감</span>
                            </span>
                        </span>
                        <strong class="summaryTotal_INX9j">28,750원</strong>
                    </section>
                    <section class="recommend_2E5cm">
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
                    </section>
                    <section class="calculation_38Lvq">
                        <h5 class="calculationTitle_iyh_C">
                            월 혜택에 반영된 소비내역
                            <b>
                                입력한 1 건중 1 건
                            </b>
                        </h5>
                        <ul class="calculationList_3GTqF">
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
                                    <span class="mileage_2WTqR">0마일</span>
                                </label>
                                <ul class="profits_39kWj">
                                    <li>
                                        <strong class="profitTitle_2YxhM">일반가맹점 2% 마이신한 포인트 적립</strong>
                                        <span class="profitCond_3Bhfs">지난 달 카드 1,500,000원 이상 사용 시</span>
                                    </li>
                                </ul>
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
</body>
</html>