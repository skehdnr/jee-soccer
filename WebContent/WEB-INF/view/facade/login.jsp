<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div>
 	<img id="soccer_img" src="${img}/soccer_img.jpg" alt="" />
</div>

 <form id="login_form">
	<div id="login_tab" >
			<div id="login_tab_item_1" >
				USERNAME  <input id="username" class="input_text" type="text" name="playerId"/>
			</div>
			<div id="login_tab_item_2">
				<input id="login_btn" type="button" value="로그인" />
			</div> 
			<div id="login_tab_item_3">
				PASSWORD  <input class="input_text" type="text" name="solar">
			</div>
	</div>
	<input type="hidden" name="action" value="login" />
	<input type="hidden" name="page" value="main" />
 </form>
 <div>
 	<h3 id="join_a"><a id="a_join" href="#">회원가입</a></h3>
 </div>

<script>
app.init('${ctx}');
</script>