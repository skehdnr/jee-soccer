-- SQL_TEST_001
-- 전체 축구팀 목록. 이름 오름차순
SELECT TEAM_NAME 전체축구팀목록
FROM TEAM
ORDER BY TEAM_NAME
;
-- SQL_TEST_002
-- 포지션 종류(중복제거,없으면 빈공간
SELECT DISTINCT POSITION 포지션
FROM PLAYER
;
-- SQL_TEST_003
-- 포지션 종류(중복제거,없으면 신입으로 기재)
-- nvl2()사용
SELECT DISTINCT NVL(POSITION,'신입')
FROM PLAYER
;
-- SQL_TEST_004
-- 수원팀(ID: K02)골키퍼
SELECT PLAYER_NAME 이름
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
AND POSITION LIKE 'GK'
ORDER BY PLAYER_NAME
;
-- SQL_TEST_005
-- 수원팀(ID: K02)키가 170 이상 선수
-- 이면서 성이 고씨인 선수
SELECT POSITION 포지션, PLAYER_NAME 이름
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
AND HEIGHT >=170
AND PLAYER_NAME LIKE '고%'
;
-- SQL_TEST_006
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- 키 내림차순
SELECT PLAYER_NAME ||'선수' 이름, NUL(HEIGHT,0)||'CM'키,
NUL(WEIGHT,0)||'KG'몸무게
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
ORDER BY HEIGHT DESC
;
-- SQL_TEST_007
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- BMI지수
-- 키 내림차순
SELECT PLAYER_NAME 이름, HEIGHT ||'CM' 키, WEIGHT ||'KG' 몸무게,
ROUND(WEIGHT/((WEIGHT/100)*(HEIGHT/100)),2) BMI비만지수
FROM PLAYER
;
-- SQL_TEST_008
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중
-- 포지션이 GK 인 선수
-- 팀명, 사람명 오름차순
SELECT T.TEAM_NAME, P.POSITION,P.PLAYER_NAME
FROM PLAYER P
JOIN TEAM T
USING(TEAM_ID)
WHERE TEAM_ID IN('K02','K10')
AND P.OPSITION LIKE 'GK'
;
-- SQL_TEST_009
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
-- 키가 180 이상 183 이하인 선수들
-- 키, 팀명, 사람명 오름차순
SELECT HEIGHT||'CM' 키, T.TEAM_NAME 팀명, P.PLAYER_NAME 이름
FROM PLAYER P
JOIN TEAM T
USING(TEAM_ID)
WHERE TEAM_ID IN('K02','K10')
AND HEIGHT BETWEEN 180 AND 183
ORDER BY 1,2,3
;
-- SOCCER_SQL_010
-- 모든 선수들 중
-- 포지션을 배정받지 못한 선수들의 팀과 이름
-- 팀명, 사람명 오름차순
SELECT T.TEAM_NAME 팀명, P.PLAYER_NAME 이름
FROM PLAYER P
JOIN TEAM T
USING(TEAM_ID)
WHERE P.POSITION IS NULL
ORDER BY 1,2
;
-- SOCCER_SQL_011
-- 팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력
SELECT T.TEAM_NAME 팀명 , S.STADIUM_NAME 스타디움
FROM TEAM T
JOIN STADIUM S
USING(STADIUM_ID)
;
-- SOCCER_SQL_012
-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의
-- 팀이름, 스타디움, 어웨이팀 이름 출력
-- 다중테이블 join 을 찾아서 해결하시오
SELECT TEAM_NAME 팀명, STADIUM_NAME 스타디움, SC.AWAYTEAM_ID 원정팀ID, SCHE_DATE 스케줄날짜
FROM TEAM T
JOIN STADIUM S
ON T.STADIUM_ID LIKE S.STADIUM_ID
JOIN SCHEDULE SC
ON S.STADIUM_ID LIKE SC.STADIUM_ID
WHERE SC.SCHE_DATE LIKE '20120317'
;
-- SOCCER_SQL_013
-- 2012년 3월 17일 경기에
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함),
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오
SELECT P.PLAYER_NAME, P.POSITION , T.TEAM_NAME || T.REGION_NAME , (SELECT SS.STADIUM_NAME FROM STADIUM SS WHERE SS.STADIUM_ID LIKE T.STADIUM_ID) , (SELECT S.SCHE_DATE
FROM SCHEDULE S
WHERE SCHE_DATE LIKE '20120317' AND S.HOMETEAM_ID LIKE T.TEAM_ID )
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
WHERE POSITION LIKE 'GK'
AND P.TEAM_ID LIKE 'K03'
;
;
-- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오
SELECT S.STADIUM_NAME 스타디움, SCHE_DATE 경기날짜, HT.TEAM_NAME 홈팀 ,AT.TEAM_NAME 원정팀,
HOME_SCORE 홈팀점수, AWAY_SCORE 원정팀점수
FROM SCHEDULE SC
JOIN STADIUM S
ON SC.STADIUM_ID LIKE S.STADIUM_ID
JOIN TEAM HT
ON SC.HOMETEAM_ID LIKE HT.TEAM_ID
JOIN TEAM AT
ON SC.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE HOME_SCORE >= AWAY_SCORE +3
;
-- SOCCER_SQL_015
-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록
-- 카운트 값은 20
SELECT S.STADIUM_NAME , S.STADIUM_ID, S.SEAT_COUNT, S.HOMETEAM_ID,T.E_TEAM_NAME
FROM STADIUM S LEFT OUTER
JOIN TEAM T
ON S.STADIUM_ID LIKE T.STADIUM_ID
;
-- SOCCER_SQL_016
-- 평균키가 인천 유나이티스팀의 평균키 보다 작은 팀의
-- 팀ID, 팀명, 평균키 추출
SELECT P.TEAM_ID 팀아이디, T.TEAM_NAME 팀명, AVG(P.HEIGHT) 평균키
FROM PLAYER P , TEAM T
WHERE P.TEAM_ID LIKE T.TEAM_ID
GROUP BY P.TEAM_ID,T.TEAM_NAME
HAVING AVG(P.HEIGHT)<(SELECT AVG(HEIGHT)
FROM PLAYER
WHERE TEAM_ID LIKE 'K04')
;
-- SOCCER_SQL_017
-- 포지션이 MF 인 선수들의 소속팀명 및 선수명, 백넘버 출력
SELECT T.TEAM_NAME 팀명, P.PLAYER_NAME 선수명, P.BACK_NO 백넘버
FROM PLAYER P
JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
WHERE POSITION LIKE 'MF'
;
-- SOCCER_SQL_018
-- 가장 키큰 선수 5 추출, 오라클, 단 키 값이 없으면 제외
SELECT PLAYER_NAME 선수명, BACK_NO 백넘버, POSITION 포지션, HEIGHT 키
FROM (SELECT PLAYER_NAME,BACK_NO,POSITION,HEIGHT
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC)
WHERE ROWNUM <5
;
-- SOCCER_SQL_019
-- 선수 자신이 속한 팀의 평균키보다 작은 선수 정보 출력
SELECT T.TEAM_NAME 팀명, M.PLAYER_NAME 선수명, M.POSITION 포지션, M.BACK_NO 백넘버, M.HEIGHT 키
FROM PLAYER M,TEAM T
WHERE M.TEAM_ID LIKE T.TEAM_ID
AND M.HEIGHT<(SELECT AVG(P.HEIGHT) 키
FROM PLAYER P
WHERE P.TEAM_ID LIKE M.TEAM_ID
AND P.HEIGHT IS NOT NULL
GROUP BY P.TEAM_ID)
ORDER BY 선수명
;

