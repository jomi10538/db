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
--join:�Ѱ� �̻��� ���̺��� ������ ��ġ�� ��
--����:full join,�ΰ��� ���̺��� ��� ��ġ�°�
        ����� n*m�� ������ƴ ������ �Ǿ� Ʃ���� ����� ����.
        inner join:������ �����Ѵ�.���ǿ� ���� ��츸 �����Ѵ�.
        ����:�����̳�����(==),�񵿵��̳�����(!=)
        out join:�̳����� +���ο� �������� ���� Ʃ�ñ��� ���
        ����:���̺� ������ ��ġ�� ����
         left outer join,right outer join
    ������ ������ :����̺��� �����ұ�?� ������ ����ұ�?
    ���� full join�غ���..���� ���������� ���� ������.�ӵ� ������
select s.no, s.name, p.no, p.e_name, p.e_point
from stu s,pp p
where s.no=p.no;

select s.no, s.name, p.no, p.e_name, p.e_point
from stu s
inner join pp p
on s.no=p.no;
 --�ƿ��� ����
 select s.no, s.name, p.no, p.e_name, p.e_point
from stu s
left outer join pp p --left outer join/left table :stu
on s.no=p.no;
 select s.no, s.name, p.no, p.e_name, p.e_point
from stu s
right outer join pp p --right outer join/right table : pp
on s.no=p.no;

--������ �� �л����� �̸��� ����� ������ ����Ͻÿ�
--2���� ���̺��� ���ľ� ���� //����..�׷��� ���� �÷��� ��ġ��
                            --�̳�����
select s.no, s.name, p.no, p.e_name, p.e_point
from stu s ,pp p
where s.no=p.no;
--ȫ�浿�� �̸��� ����� ������ ����Ͻÿ�.�̳����� �ʿ�
 select s.no, s.name, p.no, p.e_name, p.e_point
from stu s ,pp p
where s.no=p.no and s.name='hong';
--������ ġ���� ���� �л����� �̸��� ����Ͻÿ�.
--�̳����ο� ���� ���� ���� Ʃ���� �����̹Ƿ� �ƿ��� ����
--1.left outer join�ذ�
 select s.no, s.name
from stu s
left outer join pp p
on s.no=p.no
where p.no is null;

//join ����
//������ ����
//������ ������ ���� ����ϴ���?����..
drop table users;
create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4), 
c_name varchar2(10),
 id varchar2(8));
 
insert into users values ('1111','kim','����');
insert into users values ('2222','lee','����');
insert into users values ('3333','park','����');
insert into users values ('4444','choi','����');

insert into carinfo values ('1234','����','1111');
insert into carinfo values ('3344','����','1111');
insert into carinfo values ('5566','����','3333');
insert into carinfo values ('6677','����','3333');
insert into carinfo values ('7788','����','4444');
insert into carinfo values ('8888','����','5555');

//Q1. ȸ���� �̸��� �ּҸ� ����Ͻÿ�.
select name,addr
from users;

//Q2. ȸ���� �̸��� ������ �ڵ��� ��ȣ�� ����Ͻÿ�.
select name,c_num
from users u,carinfo c
where u.id=c.id;

//Q3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.
select name,addr
from users,carinfo
where users.id = carinfo.id and c_num='7788';


//Q4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.
select u.name, u.addr
from users u
left outer join carinfo c
on u.id = c.id
where c.c_num is null;


//Q5. ȸ���� ����� �ڵ��� ���� ����Ͻÿ�.
select u.id,count(*)
from users u 
inner join carinfo c
on u.id = c.id
group by u.id;

//Q6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.
select u.name,count(*)
from users u
inner join carinfo c
on u.id = c.id
group by u.name having count(*)>=2;
//Q7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.
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
insert into companycar values ('1234','����','�ҳ�Ÿ',1000);
insert into companycar values ('3344','���','����',2000);
insert into companycar values ('7788','���','��2',800);
insert into companycar values ('9900','����','�׷���',2100);
//Q8. ���� �ڵ����� ����ȣ, ������, �ڵ�����, ������ ����Ͻÿ�.
select c_num ����ȣ,c_com ������,c_name �ڵ�����,c_price ����
from companycar; 

//Q9. ȸ�翡�����Ŵ� �Ͽ����� �������� ���� �ڵ����� ����ȣ, ������, �ڵ��� �̸��� ��� 
select r.c_num ����ȣ,r.c_com ������,r.c_name �ڵ�����
from companycar r
left outer join carinfo c
on c.c_num = r.c_num
where c.c_num is null;
//Q10. �ڵ��� ������ 1000���� �̻��� �ڵ����� �ڵ��� ��ȣ�� ����Ͻÿ�.
select c_num
from companycar 
where c_price >= 1000;
//Q11. ������ �ڵ��� �߿� ȸ�翡�� ������ �ڵ����� �ƴ� �ڵ��� ��ȣ�� ����Ͻÿ�.
select c.c_num 
from carinfo c
left outer join companycar r
on c.c_num = r.c_num
where r.c_num is null;
//Q12. ��� ����� ������ ����Ͻÿ�. �̸�, �������� �ڵ�����ȣ, �ڵ����̸�
create view all_users as
(select u.name �̸�,NVL(c.c_num,'����')������ȣ,NVL(r.c_name,'����')�ڵ����̸�
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar r
on c.c_num=r.c_num);

drop table all_users;
select * from all_users;
select �̸�,������ȣ,�ڵ����̸� from all_users;