<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: "Montserrat", sans-serif;
        margin: 0;
        padding: 0;
    }

    .wrapper {
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #ebecf0;
        overflow: hidden;
    }

    .container {
        border-radius: 10px;
        box-shadow: -5px -5px 10px #fff, 5px 5px 10px #babebc;
        position: absolute;
        width: 768px;
        min-height: 480px;
        overflow: hidden;
    }

    form {
        background: #ebecf0;
        display: flex;
        flex-direction: column;
        padding: 0 50px;
        height: 100%;
        justify-content: center;
        align-items: center;
    }

    form input {
        background: #eee;
        padding: 16px;
        margin: 8px 0;
        width: 85%;
        border: 0;
        outline: none;
        border-radius: 20px;
        box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
    }

    button {
        border-radius: 20px;
        border: none;
        outline: none;
        font-size: 12px;
        font-weight: bold;
        padding: 15px 45px;
        margin: 14px;
        letter-spacing: 1px;
        text-transform: uppercase;
        cursor: pointer;
        transition: transform 80ms ease-in;
    }

    .form_btn {
        box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
    }

    .form_btn:active {
        box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
    }

    .overlay_btn {
        background-color: white;
        box-shadow: -5px -5px 10px #E8A9A2, 5px 5px 8px #FFC5B3;
    }

    .sign-in-container {
        position: absolute;
        left: 0;
        width: 50%;
        height: 100%;
        transition: all 0.5s;
    }

    .sign-up-container {
        position: absolute;
        left: 0;
        width: 50%;
        height: 100%;
        opacity: 0;
        transition: all 0.5s;
    }

    .overlay-left {
        display: flex;
        flex-direction: column;
        padding: 0 50px;
        justify-content: center;
        align-items: center;
        position: absolute;
        right: 0;
        width: 50%;
        height: 100%;
        opacity: 0;
        background-color: pink;
        color: #fff;
        transition: all 0.5s;
    }

    .overlay-right {
        display: flex;
        flex-direction: column;
        padding: 0 50px;
        justify-content: center;
        align-items: center;
        position: absolute;
        right: 0;
        width: 50%;
        height: 100%;
        /* background-color:pink; */
        background-image: url("../static/img/imglogin.jpeg");
        color: #fff;
        transition: all 0.5s;
    }

    .container.right-panel-active .sign-in-container {
        transform: translateX(100%);
        opacity: 0;
    }

    .container.right-panel-active .sign-up-container {
        transform: translateX(100%);
        opacity: 1;
        z-index: 2;
    }

    .container.right-panel-active .overlay-right {
        transform: translateX(-100%);
        opacity: 0;
    }

    .container.right-panel-active .overlay-left {
        transform: translateX(-100%);
        opacity: 1;
        z-index: 2;
    }

    .social-links {
        margin: 20px 0;
    }

    form h1 {
        font-weight: bold;
        margin: 0;
        color: #000;
    }

    p {
        font-size: 16px;
        font-weight: bold;
        letter-spacing: 0.5px;
        margin: 20px 0 30px;
    }

    span {
        font-size: 12px;
        color: #000;
        letter-spacing: 0.5px;
        margin-bottom: 10px;
    }

    .social-links div {
        width: 40px;
        height: 40px;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        margin: 0 5px;
        border-radius: 50%;
        box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
        cursor: pointer;
    }

    .social-links a {
        color: #000;
    }

    .social-links div:active {
        box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
    }
</style>

<body>
    <%
		Cookie[] cookies = request.getCookies();
		
		String userId = "";
		String rememberId = "";
		for(int i = 0 ; i < cookies.length ; i++) {
			if( cookies[i].getName().equals("userID") ) {
				userId = cookies[i].getValue(); 
			}
			if( cookies[i].getName().equals("rememberID") ) {
				rememberId = cookies[i].getValue(); 
			}
		}
	%>

    <jsp:include page="header.jsp" />
            <div class="wrapper">
                <div class="container">
                    <div class="sign-up-container">
                        <form action="signUp_pro.jsp" method="POST">
                            <div class="social-links">
                                <div>
                                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                </div>
                                <div>
                                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                </div>
                                <div>
                                    <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            <span>or use your email for registration</span>
                            <input type="text" placeholder="Name" name ="user_name">
                            <input type="text" placeholder="id" name="user_id">
                            <input type="password" placeholder="Password" name="user_pw">
                            <button type="submit" class="form_btn">Sign Up</button>
                        </form>
                    </div>
                    <div class="sign-in-container">
                        <form action="login_pro.jsp" method="POST">
                            <h1>Sign In</h1>
                            <div class="social-links">
                                <p style="margin: 0;">
                                    <%
										if( rememberId.equals("on") ) {
									%>
                                    <input type="checkbox" name="rememberId" id="remember-id" checked />
                                    <%
										} else {
									%>
                                    <input type="checkbox" name="rememberId" id="remember-id" />
                                    <%
										}
									%>
                                    <label style="margin: 0;" for="remember-id">아이디 저장</label>
                                </p>
                            </div>
                            <span>or use your account</span>

                            <input type="text" placeholder="Email" name="user_id" value="<%= userId %>">
                            <input type="password" name="user_pw" placeholder="Password">


                            <button type="submit" class="form_btn">Sign In</button>
                        </form>

                    </div>
                    <div class="overlay-container">
                        <div class="overlay-left">
                            <h1>Create Account</h1>
                            <p>양식에 맞게 정보를 작성해 주세요.</p>
                            <button id="signIn" class="overlay_btn">Sign In</button>
                        </div>
                        <div class="overlay-right">
                            <h1>BD members</h1>
                            <p>회원가입을 통해 다양한 정보를 만나보세요.</p>
                            <button id="signUp" class="overlay_btn">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp" />
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    const signUpBtn = document.getElementById("signUp");
    const signInBtn = document.getElementById("signIn");
    const container = document.querySelector(".container");

    signUpBtn.addEventListener("click", () => {
        container.classList.add("right-panel-active");
    });
    signInBtn.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
    });
   
   
</script>

</html>

<!-- 
	* 유효성검사
	로그인 창에 정규표현식을 넣어줄 수도 있겠다. 
	정규 표현식을 사용하면 클라이언트가 입력하는 값을 제한할 수 있다.
	이에 대한 것은 jsp 실습코드 Chap08에서 확인할 수 있다.
-->