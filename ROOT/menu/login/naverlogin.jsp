<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<div id = "login_info"></div>

<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId({
		clientId: "QV4bEOJAokbdZPqZA6gN", 
		callbackUrl: "https://www.jobspotlight.info/menu/login/naverlogin.jsp",  // 콜백할 페이지
		isPopup: true,
		callbackHandle: true
	});	
	naverLogin.init();
	
	window.addEventListener('load', function () { 
		naverLogin.getLoginStatus(function (status) { 
			if (status) { 
				$("#login_info").append("아이디: " + naverLogin.user.id);
				$("#login_info").append("<br>이름: " + naverLogin.user.getName());
				$("#login_info").append("<br>출생연도: " + naverLogin.user.getBirthyear());
				$("#login_info").append("<br>생일: " + naverLogin.user.getBirthday());
				$("#login_info").append("<br>성별: " + naverLogin.user.getGender());
				$("#login_info").append("<br>휴대전화번호: " + naverLogin.user.getMobile());
				
				// 유저 아이디, 이메일 주소, 이름을 Session에 저장
				sessionStorage.setItem("user_info", naverLogin.user.id); 
				sessionStorage.setItem("naver_name", naverLogin.user.getName()); 
				sessionStorage.setItem("naver_mobile", naverLogin.user.getMobile()); 
				
				// 네이버 로그인과 카카오 로그인을 구분하기 위해 별도의 세션을 저장
				sessionStorage.setItem("kinds","naver"); 

				session.setAttribute("sid",naverLogin.user.id); 
				location.href = "https://www.jobspotlight.info"; // 로그인후 이동할 페이지
			} else { 
				console.log("callback 처리에 실패하였습니다."); 
			} 
		});
	});
</script>