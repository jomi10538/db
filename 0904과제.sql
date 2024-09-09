create table stu(
no number,
name varchar2(5 char),
tel varchar2(13)
);

create table pp(
no number,e_name varchar2(4),e_point number(3)
);

insert into stu values(1,'hong','1111');
insert into stu values(2,'kim','2222');
insert into stu values(3,'lee','3333');
insert into pp values(1,'java','70');
insert into pp values(1,'html','90');
insert into pp values(3,'java','80');
commit;

select *from stu;
select *from pp;
--join:한개 이상의 테이블을 논리적을 합치는 것
--종류:full join,두개의 테이블을 모두 합치는것
        결과는 n*m의 수만ㅋ틈 조인이 되어 튜플이 만들어 진다.
        inner join:조건을 제시한다.조건에 참일 경우만 조인한다.
        종류:동등이너조인(==),비동등이너조인(!=)
        out join:이너조인 +조인에 참여하지 않은 튜플까지 출력
        종류:테이블 조인의 위치에 따라
         left outer join,right outer join
    공부의 방향은 :어떤테이블을 조인할까?어떤 조인을 사용할까?
    먼저 full join해본다..절대 현업에서는 하지 마세요.속도 느려짐
select s.no, s.name, p.no, p.e_name, p.e_point
from stu s,pp p
where s.no=p.no;

select s.no, s.name, p.no, p.e_name, p.e_point
from stu s
inner join pp p
on s.no=p.no;
 --아우터 조인
 select s.no, s.name, p.no, p.e_name, p.e_point
from stu s
left outer join pp p --left outer join/left table :stu
on s.no=p.no;
 select s.no, s.name, p.no, p.e_name, p.e_point
from stu s
right outer join pp p --right outer join/right table : pp
on s.no=p.no;

--시험을 본 학생들의 이름과 과목과 점수를 출력하시오
--2개의 테이블을 합쳐야 하죠 //조인..그런데 같은 컬럼을 합치죠
                            --이너조인
select s.no, s.name, p.no, p.e_name, p.e_point
from stu s ,pp p
where s.no=p.no;
--홍길동의 이름과 과목과 점수를 출력하시오.이너조인 필요
 select s.no, s.name, p.no, p.e_name, p.e_point
from stu s ,pp p
where s.no=p.no and s.name='hong';
--시험을 치루지 않은 학생들의 이름을 출력하시오.
--이너조인에 참여 하지 않은 튜플의 정보이므로 아우터 조인
--1.left outer join해결
 select s.no, s.name
from stu s
left outer join pp p
on s.no=p.no
where p.no is null;

//join 정의
//조인의 종류
//조인의 종류를 언제 사용하는지?샘플..
drop table users;
create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4), 
c_name varchar2(10),
 id varchar2(8));
 
insert into users values ('1111','kim','수원');
insert into users values ('2222','lee','서울');
insert into users values ('3333','park','대전');
insert into users values ('4444','choi','대전');

insert into carinfo values ('1234','중형','1111');
insert into carinfo values ('3344','소형','1111');
insert into carinfo values ('5566','중형','3333');
insert into carinfo values ('6677','중형','3333');
insert into carinfo values ('7788','중형','4444');
insert into carinfo values ('8888','중형','5555');

//Q1. 회원의 이름과 주소를 출력하시오.
select name,addr
from users;

//Q2. 회원의 이름과 소유한 자동차 번호를 출력하시오.
select name,c_num
from users u,carinfo c
where u.id=c.id;

//Q3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오.
select name,addr
from users,carinfo
where users.id = carinfo.id and c_num='7788';


//Q4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.
select u.name, u.addr
from users u
left outer join carinfo c
on u.id = c.id
where c.c_num is null;


//Q5. 회원별 등록한 자동차 수를 출력하시오.
select u.id,count(*)
from users u 
inner join carinfo c
on u.id = c.id
group by u.id;

//Q6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.
select u.name,count(*)
from users u
inner join carinfo c
on u.id = c.id
group by u.name having count(*)>=2;
//Q7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.
select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.name is null;

create table companycar(
c_num varchar2(4),
c_com varchar2(30),
c_name varchar2(10),
c_price number);
insert into companycar values ('1234','현다','소나타',1000);
insert into companycar values ('3344','기와','축제',2000);
insert into companycar values ('7788','기와','레2',800);
insert into companycar values ('9900','현다','그랭저',2100);
//Q8. 배정 자동차의 차번호, 제조사, 자동차명, 가격을 출력하시오.
select c_num 차번호,c_com 제조사,c_name 자동차명,c_price 가격
from companycar; 

//Q9. 회사에서구매는 하였지만 배정되지 않은 자동차의 차번호, 제조자, 자동차 이름을 출력 
select r.c_num 차번호,r.c_com 제조사,r.c_name 자동차명
from companycar r
left outer join carinfo c
on c.c_num = r.c_num
where c.c_num is null;
//Q10. 자동차 가격이 1000만원 이상인 자동차의 자동차 번호를 출력하시오.
select c_num
from companycar 
where c_price >= 1000;
//Q11. 배정된 자동차 중에 회사에서 구매한 자동차가 아닌 자동차 번호를 출력하시오.
select c.c_num 
from carinfo c
left outer join companycar r
on c.c_num = r.c_num
where r.c_num is null;
//Q12. 모든 사람의 정보를 출력하시오. 이름, 배정받은 자동차번호, 자동차이름
create view all_users as
(select u.name 이름,NVL(c.c_num,'없음')배정번호,NVL(r.c_name,'없음')자동차이름
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar r
on c.c_num=r.c_num);

drop table all_users;
select * from all_users;
select 이름,배정번호,자동차이름 from all_users;