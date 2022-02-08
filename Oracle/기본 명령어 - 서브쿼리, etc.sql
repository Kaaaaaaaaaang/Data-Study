서브쿼리(SUB QUERY)는 SELECT 구문 안에 새로운 SELECT 구문으로 SQL을 구성하는 방법이다. 서브쿼리를 별명으로 설정해 상위 쿼리에서 '별명.필드명' 형식으로 참조할 수 있다.

구문 #1 : SELECT S1.필드명1, S1.필드명2, ... , S1.필드명n
		 FROM (
		 	SELECT 필드명1, 필드명2, ... , 필드명n
		 	FROM 테이블명
		 	WHERE 조건식
		 ) S1
		 WHERE 조건식;
구문 #2 : SELECT 필드명1, 필드명2, ... , 필드명n
		 FROM 테이블명
		 WHERE 필드명 [IN| =] ( SELECT 필드명
		 					  FROM 테이블명
		 					  WHERE 조건식 )

서브쿼리는 복잡한 쿼리를 단계별로 구현하거나, 현행 단계의 쿼리에서 특정 SQL 명령을 적용하지 못할 경우 상위 쿼리(또는 메인 쿼리)에서 처리할 수 있게 한다.

EXISTS 구문은 서브쿼리의 결과가 있으면 데이터를 검색한다.EXISTS 구문 앞에 NOT을 지정하면 서브쿼리의 결과가 없으면 검색하는 조건을 나타낸다.

구문 : SELECT 검색필드
	 FROM 테이블
	 WHERE [NOT] EXISTS ( SELECT [필드|의미없는 문자]
	 					  FROM 테이블
	 					  WHERE 조건식 );