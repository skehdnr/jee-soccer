<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 4. 결과 -->
해당 ID가 ${player.teamId} 팀의 포지션 ${player.position} 이
 일치하는 선수는 홍길동 입니다
	<h2>홍길동 선수 정보보기</h2>
	아이디 ${player.teamId} <br/>
	포지션 ${player.position} <br/>
</body>
<script>
app.init('${ctx}');
</script>
</html>
