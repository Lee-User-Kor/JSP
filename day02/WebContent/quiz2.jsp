<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz2.jsp</title>
<style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f5f6f7;
        }
       
        a {
            text-decoration: none;
            color: inherit;
        }
        .wrap {
            width: 50%;
            margin: auto;
            display: flex;
            flex-flow: column;
            align-items: center;
        }
        input {
            all: unset;
            cursor: pointer;
            border: none;
        }
        header {
            text-align: center;
            padding-top: 10px;
            font-size: 20pt;
            color: #00c850;
        }
        .wrap > main {
            display: flex;
            flex-flow: column;
            width: 400px;
        }
        .wrap > main > section > div {
            margin-bottom: 25px;
        }
        .wrap > main > section > div > div {
            margin-top: 10px;
            height: 40px;
            border: 1px solid #dadada;
            background-color: white;
            padding-top: 13px;
            padding-left: 10px;
        }
        .wrap > main > section > div > div > input {
            width: 280px;
            border: none;
            height: 30px;
        }
        .wrap > main > section > div > .birth {
            display: flex;
            background-color: #f5f6f7;
            border: none;
        }
        .wrap > main > section > div > .birth > div {
            background-color: white;
            margin: 5px;
            margin-top: -15px;
            width: 135px;
            height: 54px;
        }
        .wrap > main > section > div > .birth > .yearDiv {
            margin-left: -10px;
        }
        .wrap > main > section > div > .birth > .dateDiv {
            margin-right: 0;
        }
        .wrap > main > section > div > .birth > div > input {
            height: 50px;
        }
        .wrap > main > section > div > .birth > div > select {
            cursor: pointer;
            border: none;
            width: 100%;
            height: 54px;
        }
        .wrap > main > section > div > div > select {
            border: none;
            cursor: pointer;
            margin: -14px;
            margin-left: -5px;
            width: 100%;
            height: 52px;
        }
        .wrap > main > section > .joinDiv > .joinButton {
            background: #00c850;
            width: 100%;
            text-align: center;
            height: 50px;
            border: none;
        }
        footer {
            display: flex;
            position: relative;
            font-size: 9pt;
        }
        footer > div {
            padding: 2px;
        }
        footer > .final {
            position: absolute;
            top: 45px;
            left: 160px;
        }
        
</style>
</head>
<body>
<!-- 
		1) vscode ??? ?????? ?????????????????? naver_join.html ????????? ???????????????
		????????? ?????? ?????? ???????????? ???????????? ????????? ?????????
		???????????? css??? ?????? ???????????????
		
		2) naver_join.html ??? ????????? jsp??? ???????????? form??? ????????? ??? ????????? ???????????????
		
		3) ???????????? ??????????????? ???????????? ????????? ????????? ???????????? jsp??? ???????????? ?????? ?????? ????????????
		????????? ???????????? naver_join_result.jsp ????????? ??????????????? 
 -->
<form action="quiz2-result.jsp" method="POST">
	<div class="wrap">
        <header>
            <h1><a href="">NAVER</a></h1>
        </header>
        <main>
            <section class="idInfo">
                <div class="id"><strong><a href="">?????????</a></strong>
                    <div>
                        <input type="text" name="id">@naver.com
                    </div>
                </div>
                <div><strong><a href="">????????????</a></strong>
                    <div>
                        <input type="password" name="pw">
                    </div>
                </div>
                <div><strong><a href="">???????????? ?????????</a></strong>
                    <div>
                        <input type="password" name="correctPw">
                    </div>
                </div>
            </section>
            <section class="userInfo">
                <div><strong><a href="">??????</a></strong>
                    <div>
                        <input type="text" name="name">
                    </div>
                </div>
                <div><strong><a href="">????????????</a></strong>
                    <div class="birth">
                        <div class="yearDiv">
                            <input type="text" name="year" placeholder="???(4???)" size="15">
                        </div>
                        <div>
                            <select name="month">
                                <option>???</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                        <div class="dateDiv">
                            <input type="text" name="date" placeholder="???" size="15">
                        </div>
                    </div>
                </div>
                <div><strong><a href="">??????</a></strong>
                    <div>
                        <select name="gender">
                            <option>??????</option>
                            <option value="??????">??????</option>
                            <option value="??????">??????</option>
                            <option value="????????????">????????????</option>
                        </select>
                    </div>
                </div>
                <div><strong><a href="">?????? ?????? ?????????(??????)</a></strong>
                    <div>
                        <input type="text" name="email" placeholder="?????? ??????">
                    </div>
                </div>
            </section>
            <section class="numInfo">
                <div><strong><a href="">????????????</a></strong>
                    <div>
                        <select name="locate">
                            <option value="????????????">???????????? +82</option>
                            <option value="??????">?????? +1</option>
                        </select>
                    </div>
                    <div>
                            <input type="text" name="phoneNum" placeholder="???????????? ??????">
                    </div>
                </div>
            </section>
            <section class="join">
                <div class="joinDiv"><input class="joinButton" type="submit" value="????????????"></div>
            </section>
        </main>
        <footer>
            <div><a href="">????????????</a> |</div>
            <div><strong><a href="">????????????????????????</a></strong> |</div>
            <div><a href="">????????? ????????? ????????????</a> |</div>
            <div><a href="">???????????? ????????????</a></div>
            <div class="final"><a href="">NAVER Corp.</a></div>
        </footer>
    </div>
</form>

</body>
</html>