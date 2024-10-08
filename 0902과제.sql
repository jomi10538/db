//1. 테이블 만들기 - 다음 쿼리를 복사해서 테이블을 생성하세요
create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));

?//grade는 학년이다.

//2. 테이블에 튜플 삽입 - 다음 쿼리를복사해서 튜플을 삽입하세요
insert into users values (1,'kimsu','suwon',99.12,1,'820405-1');
insert into users values (2,'leesu','suwon city',89.00,2,'970805-2');
insert into users values (3,'choihee','seoul',88.21,1,'910204-2');
insert into users values (4,'leesil','suwon',77.62,4,'850405-1');
insert into users values (5,'james','seoul',60.22,1,'871105-1');
insert into users values (6,'parksuji','suwon',90.12,3,'880405-2');
insert into users values (7,'kimrae','yougin',89.96,3,'820105-1');
insert into users values (8,'sangJin','youngin',99.31,3,'990420-2');
insert into users values (9,'Leechan','incheon',79.12,2,'970605-2');
insert into users values (10,'kimmi','incheon',79.92,1,'810505-1');
insert into users values (11,'ryusu','seoul',85.32,4,'861205-2');
insert into users values (12,'Gosu',null,82.13,4,'810715-1');
?
//3. 문제풀기
//개인별로 먼저 문제를 풀고, 조별로 쿼리의 답을 맞춰보고
//본인이 이해한 만큼 답안을 작성하여 개인별로 제출합니다.


//목표문제  
//검색어 : 오라클 where 조건 2  5  6  8  9   10   11  15   17
//Q1. 모든 사람들의 이름과 점수와 생년월일을 검색하시오.  

select name,point,jumin from users;


//Q*2. 80점 이상의 사람의 이름과 주소, 점수를 검색하시오.대상테이블은 user
//80점 이상의 사람을 선택하는 것은 튜플을 선택-where필요ㅛ
//하는 의미이므로 조건절에 점수의 속성의 조건 설정
//where point >= 80
//원하는 값은 이름과 주소와 점수 이므로 select절 필요
//여기에 매칭되는 컬럼은 name, addr, point

select name,addr,point
from user
where point >= 80




//Q3. 이름이 kim으로 시작되는 사람의 이름과 주소와 점수를 검색하시오.

select name,addr,point from users where name like 'kim%' ;


//Q4. 현재 점수에서 +10으로 보정한 점수를 출력하시오.
//   원본 데이터에 반영되지 않습니다.

select point+10 from users;

//Q*5. 1학년의 점수를 +1점씩 올려서 출력하세요. 
//(단, 원본 데이터에 반영되지 않습니다.)
//대상테이블 user
//1학년의 점수라는 것은 튜플을 선택
//  > where grade=1
//원하는 값이 점수인데. 그냥 점수가 아니라 +1이죠
//  >수식으로 해결  select point+1

select point +1
from user
where grade=1

//Q*6. B등급을 획득한 사람의 이름, 주소, 점수를 출력하세요 (B등급 80점 이상 90점 미만입니다)

select name,addr,point from users where point >=80 and point<90;

//Q7. 쿼리 결과 중 NULL은 실제 입력하지 않은 값입니다.
   주소를 입력하지 않은 학생의 이름과, 주소, 학년, 점수, 주민번호를 출력하세요

select name,addr,grade,point,jumin from users where addr is null;

//Q*8. 4학년의 점수를 10%로 올린 점수를 계산하세요.
//   (단, 원본데이터는 반영되지 않는다)
//대상테이블 : user
//4학년 점수 튜플을 선정 조건  : where grade=4
//원하는 값은 점수인데
//점수를 그대로 출력하는게 아니라. 10%올린 값
// > 수식   select point*1.1

select point*1.1
from user
where grade=4

//Q*9. 점수가 낮은 학생부터 출력하세요.  번호, 이름, 주소, 포인트

select no,name,addr,point from users order by point asc;

//Q*10. 학년을 오름차순으로 정렬하시오, 
//단 학년이 동일 할 경우 포인트가 높은 
//사람이 먼저 출력됩니다.
//    출력은 번호, 이름, 학년, 포인트 
//대상테이블 user
//튜플을 선정하기 위한 조건은 없음
//원하는 컬럼은 번호와 이름과 학년 포인트

