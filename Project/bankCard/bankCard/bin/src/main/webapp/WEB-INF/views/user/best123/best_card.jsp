<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-10-21
  Time: 오전 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="styleSheet" href="../assets/css/user.css" >

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/metisMenu.min.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/common-ui.js"></script>
</head>
<body>
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
                                <input type="checkbox" id="form-card-type-credit">
                                <label for="form-card-type-credit">신용</label>
                            </li>
                            <li>
                                <input type="checkbox" id="form-card-type-check">
                                <label for="form-card-type-check">체크</label>
                            </li>
                            <li>
                                <input type="checkbox" id="form-card-type-hybrid">
                                <label for="form-card-type-hybrid">하이브리드</label>
                            </li>
                        </ul>
                    </dd>


                    <!-- 혜택 선택-->
                    <dt class="essential_23bSY">어떤 혜택을 선호하세요?</dt>
                    <dd>
                        <ul class="wrap_2eCTW">
                            <li>
                                <input type="radio" name="form-card-benefit-type" id="form-card-benefit-type-discount">
                                <label for="form-card-benefit-type-discount">할인/적립</label>
                            </li>
                            <li>
                                <input type="radio"  name="form-card-benefit-type" id="form-card-benefit-type-mileage">
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
                                            <span class="show_28yFC" style="color:rgb(4, 197, 132); font-size : 20px; text-align:right;">300</span>
                                        </div>
                                    </span>
                                <span class="tabletMobile_1kcWU">
                                        <div class="wrap_M4OpS">
                                            <input type="text" class="input_3Pz_8" style="color:rgb(4, 197, 132); font-size : 20px; text-align:right;">
                                            <span class="show_28yFC" style="color:rgb(4, 197, 132); font-size : 20px; text-align:right;" value="100"></span>
                                        </div>
                                    </span>
                                <span class="amountCurrency_1OwBP">원</span>
                                <button class="amountClear_TPmfy">초기화</button>
                            </div>

                            <ul class="preset_1AfWO">
                                <li>
                                    <button class="tag_1jHZn">50만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn">70만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn">100만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn">150만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn">200만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn">500만</button>
                                </li>
                                <li>
                                    <button class="tag_1jHZn">1000만</button>
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
                    <ul class="groups_Jm6eo">

                        <li>
                            <h5 class="groupTitle_8Xfpg">대중교통</h5>
                            <div class="group_3VAkz">
                                <div class="wrap_2rJPy">
                                    <ul class="stores_1ggw8">
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

                                                <!--클릭 결과-->
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

                                    <!-- 두번째 줄 -->
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

                        <!-- 휴대폰 요금 -->
                        <li>
                            <h5 class="groupTitle_8Xfpg">휴대폰요금</h5>
                            <div class="group_3VAkz">
                                <div class="wrap_2rJPy">
                                    <ul class="stores_1ggw8">

                                        <!-- 첫 번째 줄-->
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
                </div>
            </div>





            <!-- 우측 프레임-->
            <div class="fixedPreview_3Slfb preview_Qee0B" style="margin-top : 56px;">
                <h4 class="head_25P0f">
                    <span>입력 항목</span>
                    <label for="4bc883d0-3b92-4727-a3f8-49ba26a82c00" class="moreSurvey_2IOB6">추가입력/수정</label>
                </h4>

                <div class="body_25Fqi">

                    <!--카드 종류 선택하기 (신용, 체크 등)-->
                    <ul class="questions_3ScUv">
                        <li>
                            <span class="topic_9yPi5">카드종류</span>
                            <span class="value_3k1fw">신용</span>
                        </li>
                        <li>
                            <span class="topic_9yPi5">카드용도</span>
                            <span class="value_3k1fw">할인/적립</span>
                        </li>
                        <li>
                            <span class="topic_9yPi5">월평균소비</span>
                            <span class="value_3k1fw">500,000원</span>
                        </li>
                    </ul>

                    <!-- 선택한 가격 표시-->
                    <ul class="questions_3ScUv">
                        <li>
                            <span class="topic_9yPi5">선택목록</span>
                            <span class="clearableValue_2Aovs value_3k1fw">10,000원

                                    <button class="clear_3vhDj">제거</button>
                                </span>
                        </li>
                    </ul>
                </div>

                <div class="foot_2aDGD">
                    <section class="result_tFmiI">
                        <span class="resultTitle_sNRCu">예상 월 혜택</span>
                        <span class="resultValue_rynW5">10,000원</span>
                    </section>
                    <a href="#" class="next_2m58y">결과보기</a>
                </div>
            </div>
        </div>
    </DIV>
</div>
</body>

<script>

    $(document).ready(function(){

        var Url = '${pageContext.request.contextPath}/user/best/placeGroup.ajax';
        $.ajax({
            url: Url,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                let str_arr = '';
                str_arr += '<li>';
                str_arr += '<button class="button_iMgjC active_5i2qc">인기업종 TOP30</button>';
                str_arr += '</li>';
                for(var i=0; i < data.placeGroupList.length; i++) {
                    console.log(data.placeGroupList[i].placeType);
                    str_arr += '<li>';
                    str_arr += '<button class="button_iMgjC">'+data.placeGroupList[i].placeType+'</button>';
                    str_arr += '</li>';
                    placeMstList(data.placeGroupList[i].placeType);

                }

                $('#sidePlaceGroupList').html(str_arr);
            }
        });
    });

    function placeMstList(placeType) {
        var Url = '${pageContext.request.contextPath}/user/best/placeGroupList.ajax';
        $.ajax({
            url: Url,
            data : {placeType : placeType},
            type: 'post',
            dataType: 'json',
            success: function (data) {
                console.log(data);
            }
        });
    }
</script>
</html>