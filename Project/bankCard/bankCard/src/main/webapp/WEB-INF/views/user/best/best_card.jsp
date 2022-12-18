<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-10-21
  Time: 오전 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>

    <link rel="styleSheet" href="${pageContext.request.contextPath}/assets/css/main.css" >
    <link rel="styleSheet" href="${pageContext.request.contextPath}/assets/css/user.css" >

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/metisMenu.min.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/common-ui.js"></script>
</head>
<body>
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
<div class="wrap_1X6t">



    <DIV class="wrap_1JcE-">
        <div class="container_3PD-f">
            <div class="container_3m_kA">
                <div class="question_1wxEH">
                    <span class="tag_2Ltsy">기본</span>
                    필수 입력 항목입니다.
                </div>
                <dl class="form_o-kDL">

                    <!-- 카드 선택-->
                    <dt class="essential_23bSY">
                        어떤 카드를 찾으세요?
                    </dt>
                    <dd>
                        <ul class="wrap_2Gh59">
                            <li>
                                <input type="checkbox" name="checkboxCard" id="form-card-type-credit" value="신용">
                                <label for="form-card-type-credit">신용</label>
                            </li>
                            <li>
                                <input type="checkbox" name="checkboxCard" id="form-card-type-check" value="체크">
                                <label for="form-card-type-check">체크</label>
                            </li>
                            <li>
                                <input type="checkbox" name="checkboxCard" id="form-card-type-hybrid" value="하이브리드">
                                <label for="form-card-type-hybrid">하이브리드</label>
                            </li>
                        </ul>
                    </dd>


                    <!-- 혜택 선택-->
                    <dt class="essential_23bSY">어떤 혜택을 선호하세요?</dt>
                    <dd>
                        <ul class="wrap_2eCTW">
                            <li>
                                <input type="radio" name="form-card-benefit-type" id="form-card-benefit-type-discount" value="discount">
                                <label for="form-card-benefit-type-discount">할인/적립</label>
                            </li>
                            <li>
                                <input type="radio"  name="form-card-benefit-type" id="form-card-benefit-type-mileage" value="mileage">
                                <label for="form-card-benefit-type-mileage">항공마일리지</label>
                            </li>
                        </ul>
                    </dd>

                    <!-- 카드 평균 사용량 -->
                    <dt class="essential_23bSY">
                        카드로 월 평균 얼마나 사용하세요?
                    </dt>
                    <dd>
                        <div>
                            <div class="amount_3sIVH">
                                    <span class="desktop_1HAhS">
                                        <div class="wrap_M4OpS">
                                            <input type="text" class="input_3Pz_8" style="color: rgb(4, 197, 132); font-size: 20px; text-align: right;">
                                            <span class="show_28yFC" id="cardMoney" style="color:rgb(4, 197, 132); font-size : 20px; text-align:right;"></span>
                                        </div>
                                    </span>
                                <span class="amountCurrency_1OwBP">원</span>
                                <button class="amountClear_TPmfy">초기화</button>
                            </div>

                            <ul class="preset_1AfWO">
                                <li>
                                    <button class="tag_1jHZn" onclick="cardMoney('50')">50만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn" onclick="cardMoney('70')">70만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn" onclick="cardMoney('100')">100만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn" onclick="cardMoney('150')">150만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn" onclick="cardMoney('200')">200만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn" onclick="cardMoney('500')">500만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn" onclick="cardMoney('1000')">1000만</button>
                                </li>
                            </ul>
                        </div>
                    </dd>
                </dl>



                <!-- 개인화 -->
                <div class="question_1wxEH">
                    <div class="tag_2Ltsy">개인화</div>
                    정확한 추천을 위한 소비패턴 입력항목입니다
                </div>


                <div class="navigation_1DQSV">
                    <!-- <div class="wrap_TxlGm">
                        <input type="checkbox" id="card-store-category" class="trigger_24nWK">
                        <label for="card-store-category" class="label_3yqyn">업종카테고리 > 인기업종</label>
                    </div> -->

                    <!--카테고리-->
                    <section class="menu_AC_Fh">
                        <button class="search_3Yx9K">업종/가맹점 검색</button>
                        <div class="container_2dq5y">
                            <h5 class="title_2cSEI">업종 카테고리</h5>
                            <ul class="categories_1kxJt">
                                <!-- 목록 불러오기 -->
                                <ul class="categories_1kxJt" id="sidePlaceGroupList">
                                    <%--<li>
                                        <button class="button_iMgjC active_5i2qc">인기업종 TOP30</button>
                                    </li>
                                    <li>
                                        <button class="button_iMgjC">교통/통신</button>
                                    </li>--%>
                                </ul>
                            </ul>
                        </div>
                    </section>
                </div>

                <div class="spendings_1tm6k">
                    <ul class="groups_Jm6eo" id="placeGroupList">

                        <!-- <li>
                            <h5 class="groupTitle_8Xfpg">대중교통</h5>
                            <div class="group_3VAkz">
                                <div class="wrap_2rJPy">
                                    <ul class="stores_1ggw8" id="placeGroup1">
                                        <li>
                                            <div class="wrap_pykfR">
                                                <span class="name_2H_ss">카카오 T 택시</span>
                                                <span class="amount_28STO">월 50,000원</span>
                                                <img src="./image/mollangpiu.jpg" class="image_1rmXk">
                                                <div class="keypad_1m-SK" style="display:block">
                                                    <div class="keypadInput_3zTbE">
                                                        <div class="wrap_M4OpS">
                                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">
                                                            <span class="show_28yFC"  style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>
                                                        </div>
                                                    </div>

                                                    <ul class="preset_1RR5I">
                                                        <li>
                                                            <button class="cancel_1TwbQ">취소</button>
                                                        </li>
                                                        <li>
                                                            <button>10만원</button>
                                                        </li>
                                                        <li>
                                                            <button>20만원</button>
                                                        </li>
                                                        <li>
                                                            <button>30만원</button>
                                                        </li>
                                                        <li>
                                                            <button>50만원</button>
                                                        </li>
                                                        <li>
                                                            <button>70만원</button>
                                                        </li>
                                                        <li>
                                                            <button>100만원</button>
                                                        </li>
                                                        <li>
                                                            <button>150만원</button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="wrap_pykfR">
                                                <span class="name_2H_ss">버스</span>
                                                <span class="amount_28STO">월 50,000원</span>
                                                <img src="./image/mollangpiu.jpg" class="image_1rmXk">
                                                <div class="keypad_1m-SK" style="display:none">
                                                    <div class="keypadInput_3zTbE">
                                                        <div class="wrap_M4OpS">
                                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">
                                                            <span class="show_28yFC"  style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>
                                                        </div>
                                                    </div>

                                                    <ul class="preset_1RR5I">
                                                        <li>
                                                            <button>1만원</button>
                                                        </li>
                                                        <li>
                                                            <button>2만원</button>
                                                        </li>
                                                        <li>
                                                            <button>3만원</button>
                                                        </li>
                                                        <li>
                                                            <button>5만원</button>
                                                        </li>
                                                        <li>
                                                            <button>10만원</button>
                                                        </li>
                                                        <li>
                                                            <button>15만원</button>
                                                        </li>
                                                        <li>
                                                            <button>20만원</button>
                                                        </li>
                                                        <li>
                                                            <button>30만원</button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="wrap_pykfR">
                                                <span class="name_2H_ss">지하철</span>

                                                클릭 결과
                                                <span class="amount_28STO">월 50,000원</span>
                                                <img src="./image/mollangpiu.jpg" class="image_1rmXk">
                                                <div class="keypad_1m-SK" style="display:none">
                                                    <div class="keypadInput_3zTbE">
                                                        <div class="wrap_M4OpS">
                                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">
                                                            <span class="show_28yFC"  style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>
                                                        </div>
                                                    </div>

                                                    <ul class="preset_1RR5I">
                                                        <li>
                                                            <button>1만원</button>
                                                        </li>
                                                        <li>
                                                            <button>2만원</button>
                                                        </li>
                                                        <li>
                                                            <button>3만원</button>
                                                        </li>
                                                        <li>
                                                            <button>5만원</button>
                                                        </li>
                                                        <li>
                                                            <button>10만원</button>
                                                        </li>
                                                        <li>
                                                            <button>15만원</button>
                                                        </li>
                                                        <li>
                                                            <button>20만원</button>
                                                        </li>
                                                        <li>
                                                            <button>30만원</button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>

                                    두번째 줄
                                   <ul class="stores_1ggw8">
                                        <li>
                                            <div class="wrap_pykfR">
                                                <span class="name_2H_ss">택시</span>
                                                <span class="amount_28STO">월 50,000원</span>
                                                <img src="./image/mollangpiu.jpg" class="image_1rmXk">
                                                <div class="keypad_1m-SK" style="display:block">
                                                    <div class="keypadInput_3zTbE">
                                                        <div class="wrap_M4OpS">
                                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">
                                                            <span class="show_28yFC"  style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>
                                                        </div>
                                                    </div>

                                                    <ul class="preset_1RR5I">
                                                        <li>
                                                            <button>1만원</button>
                                                        </li>
                                                        <li>
                                                            <button>2만원</button>
                                                        </li>
                                                        <li>
                                                            <button>3만원</button>
                                                        </li>
                                                        <li>
                                                            <button>5만원</button>
                                                        </li>
                                                        <li>
                                                            <button>10만원</button>
                                                        </li>
                                                        <li>
                                                            <button>15만원</button>
                                                        </li>
                                                        <li>
                                                            <button>20만원</button>
                                                        </li>
                                                        <li>
                                                            <button>30만원</button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                    <button class="more_i6NEp">+ 가맹점 더보기(3/17)</button>

                                </div>
                            </div>
                        </li>



                        휴대폰 요금
                        <li>
                            <h5 class="groupTitle_8Xfpg">휴대폰요금</h5>
                            <div class="group_3VAkz">
                                <div class="wrap_2rJPy">
                                    <ul class="stores_1ggw8" id="placeGroup2">

                                        첫 번째 줄
                                        <li>
                                            <div class="wrap_pykfR">
                                                <span class="name_2H_ss">SK텔레콤</span>
                                                <span class="amount_28STO">월 50,000원</span>
                                                <img src="./image/mollangpiu.jpg" class="image_1rmXk">
                                                <div class="keypad_1m-SK" style="display:none">
                                                    <div class="keypadInput_3zTbE">
                                                        <div class="wrap_M4OpS">
                                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">
                                                            <span class="show_28yFC"  style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>
                                                        </div>
                                                    </div>

                                                    <ul class="preset_1RR5I">
                                                        <li>
                                                            <button>1만원</button>
                                                        </li>
                                                        <li>
                                                            <button>2만원</button>
                                                        </li>
                                                        <li>
                                                            <button>3만원</button>
                                                        </li>
                                                        <li>
                                                            <button>5만원</button>
                                                        </li>
                                                        <li>
                                                            <button>10만원</button>
                                                        </li>
                                                        <li>
                                                            <button>15만원</button>
                                                        </li>
                                                        <li>
                                                            <button>20만원</button>
                                                        </li>
                                                        <li>
                                                            <button>30만원</button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="wrap_pykfR">
                                                <span class="name_2H_ss">KT</span>
                                                <span class="amount_28STO">월 50,000원</span>
                                                <img src="./image/mollangpiu.jpg" class="image_1rmXk">
                                                <div class="keypad_1m-SK" style="display:none">
                                                    <div class="keypadInput_3zTbE">
                                                        <div class="wrap_M4OpS">
                                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">
                                                            <span class="show_28yFC"  style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>
                                                        </div>
                                                    </div>

                                                    <ul class="preset_1RR5I">
                                                        <li>
                                                            <button>1만원</button>
                                                        </li>
                                                        <li>
                                                            <button>2만원</button>
                                                        </li>
                                                        <li>
                                                            <button>3만원</button>
                                                        </li>
                                                        <li>
                                                            <button>5만원</button>
                                                        </li>
                                                        <li>
                                                            <button>10만원</button>
                                                        </li>
                                                        <li>
                                                            <button>15만원</button>
                                                        </li>
                                                        <li>
                                                            <button>20만원</button>
                                                        </li>
                                                        <li>
                                                            <button>30만원</button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="wrap_pykfR">
                                                <span class="name_2H_ss">LG유플러스</span>
                                                <span class="amount_28STO">월 50,000원</span>
                                                <img src="./image/mollangpiu.jpg" class="image_1rmXk">
                                                <div class="keypad_1m-SK" style="display:none">
                                                    <div class="keypadInput_3zTbE">
                                                        <div class="wrap_M4OpS">
                                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">
                                                            <span class="show_28yFC"  style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>
                                                        </div>
                                                    </div>

                                                    <ul class="preset_1RR5I">
                                                        <li>
                                                            <button>1만원</button>
                                                        </li>
                                                        <li>
                                                            <button>2만원</button>
                                                        </li>
                                                        <li>
                                                            <button>3만원</button>
                                                        </li>
                                                        <li>
                                                            <button>5만원</button>
                                                        </li>
                                                        <li>
                                                            <button>10만원</button>
                                                        </li>
                                                        <li>
                                                            <button>15만원</button>
                                                        </li>
                                                        <li>
                                                            <button>20만원</button>
                                                        </li>
                                                        <li>
                                                            <button>30만원</button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <button class="more_i6NEp">+ 가맹점 더보기(3/27)</button>
                                </div>
                            </div>

                        </li>


                    </ul>
 -->                </div>
            </div>


            <!-- 우측 프레임-->
            <div class="fixedPreview_3Slfb preview_Qee0B" style="margin-top : 56px;">
                <h4 class="head_25P0f">
                    <span>입력 항목</span>
                    <label for="head_25P0f" class="moreSurvey_2IOB6">추가입력/수정</label>
                </h4>

                <div class="body_25Fqi">

                    <!--카드 종류 선택하기 (신용, 체크 등)-->
                    <ul class="questions_3ScUv">
                        <li>
                            <span class="topic_9yPi5" id="topic_9yPi51"></span>
                            <span class="value_3k1fw" id="value_3k1fw1"></span>
                        </li>
                        <li>
                            <span class="topic_9yPi5" id="topic_9yPi52"></span>
                            <span class="value_3k1fw" id="value_3k1fw2"></span>
                        </li>
                        <li>
                            <span class="topic_9yPi5" id="topic_9yPi53"></span>
                            <span class="value_3k1fw" id="value_3k1fw3"></span>
                        </li>
                    </ul>



                    <!-- 선택한 가격 표시-->
                    <ul class="questions_3ScUv" id="resultCash">
                        <li>
                            <span class="topic_9yPi5">선택목록</span>
