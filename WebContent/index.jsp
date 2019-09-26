<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>축구 협회 관리 시스템</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h3 style="width:100%;height: 100%">축구 협회 관리 시스템</h3>
<div id= "wrapper" style= "width:100%;height: 100%">
<form id="login_form" action="<%=request.getContextPath()%>/player.do">
	<table border="1" style="width:500px;height:200px; margin:100px auto">
		<tr>
			<td style="width:300px">
			ID : <input type="text" name="playerId"/><br/>
			<input type="hidden" name ="action"value="login" style="width:100%;height: 100%"/>
			<input type="hidden" name = "page" value="home" style="width:100%;height: 100%"/>
			
			</td>
			<td rowspan="2" > 
			<input type="submit" value="로그인" style= "width:100%;height: 100%" />
			 </td>
		</tr>
		<tr>
			<td>
			PW : <input type="password" name="solar" />
			</td>
		</tr>
	</table>
</form>
	<h3 style="width:150px;margin:0px auto"><a id="a_join" href="">회원가입</a></h3>
	<script>
	$('#login_form').submit(function(){
		alert('로그인성공');
});
	</script>
</div>
</body>
</html>