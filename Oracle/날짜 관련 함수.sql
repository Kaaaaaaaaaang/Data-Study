1. SYSDATE

데이터베이스가 설치된 서버나 개인 컴퓨터의 일시(날짜와 시간)를 특정 형식으로 검색한다.
여기서 특정 형식은 데이터베이스 내부에 설정한 "YYYY/MM/DD HH:MM:SS"와 같은 형식을 말한다.
SYSDATE로 구한 날짜와 시간은 더하거나 빼기 등 연산이 가능하며, 연산할 때 1은 1일을 기준으로 한다.
즉, 3은 3일, 0.5는 12시간이다. SYSDATE와 비슷한 기능을 수행하는 CURRENT_DATE 명령도 있지만 일반적으로 간결한 SYSDATE가 주로 쓰인다.

SELECT SYSDATE FROM DUAL;
