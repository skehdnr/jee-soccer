<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>soccer</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h2>2.포지션 종류보기</h2>
<h2><input id="position" type="button" value="포지션 종류보기"/></h2>

<!-- 4.팀아이디와 해당 포지션별 선수 검색기능 예) 수원팀 ID:K02,골키퍼 -->	
<h2>4.팀아이디와 해당 포지션별 선수 검색 기능</h2>
<form id="info" action="<%=request.getContextPath()%>/player.do">
	아이디 : <input type="text" name="teamId" /> <br/>
	포지션 : <input type="text" name="position" /> <br/>
	<input type="hidden" name="action" value="findinfo"/>
	<input type="hidden" name="page" value="4_find_by_teamid_position"/>
	<input type="submit" id='text' value="정보 검색"/>
</form>

<!-- 5. 수원팀(ID: K02)키가 170 이상 선수,이면서 성이 고씨인 선수-->
<h2>5.팀아이디,성씨,키 로 인한 검색 기능</h2>
<form action="heightname" action="<%=request.getContextPath()%>/player.do">
	소속팀 <input type="text" name="teamId"/> <br/>
	성씨    <input type="text" name="playername"/><br/>
	키       <input type="text" name="height"/><br/>
	<input type="hidden" name="action" value="findinfo2"/>
	<input type="hidden" name="page" value="5_find_by_teamid_height_name"/>
	<input type="submit" value="정보검색"/>
</form>

<script>
$('#position').click(function(){
				alert('클릭');
				location.assign('<%=request.getContextPath()%>/player.do?action=find2&page=2_positions');
});			
$('#info').submit(function(){
	alert('정보보기');
});
$('#heightname').submit(function(){
				alert('정보보기');
});
</script>
</body>
</html>