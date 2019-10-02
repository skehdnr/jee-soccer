<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
<h2><a id="a_position" href="#">2.포지션 종류 보기</a></h2>
</div> 
<!-- 4.팀아이디와 해당 포지션별 선수 검색기능 예) 수원팀 ID:K02,골키퍼 -->	
<div>
<h2><a id="a_find" href="#">4.팀아이디와 해당 포지션별 선수 검색 기능</a></h2>
</div>
<form id="info" action="${ctx}/player.do">
	아이디 : <input type="text" name="teamId" /> <br/>
	포지션 : <input type="text" name="position" /> <br/>
	<input type="hidden" name="action" value="findinfo"/>
	<input type="hidden" name="page" value="4_find_by_teamid_position"/>
	<input type="submit" id='text' value="정보 검색"/>
</form>
<script>
app.init('${ctx}');
</script>