<!--                             <span class="clearableValue_2Aovs value_3k1fw">10,000원

                                    <button class="clear_3vhDj">제거</button>
                                </span> -->
                        </li>
                    </ul>
                </div>

                <div class="foot_2aDGD">
                    <section class="result_tFmiI">
                        <span class="resultTitle_sNRCu">예상 월 혜택</span>
                        <span class="resultValue_rynW5" id="resultValueCash"></span>
                    </section>
                    <a href="javascript:bestCardSubmit()" id="btnCardSubmit" class="next_2m58y">결과보기</a>
                </div>
            </div>
        </div>
    </DIV>
</div>
</body>

<script>



    $(document).ready(function(){

        $('#btnCardSubmit').css('background', '#ccc');

        var Url = '${pageContext.request.contextPath}/user/best/placeGroup.ajax';
        $.ajax({
            url: Url,
            type: 'post',
            dataType: 'json',
            success: function (data) {

                //사이드 목록 만들기
                let str_arr = '';
                str_arr += '<li>';
                str_arr += '<button class="button_iMgjC active_5i2qc">인기업종 TOP30</button>';
                str_arr += '</li>';


                let main_list_arr = '';
                //사이드 목록 출력
                for(var i=0; i < data.placeGroupList.length; i++) {
                    str_arr += '<li>';
                    str_arr += '<button class="button_iMgjC" onclick="showHide(\'sh'+(i+1)+'\');">'+data.placeGroupList[i].placeType+'</button>';
                    str_arr += '</li>';
                    placeMstList(data.placeGroupList[i].placeType, i+1);


                    main_list_arr+='<li id="sh'+(i+1)+'">';
                    main_list_arr+='<h5 class="groupTitle_8Xfpg">'+data.placeGroupList[i].placeType+'</h5>';
                    main_list_arr+='<div class="group_3VAkz">';
                    main_list_arr+='<div class="wrap_2rJPy">';
                    main_list_arr+='<ul class="stores_1ggw8" id="placeGroup'+(i+1)+'">';
                    main_list_arr+='</ul>';
                    //main_list_arr+='<button class="more_i6NEp" id="placeGroupPlus'+(i+1)+'" ></button>';

                    main_list_arr+='</div>';
                    main_list_arr+='</div>';
                    main_list_arr+='</li>';

                }

                //사이드 목록 출력
                document.getElementById("sidePlaceGroupList").innerHTML = str_arr;
                document.getElementById("placeGroupList").innerHTML = main_list_arr
                
               /*  $('#sidePlaceGroupList').html(str_arr);
                $('#placeGroupList').html(main_list_arr); */
            }
        });
    });


    //placeType : Group 분류
    //jsSeq : ID 구분 단자
    function placeMstList(placeType, jsSeq) {
        var Url = '${pageContext.request.contextPath}/user/best/placeGroupList.ajax';
        $.ajax({
            url: Url,
            data : {placeType : placeType},
            type: 'post',
            dataType: 'json',
            success: function (data) {

                let str_arr ='';
                for(var i =0 ; i < data.placeList.length; i++) {
                    let placeSeq = data.placeList[i].placeMstSeq;
                    let placeName = data.placeList[i].placeName;
                    let placeImage = data.placeList[i].placeImage;

                    //seq에 따라서 id에 주어지는 대상이 달라진다.
                    str_arr += placeMst(placeSeq, placeName, placeImage);


                }

                $('#placeGroup'+jsSeq).html(str_arr);

                //$('#placeGroupPlus'+jsSeq).html('+ 가맹점 더보기(3/'+data.placeList.length+')');



                //hover 기능 만들기
                for(var i =0 ; i < data.placeList.length; i++) {
                    let placeSeq = data.placeList[i].placeMstSeq;


                    //목록 생성
                    $('#image_1rmXk'+placeSeq).hover(function() {
                        $('#amount_28STO'+placeSeq).css('display', 'none');
                        $('#image_1rmXk'+placeSeq).css('display', 'none');
                        $('.placeName'+placeSeq).css('display', 'block');
                    });

                    //목록 지우기
                    $('#wrap_pykfR'+placeSeq).hover(function() {
                        },
                        function() {

                            //마우스 빠져나갔을때, span값이 없을 경우 표시 안 함.
                            if($('#amount_28STO'+placeSeq).text() != '') {
                                $('#amount_28STO' + placeSeq).css('display', 'block');
                            }

                            $('.image_1rmXk').css('display', 'block');
                            $('.placeName').css('display', 'none');
                        });
                }


            }
        });
    }

    function placeMst(placeSeq, placeName, placeImage, i) {

        let str_arr = '';
        str_arr += '<li>';
        str_arr += '<div class="wrap_pykfR" id="wrap_pykfR'+placeSeq+'">';
        str_arr += '<span class="name_2H_ss" >'+placeName+'</span>';
        str_arr += '<span class="amount_28STO" id="amount_28STO'+placeSeq+'" style="display: none"><!--월 50,000원--></span>';
        str_arr += '<img src="${pageContext.request.contextPath}/placemst/'+placeImage+'" class="image_1rmXk" id="image_1rmXk'+placeSeq+'">';
        str_arr += '<div class="placeName placeName'+placeSeq+'" style="display: none">';

        str_arr += '<div class="keypadInput_3zTbE" id="place_area'+placeSeq+'" style="display: none">';
        str_arr += '<div class="wrap_M4OpS">';
        str_arr += '<input type="text" class="input_3Pz_8" id="input_place_mst'+placeSeq+'" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">';
        str_arr += '<span class="show_28yFC" id="span_place_mst'+placeSeq+'" style="color:rgb(4, 197, 132); font-size : 16px; text-align : right;">500</span>';
        str_arr += '</div>';
        str_arr += '</div>';

        str_arr += '<ul class="preset_1RR5I preset_1RR5I'+placeSeq+'" id="preset_1RR5I'+placeSeq+'">';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'1\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_1">1만원</button>';
        str_arr += '</li>';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'2\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_2">2만원</button>';
        str_arr += '</li>';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'3\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_3">3만원</button>';
        str_arr += '</li>';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'5\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_5">5만원</button>';
        str_arr += '</li>';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'10\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_10">10만원</button>';
        str_arr += '</li>';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'15\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_15">15만원</button>';
        str_arr += '</li>';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'20\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_20">20만원</button>';
        str_arr += '</li>';
        str_arr += '<li>';
        str_arr += '<button onclick="fn_green(\''+placeSeq+'\',\''+placeName+'\',\'30\')" class="btn_value'+placeSeq+' btn_value'+placeSeq+'_30">30만원</button>';
        str_arr += '</li>';
        str_arr += '</ul>';
        str_arr += '</div>';
        str_arr += '</div>';
        str_arr += '</li>';


        return str_arr;
    }



    let place_Array = new Array();  //배열 생성, 각 '소분류' 저장된 값 담기

    function fn_green(placeSeq, placeName, price) {

        console.log(placeName);

        $('.btn_value'+placeSeq+'_'+place_Array[placeSeq]).html(place_Array[placeSeq]+'만원');
        $('.btn_value'+placeSeq+'_'+place_Array[placeSeq]).css('color', '#7b7b7b');
        $('.btn_value' + placeSeq+'_'+place_Array[placeSeq]).css('background', '#fff');

        //취소 버튼 눌렀을 때, 동작하지 말기
        if(place_Array[placeSeq] != price) {
            place_Array[placeSeq] = price;  //변경된 값을 배열에 저장하기

            $('#place_area'+placeSeq).show();   //'소분류' hover 영역 가격 보이기



            $('#input_place_mst'+placeSeq).val((price*10000).toLocaleString());            //'소분류' input값 변경
            $('#span_place_mst'+placeSeq).html((price*10000).toLocaleString());            //'소분류 ' hover span값 변경
            $('#amount_28STO'+placeSeq).html('월 '+(price*10000).toLocaleString()+'원');     //메인 값 변경

            $('.btn_value' + placeSeq + '_' + price).css('background', '#10df99');  //배경색 초록색계열로 변경
            $('.btn_value' + placeSeq + '_' + price).css('color', 'white');         //글자색 하얀색으로 변경
            $('.btn_value' + placeSeq + '_' + price).html('취소');                    //글자 '쉬소'로 변경
        }

        //취소 눌렀을 경우
        else if(place_Array[placeSeq] === price) {
            place_Array[placeSeq] = 0;
            $('#input_place_mst'+placeSeq).val('0');
            $('#span_place_mst'+placeSeq).html('0');

            $('#amount_28STO'+placeSeq).hide();
            $('#amount_28STO'+placeSeq).html('');

            //취소를 알림
            price = 0;
        }

        resultCashList(placeName, price);
    }





    //카드 클릭
    let Arr_cardTypeName = new Array();
    $('input[name="checkboxCard"]').change(function() {


        let cardList = '';
        Arr_cardTypeName = [];  //배열 초기화

        $('input[name="checkboxCard"]:checked').each(function(idx, val) {

            if(idx != 0) {
                cardList += ', ';
            }
            Arr_cardTypeName.push($(this).val());
            cardList+=$(this).val();
        });

        if(cardList.length > 1) {

            $('#topic_9yPi51').html('카드종류');
        } else {
            $('#topic_9yPi51').html('');
        }

        resultRecommandValue();
        $('#value_3k1fw1').html(cardList);
    });

    //카드 혜택 종류 클릭하기
    let benefit_seq = ''; //카드 포인트 용도
    $('input[name="form-card-benefit-type"]').change(function() {
        $('#topic_9yPi52').html('카드용도');

        let benefit_value = '';

        if($('input[name="form-card-benefit-type"]:checked').val() === 'discount') {
            benefit_value = '할인/적립';
            benefit_seq = 2;
        } else {
            benefit_value = '항공마일리지';
            benefit_seq = 1;
        }

        resultRecommandValue();
        $('#value_3k1fw2').html(benefit_value);
    });

    //중앙, 기본항목 카드 금액 span에 표시하기
    let cardMoneyValue = '';
    function cardMoney(money) {


        $('#topic_9yPi53').html('월평균소비');
        $('#cardMoney').html((money*10000).toLocaleString());
        $('#value_3k1fw3').html((money*10000).toLocaleString()+'원');
        cardMoneyValue = (money*10000);

        resultRecommandValue();
    }



    //우측에 선택 항목 표시하기
    let resultObject = new Object();
    function resultCashList(placeName, placeValue) {

        //취소가 된 것은 Obejct에 넣지 않는다.
        resultObject[placeName] = placeValue*10000;



        let str_arr = '';   //장바구니 배열 담기
        let totalValue = 0;

        for (const [key, value] of Object.entries(resultObject)) {

            if(value != 0) {
                str_arr += '<li>';
                str_arr += '<span class="topic_9yPi5">' + key + '</span>';
                str_arr += '<span class="clearableValue_2Aovs value_3k1fw">' + (value).toLocaleString() + "원";
                str_arr += '<button class="clear_3vhDj">제거</button>';
                str_arr += '</span>';
                str_arr += '</li>';
            }

            //totalValue += (value*10000);
        }

        //$('#resultValueCash').val(값);

        $('#resultCash').html(str_arr);
        
        resultRecommandValue();
    }
    
    function resultRecommandValue(){
    	 
    	let obj = new Object();
        console.log('?/');
    	
    	if(Arr_cardTypeName.length > 0) {
             obj.Arr_cardTypeName = Arr_cardTypeName;
         } else {
            $('#btnCardSubmit').css('background', '#ccc');
             return false;
         }

         //카드 포인트 용도 benefit_value
         if(benefit_seq != '') {
             obj.cardPointSel = benefit_seq;
         } else {
             $('#btnCardSubmit').css('background', '#ccc');
             return false;
         }

         //카드 사용 금액 cardMoneyValue
         if(cardMoneyValue > 0) {
             obj.cardMoneyValue = cardMoneyValue;
         } else {
             $('#btnCardSubmit').css('background', '#ccc');
             return false;
         }


         let cardData = new Object();
         let URL = '';
         


         cardData.Arr_cardTypeName = obj.Arr_cardTypeName;
         cardData.cardPointSel = obj.cardPointSel;
         cardData.cardMoneyValue = obj.cardMoneyValue;

         var totalPrice = 0;
         if(Object.keys(resultObject).length > 0) {
             let arr_key = new Array();
             let arr_value = new Array();
             for (const [key, value] of Object.entries(resultObject)) {

                 arr_key.push(key);
                 arr_value.push(value);
                 totalPrice+=value;
             }

             cardData.arrPriceName = arr_key;
             cardData.arrPriceValue = arr_value;
         } else {
             $('#btnCardSubmit').css('background', '#ccc');
             return false;
         }

         if(cardMoneyValue <= totalPrice) {
             alert('사용된 금액이 더 많습니다.');
             $("#resultValueCash").html("0원");
             $('#btnCardSubmit').css('background', '#ccc');
             return false;
         } else if(totalPrice === 0) {
             $("#resultValueCash").html("0원");
             $('#btnCardSubmit').css('background', '#ccc');
             return false;
         }

        $('#btnCardSubmit').css('background', '#fd8700');

         console.log('??');


         if (cardData.cardPointSel == 1){
             console.log('1');
        	 URL = '${pageContext.request.contextPath}/user/best/SelectRecommandMileage.ajax'; 
		 } else if(cardData.cardPointSel == 2){
             console.log('2');
        	 URL = '${pageContext.request.contextPath}/user/best/SelectRecommandBenefit.ajax'; 
         }
         
         $.ajax({
            url :URL,
            type : 'post',
            data : cardData,
            dataType : 'json',
            success : function (data) {
                console.log(data);
                if(data.result != undefined){
                	 $("#resultValueCash").html(data.result + "원");
                }else{
                	$("#resultValueCash").html("없음");
                }
               
                
            }
        })
         
         
         
    }


    //결과보기 클릭하기
    function bestCardSubmit() {

        let obj = new Object();
        //카드 타입 : Arr_cardTypeName(체크, 신용, 하이브리드)
        if(Arr_cardTypeName.length > 0) {
            obj.Arr_cardTypeName = Arr_cardTypeName;
        } else {
            alert('카드를 선택하지 않았습니다.');
            return false;
        }

        //카드 포인트 용도 benefit_value
        if(benefit_seq != '') {
            obj.cardPointSel = benefit_seq;
        } else {
            alert('혜택을 선택하지 않았습니다.');
            return false;
        }

        //카드 사용 금액 cardMoneyValue
        if(cardMoneyValue > 0) {
            obj.cardMoneyValue = cardMoneyValue;
        } else {
            alert('월 평균 금액을 선택하지 않았습니다.');
            return false;
        }

        let str = JSON.stringify(resultObject);
        let objStr = JSON.stringify(obj);

        location.href="${pageContext.request.contextPath}/user/cardList.do?keyObject="+encodeURI(str)+"&obj="+encodeURI(objStr);

    }
    
    function showHide(id) {
		if($("#"+id).is(':visible')){
			$("#"+id).hide();
		}else{
			$("#"+id).show();
			var offset = $("#"+id).offset();
	        $('html, body').animate({scrollTop : offset.top}, 400);
		}
	}
</script>
</html>