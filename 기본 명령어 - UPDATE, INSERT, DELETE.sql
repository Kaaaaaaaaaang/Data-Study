UPDATE 명령은 조건식을 만족하는 데이터의 필드 값을 바꾼다. 

구문 : UPDATE 테이블명
		SET 필드명1 = 값1, 필드명2 = 값2, ... , 필드명n = 값n
		WHERE 조건식;

필드값을 UPDATE 명령으로 바꿨다면 결과가 정확한지 3개 이상 레코드의 결과값을 계산기로 직접 계산해 확인하는 것이 좋다.
결과가 정확하면 커밋(COMMIT)해 데이터베이스에 반영하고, 그렇지 않으면 롤백(ROLLBACK)한 후 쿼리를 다시 확인하고 재계산한다. 
만약 커밋하지 않은 상태에서 데이터베이스 문제 등으로 중간에 데이터베이스가 종료되면 변경한 내용을 반영하지 않는다.

INSERT 명령은 지정한 테이블의 필드에 데이터를 입력한다. 입력값을 지정해서 입력하거나, SELECT에서 구한 값을 입력할 수 있으며, 
조건에 따라 원하는 테이블에 데이터를 입력하는 것도 가능하다.
'테이블명' 이후 VALUES 구문이 바로 올 때는 모든 데이터를 입력하는 것으로 '()' 안의 '값1'에서 '값n'까지 테이블 내 필드값을 정확히 입력해야 한다.
형식이 틀리거나 값이 모자라거나 초과하는 경우 입력 오류가 발생할 수 있다.

구문 #1 : INSERT INTO 테이블명 VALUES (값1, 값2, ... , 값n);
- 테이블의 모든 필드와 일치하는 데이터를 입력한다. VALUES에 지정한 값의 개수가 필드와 같아야 하는 의미다.

구문 #2 : INSERT INTO 테이블명 (필드명1, 필드명2, ... , 필드명n) VALUES(값1, 값2, ... , 값n);
- 필드에 해당하는 데이터만 입력한다. 지정하지 않은 필드는 NULL 값을 허용해야 한다.

구문 #3 : INSERT INTO 테이블명
		SELECT 필드명1, 필드명2, ... , 필드명n
		FROM 테이블명
		WHERE 조건식;
- SELECT 명령으로 검색한 필드를 지정한 테이블에 바로 입력한다. 이때 SELECT에서 검색하는 필드가 INSERT 명령에 지정한 테이블의 필드 개수와 형식이 같아야 한다.

구문 #4 : INSERT [ALL|FIRST]
			WHEN 조건식1 THEN INTO 테이블명1
			WHEN 조건식2 THEN INTO 테이블명2
						.
						.
			WHEN 조건식n THEN INTO 테이블명n
			ELSE INTO 테이블명x
		SELECT 필드명1, 필드명2, 필드명3, 필드명n
		FROM 테이블명
		WHERE 조건식;
- SELECT 명령으로 검색한 필드를 조건에 따라 테이블을 달리해 입력한다. 옵션인 ALL은 조건에 따라 데이터를 입력하고,
FIRST는 첫 번째 조건에 만족하면 해당 테이블에 입력하고 뒤의 조건은 처리하지 않는다.

구문 #5 : INSERT [ALL|FIRST]
				INTO 테이블명1 VALUES (필드명1, 필드명2, ... , 필드명n)
				INTO 테이블명2 VALUES (필드명1, 필드명2, ... , 필드명n)
									.
									.
				INTO 테이블명
		SELECT 필드명1, 필드명2, 필드명3, ... , 필드명n
		FROM 테이블
		WHERE 조건식;
- 구문 #5는 구문 #4와 같이 테이블을 달리해 입력하지만 원하는 필드만 입력한다.
