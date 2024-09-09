create table muser(
id int,
reg_num varchar2(8) not null,
name varchar2(10 char),
grade int,
salary int,
time int);
create sequence muser_no
increment by 1
start with 10
;

insert into muser values(muser_no.nextval,'870205-1','이승진',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','박이진',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','최이수',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','류진아',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','오현식',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','정승우',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','이재수',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','박지영',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','정은아',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','정재영',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','이신수',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','이발끈',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','이욱이',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','지승아',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','현진수',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','최이런',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','이천안',1,10000,31);
select *from muser;

//Q1 grade가 3인 사람은 모두 몇명인가요?
select count(*) 
from muser 
where grade=3;
//Q2 grade가 1,2,4인 사람들의 salary의 평균을 구하시오.
select avg(salary) 
from muser 
where grade=1 or grade=2 or grade=4;
//Q3 salary가 20000 미만인 사람은 총 몇명입니까?
select count(*)
from muser 
where salary < 20000;
//Q4 salary가 30000 이상인 사람의 salary 평균을 구하시오.
select avg(salary) 
from muser 
where salary >30000;
//Q5 77년생 중에  salary가 가장 적은 사람의 이름과 나이와 salary를 출력하시오.
select name,reg_num,salary 
from muser 
where substr(reg_num,1,2)='77' and salary=(select min(salary)from muser
group by substr(reg_num,1,2) having substr(reg_num,1,2)='77');
//Q6 모든 사람의 이름과, 생일(월과 일 예를들어 0205)를 출력하시오.
select name,concat(substr(reg_num,3,2),substr(reg_num,5,2))
from muser;
//Q7 남자의 평균 급여를 구하시오.
select avg(salary)
from muser 
where substr(reg_num,length(reg_num))=1 or substr(reg_num,length(reg_num))=3;
//Q8 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여를 출력하시오
select name,salary 
from muser 
where salary >(select avg(salary)from muser);
//Q9 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여, 평균급여를 출력하시오
select name,salary,(select avg(salary) 
from muser 
where salary>(select avg(salary)from muser))from muser where salary>(select avg(salary)from muser);
//Q10 여직원의 평균급여보다 높은 남자직원은 모두 몇명입니까
select count(*)
from muser 
where salary > (select avg(salary)from muser where substr(reg_num,length(reg_num))=2 or substr(reg_num,length(reg_num))=4);
//Q11 grade별 평균 급여를 출력하세요..
select avg(salary) 
from muser 
group by grade;
//Q12 그룹별 평균급여가 전체 평균보다 높은 그룹을 출력하시오.
select grade,avg(salary) 
from muser 
group by grade having avg(salary)>(select avg(salary)from muser);
//Q13 직원들의 월급 명세서를 출력하시오. (출력 형태는 이름, 월급(grade*salary*time)
select name 이름,grade*salary*time 월급 
from muser;
//Q14 직원들의 성별을 출력하시오. (출력 형태 이름, 성별(성별은 남또는 여로 출력한다)
select name 이름,case substr(reg_num,8,1) when '1' then '남' 
                                         when '2' then '여'
                                         when '3' then '남'
                                         when '4' then '여'
                 end 성별 
                 from muser;
//Q15 time은 근무시간이 근무시간이 31이상인 사람의 이름을 출력하시오.
select name 이름, time 근무시간 
from muser 
where time >= 31;
//Q16 짝수년도에 태어난 사람들의 이름을 모두 출력하싱.
select name 이름 
from muser 
where mod(substr(reg_num,1,2),2)=0; 
//Q17 직원들의 생년월일을 출력하시오. (출력 형태는 이름과 생년월일(97년1월2일))
select name 이름,concat(substr(reg_num,1,2),'년')년,concat(substr(reg_num,3,2),'월')월,concat(substr(reg_num,5,2),'일')일 
from muser;
 
//Q18 여직원들의 육아를 지원하기 위한 정책으로 time을 2시간가산하기로 했다. 이를 처리 하시오.
select name 이름,case substr(reg_num,8,1)when '2' then time+2
                                        when  '4' then time+2
                                        else time end 육아지원 from muser;
                                
//Q19 나이별 인원수는 몇명입니까
select substr(reg_num,1,2)연령,count(*)인원수 
from muser 
group by substr(reg_num,1,2);
//Q20 2학년그룹과 4학년 그룹은 모두 몇명입니까
select grade 학년,count(*)명
from muser
where grade=2 or grade=4
group by grade;
//#1) 모든 사람이 태어난 후 오늘까지 몇 달이 지났는지 출력하시오(출력형태: 이름, 주민번호, 지금까지살아온월수)
select
from muser
where

//#2) time을 나이로 봄. 30~31세의 살아온 월수의 합, 32세 이상의 살아온 월수의 합 구하기
select(select trunc(sum(months_between(sysdate,substr(reg_num,1,6))))
from muser
where time in (30,31)) as 삼공삼일,(select trunc(sum(months_between(sysdate,substr(reg_num,1,6))))from muser where time >=32)as 삼이
from dual;
//#3) 연령별 급여의 합, over()함수 이용
select disinct 
       time 연령,
       sum(salary) over(partition by time) 총합 
from muser;
//#4) 연령별 인원수, over()함수 이용
//#5) 등급별 급여의 최고급여, over()함수 이용
//#6) 구글검색하여 오라클 함수 정리