-- SOCCER_SQL_020
-- 2012년 5월 한달간 경기가 있는 경기장 조회
-- EXISTS 쿼리는 항상 연관쿼리로 상요한다.
-- 또한 아무리 조건을 만족하는 건이 여러 건이라도
-- 조건을 만족하는 1건만 찾으면 추가적인 검색을 진행하지 않는다.

SELECT DISTINCT S.STADIUM_ID ID, S.STADIUM_NAME 경기장명
FROM STADIUM S
JOIN SCHEDULE SC
ON S.STADIUM_ID LIKE SC.STADIUM_ID
WHERE SCHE_DATE LIKE '201205%'
;
-- SOCCER_SQL_021
-- 이현 선수 소속팀의 선수명단 출력
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM PLAYER
WHERE TEAM_ID IN (SELECT TEAM_ID
FROM PLAYER
WHERE PLAYER_NAME LIKE '이현')
ORDER BY PLAYER_NAME
;
-- SOCCER_SQL_022
-- NULL 처리에 있어
-- SUM(NVL(SAL,0)) 로 하지말고
-- NVL(SUM(SAL),0) 으로 해야 자원낭비가 줄어든다
-- 팀별 포지션별 인원수와 팀별 전체 인원수 출력
-- Oracle, Simple Case Expr
SELECT TEAM_ID,
NVL(SUM(CASE WHEN POSITION LIKE 'FW'THEN 1 END),0)FW,
NVL(SUM(CASE WHEN POSITION LIKE 'MF'THEN 1 END),0)MF,
NVL(SUM(CASE WHEN POSITION LIKE 'DF'THEN 1 END),0)DF,
NVL(SUM(CASE WHEN POSITION LIKE 'GK'THEN 1 END),0)GK,
COUNT(*)SUM
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY TEAM_ID
;
-- SOCCER_SQL_023
-- GROUP BY 절 없이 전체 선수들의 포지션별 평균 키 및 전체 평균 키 출력
SELECT ROUND(AVG(CASE WHEN POSITION LIKE 'MF'THEN HEIGHT END),2) 미드필더,
ROUND(AVG(CASE WHEN POSITION LIKE 'FW'THEN HEIGHT END),2) 포워드,
ROUND(AVG(CASE WHEN POSITION LIKE 'DF'THEN HEIGHT END),2) 디펜더,
ROUND(AVG(CASE WHEN POSITION LIKE 'GK'THEN HEIGHT END),2) 골키퍼,
ROUND(AVG(HEIGHT),2)전체평균키
FROM PLAYER
;
-- SOCCER_SQL_024
-- 소속팀별 키가 가장 작은 사람들의 정보
SELECT TEAM_ID 팀아이디, T.TEAM_NAME 팀이름, P.PLAYER_NAME 선수,
P.POSITION 포지션, P.BACK_NO 백넘버, P.HEIGHT 키
FROM PLAYER P
JOIN TEAM T
USING(TEAM_ID)
WHERE (TEAM_ID,P.HEIGHT)IN (SELECT TEAM_ID,MIN(HEIGHT)
FROM PLAYER
GROUP BY TEAM_ID)
ORDER BY 1
;
-- SOCCER_SQL_025
-- K-리그 2012년 8월 경기결과와 두 팀간의 점수차를 ABS 함수를 사용하여
-- 절대값으로 출력하기
SELECT SC.SCHE_DATE,
(SELECT TEAM_NAME
FROM TEAM
WHERE TEAM_ID LIKE SC.HOMETEAM_ID)||'-'||
(SELECT TEAM_NAME
FROM TEAM
WHERE TEAM_ID LIKE SC.AWAYTEAM_ID) 팀들,
SC.HOME_SCORE||'-'||SC.AWAY_SCORE 점수, ABS(SC.HOME_SCORE-SC.AWAY_SCORE) 점수차
FROM TEAM T
JOIN STADIUM S
USING (STADIUM_ID)
JOIN SCHEDULE SC
USING (STADIUM_ID)
WHERE SC.SCHE_DATE LIKE '201208%'
;