select no,name,grade,point
from user
order by grade asc, point desc

//Q*11. 현재의 점수에서 -10을 보정한 결과 80점 이상인 사람의 이름과 점수, 보정한 결과 점수를 출력하세요.?

select name,point-10 from users where point-10>=80;

//Q12. 2학년의 모든 학생을 출력하시오 . 출력 컬럼명은
    이름 주소 학년으로 출력하시오. 여기서 이름은 name컬럼, 주소는 addr컬럼, 학년은 grade컬럼을 의미

select name,addr,grade from users where grade=2;


//추가문제  -- 오라클 함수를 검색해 보세요
//Q13. 학생은 총 몇명입니까? 

select count(*) from users;


//Q14. 1학년은 총 몇명입니까?

select count(*) from users where grade=1;

//Q*15. 모든 학생의 이름과 학년을 출력하시오. 
//단 이름은 모두 소문자로만 출력하시오. 
//대상테이블 user
//튜플의 선정 조건 있는가? 없다.
//원하는 값(컬럼)은 이름과 학년입니다.select name,grade

select lower(name),grade from users;

//단, 모두 소문자로만 출력하시오..
//원하는 값의 매칭되는 컬럼은 name인데 
//이것을 소문자로만? 수식이 가능한가? 함수로 가능한가?
 ---- 함수 공부 정리 ---
//select lower('ABCD') from dual;
// 1. 오라클에서 이미 만들어서 제공하는 내장함수
//     매개변수의 값을 소문자로 바꾸는 기능
// 2. lower()는 함수를 call하는 작업, 이때 매개변수로 문자열 'ABCD'전달
// 3. 함수는 결과값 리턴함. 결과 값은 abcd
----------------------------





//Q*16. 2학년 학생의 이름과 학년을 출력하시오. 보안을 위해서 주소는 앞글자 2글자만 출력하시오.

select name,grade,substr(addr,1,2) from users where grade=2; 

//Q*17. 모든 학생의 점수의 일의 자리는 절삭하시오. 
//- 반올림 없음 (단, 원본 데이터에 반영되지 않습니다.)
//-십의자리까지

select trunc(point,-1)절삭값 from users;


//Q18. 모든 학생의 점수를 반올림하여 출력하시오. (단, 원본 데이터에 반영되지 않습니다.)- 정수자리까지

select round(point)반올림 from users;

//Q19. 2학년은 모두 몇명입니까?

select count(*) from users where grade=2;

//Q20. 1학년중 80점 이상은 몇명입니까?

select count(*) from users where grade=1 and point>=80;

//Q21. 3학년의 평균은 몇점입니까?

select avg(point) from users where grade=3;

//Q22. 전체 학생 중 최고점은 몇점입니까?

select max(point) from users;

//Q23. 2학년 중 가장 낮은 점수를 획득한 점수는 몇점입니까?
?
select min(point) from users;

//못푸는 문제
//Q24. 보안을 위해서 주소를 모두 출력하지 않고 앞의 세 글자만 출력하고 뒤에 *를 하나 붙힌다.
   (단, 원본 데이터에 반영되지 않습니다.)
   예)suwon  >> su*

select concat(substr(addr,1,3),'*')from users;

//Q25. 이름의 맨 앞에 *를 맨 뒤에도*를 붙혀서 출력한다. (단, 원본 데이터에 반영되지 않습니다.)

select concat(concat('*',substr(name,2,length(name)-2)),'*')from users;

//Q26. 생년월일을 그대로 출력하지 말고
    xx 년 xx 월 xx 일 형식으로 출력한다. (단, 원본 데이터에 반영되지 않습니다. 성별은 무시한다)

select concat(substr(jumin,1,2),'년')년,concat(substr(jumin,3,2),'월')월,concat(substr(jumin,5,2),'일')일 from users;

//Q27. 이름, 포인트, 학년, 생년월일, 성별을 추가한다. 성별은 생년월일로 판단하며 마지막 숫자가1이면 남
    2이면 여라고 표시한다. 

