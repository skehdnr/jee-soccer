<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 5. 쿼리-->
<h2>5.팀아이디,성씨,키 입력하면 해당 선수 정보 출력 </h2>
<form action="heightname" action="${ctx}/player.do">
	소속팀 <input type="text" name="teamId"/> <br/>
	성씨    <input type="text" name="playername"/><br/>
	키       <input type="text" name="height"/><br/>
	<input type="hidden" name="action" value="findinfo2"/>
	<input type="hidden" name="page" value="5_find_by_teamid_height_name"/>
	<input type="submit" value="정보검색"/>
</form>
	선수 포지션 ${player.teamId} <br/>
	선수 키 ${player.height} <br />
	선수 이름 ${player.playername} <br />
