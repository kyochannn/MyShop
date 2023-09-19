<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	if(session.getAttribute("user_id")==null){
    		
    	
    %>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="height:8vh">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">BellaDress</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Cart</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">
	         Login
          </a>
        </li>
      </ul>
      <span class="navbar-text">
      	<div id="hometext">
           <div class="wrap">
               <h1>
                   <!--  <span class="material-symbols-outlined">monitor_heart</span>   -->
               </h1>
               <p id="dynamic" class="lg-text" style="margin:0;">
                   <!-- 당신을 증명해보세요! -->
               </p>
           </div>
         </div>
      </span>
    </div>
  </div>
</nav>

<script>
	let target = document.querySelector('#dynamic');

	function randomString() {
	    let stringArr = ["Discover the essence of elegance.","Elevate your style to new heights.", "A gateway to timeless sophistication."]
	    let selectString = stringArr[Math.floor(Math.random() * stringArr.length)]
	    let selectStringArr = selectString.split("")
	
	    return selectStringArr;
	}
	
	function resetTyping() {
	    target.textContent = ""
	
	    dynamic(randomString());
	}
	
	function dynamic(randomArr) {
	    // console.log(randomArr)
	    if (randomArr.length > 0) {
	        target.textContent += randomArr.shift(); /* shift() */
	        setTimeout(function () {
	            dynamic(randomArr);
	        }, 80)
	    } else {
	        setTimeout(resetTyping, 3000);
	    }
	}
	
	dynamic(randomString());
</script>

<%
	
	} else {
	

%>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">BellaDress</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a id="onLogout" class="nav-link" href="products.jsp">
	         Logout	
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" >
	         <%
	         
				String user_id = (String)session.getAttribute("user_id");
				String user_pw = (String)session.getAttribute("user_pw");
		  	 
				out.println(user_id + "님 환영합니다");
		
			
	         %>
	        </a>
        </li>
      </ul>
      <span class="navbar-text">
      
      	<div id="hometext">
           <div class="wrap">
               <h1>
                   <!--  <span class="material-symbols-outlined">monitor_heart</span>   -->
               </h1>
               <p id="dynamic" class="lg-text">
                   <!-- 당신을 증명해보세요! -->
               </p>
           </div>
         </div>
      </span>
    </div>
  </div>
</nav>

<script>
	let target = document.querySelector('#dynamic');
	let alt = document.querySelector('#onLogout');

	function randomString() {
	    let stringArr = ["Discover the essence of elegance.","Elevate your style to new heights.", "A gateway to timeless sophistication."]
	    let selectString = stringArr[Math.floor(Math.random() * stringArr.length)]
	    let selectStringArr = selectString.split("")
	
	    return selectStringArr;
	}
	
	function resetTyping() {
	    target.textContent = ""
	
	    dynamic(randomString());
	}
	
	function dynamic(randomArr) {
	    // console.log(randomArr)
	    if (randomArr.length > 0) {
	        target.textContent += randomArr.shift(); /* shift() */
	        setTimeout(function () {
	            dynamic(randomArr);
	        }, 80)
	    } else {
	        setTimeout(resetTyping, 3000);
	    }
	}
	dynamic(randomString());
	
	alt.addEventListener('click', function() {
	    alert('로그아웃 되었습니다.');
	    <%
	    	session.invalidate();
	    %>
	});
</script>

<%

	}
    
%>

