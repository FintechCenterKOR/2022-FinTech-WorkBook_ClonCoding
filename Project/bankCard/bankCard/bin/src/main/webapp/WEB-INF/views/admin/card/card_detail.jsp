<%--
  Created by IntelliJ IDEA.
  User: MHS
  Date: 2022-10-13
  Time: 오전 3:25
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
                <h2 class="title">카드 상세보기</h2>
            </div>
        </div>
    </div>
    <!-- 본문 타이틀 -->

    <!-- s : 본문 -->
    <div class="container">
        <div class="content-sub-title">
            <h3 class="title">카드 상세보기</h3>
        </div>
        <div id="BoxReturn" class="table-wrap mb4">
            <table class="table is-bordered is-vertical is-fullwidth">
                <colgroup>
                    <col style="width: 250px" />
                    <col style="width: calc(50%- 250px)" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">카드 이름</th>
                    <td>
					    ${result.cardName}<br>
                    </td>
                </tr>
                <tr>
                    <th scope="row">카드 등록일</th>
                    <td>
                        ${result.cardInstDate }
                    </td>
                </tr>
                <tr>
                    <th scope="row">카드사</th>
                    <td>
                    	${result.cardCompanyName }
                    </td>
                </tr>
                <tr>
                    <th scope="row">카드 종류</th>
                    <td>
                        ${result.cardTypeName }
                    </td>
                </tr>
                <tr>
                    <th scope="row">카드 이미지</th>
                    <td>
                        <img src="${pageContext.request.contextPath}/card/${result.cardImage}" style="width: 350px; height: 200px;"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="clear">
            <div class="text-center button-wrap">
                <!-- <button type="submit" class="button is-large is-main">등록</button> -->
                <button type="button" onclick="location.href='/admin/card/cardList.do'" class="button is-large is-dark">목록</button>
            </div>
        </div>
    </div>
    <!-- e : 본문 -->
</div>

<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/metisMenu.min.js"></script>
<script src="../../assets/js/jquery-ui.js"></script>
<script src="../../assets/js/common-ui.js"></script>
<script>
    $(document).ready(function() {
        $('#metismenu').metisMenu();

        }
    });
</script>
</body>

</html>