-- SOCCER_SQL_026
-- 20120501 부터 20120602 사이에 경기가 있는 경기장 조회

SELECT STADIUM_ID 스타디움코드,S.STADIUM_NAME 경기장명
FROM STADIUM S
JOIN SCHEDULE SC
USING(STADIUM_ID)
WHERE SC.SCHE_DATE BETWEEN '20120501'AND'20120602'
;

-- SOCCER_SQL_027
-- 선수정보와 해당 선수가 속한 팀의 평균키 조회
-- 단, 정렬시 평균키 내림차순

SELECT T.TEAM_NAME 팀명, P.PLAYER_NAME 선수명, P.HEIGHT 키,
ROUND((SELECT AVG(PP.HEIGHT) FROM PLAYER PP
WHERE P.TEAM_ID LIKE PP.TEAM_ID),3) 평균키
FROM PLAYER P
JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
ORDER BY 4 DESC
;

-- SOCCER_SQL_028
-- 평균키가 삼성 블루윙즈 팀이 평균키보다 작은 팀의
-- 이름과 해당 팀의 평균키

SELECT P.TEAM_ID 팀아이디, T.TEAM_NAME 팀명, AVG(P.HEIGHT) 평균키
FROM PLAYER P ,TEAM T
WHERE P.TEAM_ID LIKE T.TEAM_ID
GROUP BY P.TEAM_ID, T.TEAM_NAME
HAVING AVG(P.HEIGHT)<(SELECT AVG(HEIGHT)
FROM PLAYER
WHERE TEAM_ID ='K02')
;

-- SOCCER_SQL_029
-- 드래곤즈,FC서울,일화천마 각각의 팀 소속의 GK, MF 선수 정보

SELECT T.TEAM_NAME 소속팀, P.POSITION 포지션, P.BACK_NO 백넘버,
P.PLAYER_NAME 선수명, P.HEIGHT 키
FROM PLAYER P
JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
WHERE T.TEAM_NAME IN( '드래곤즈','FC서울','일화천마')
AND P.POSITION IN('GK','MF')
;

-- SOCCER_SQL_030
-- 29번에서 제시한 팀과 포지션이 아닌 선수들의 수

SELECT COUNT(*) 선수들의수
FROM PLAYER P
JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
WHERE TEAM_NAME NOT IN('드래곤즈','FC서울','일화천마')
AND POSITION NOT IN('GK','MF')
;

