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

insert into muser values(muser_no.nextval,'870205-1','�̽���',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','������',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','���̼�',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','������',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','������',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','���¿�',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','�����',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','������',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','������',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','���翵',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','�̽ż�',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','�̹߲�',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','�̿���',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','���¾�',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','������',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','���̷�',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','��õ��',1,10000,31);
select *from muser;

//Q1 grade�� 3�� ����� ��� ����ΰ���?
select count(*) 
from muser 
where grade=3;
//Q2 grade�� 1,2,4�� ������� salary�� ����� ���Ͻÿ�.
select avg(salary) 
from muser 
where grade=1 or grade=2 or grade=4;
//Q3 salary�� 20000 �̸��� ����� �� ����Դϱ�?
select count(*)
from muser 
where salary < 20000;
//Q4 salary�� 30000 �̻��� ����� salary ����� ���Ͻÿ�.
select avg(salary) 
from muser 
where salary >30000;
//Q5 77��� �߿�  salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.
select name,reg_num,salary 
from muser 
where substr(reg_num,1,2)='77' and salary=(select min(salary)from muser
group by substr(reg_num,1,2) having substr(reg_num,1,2)='77');
//Q6 ��� ����� �̸���, ����(���� �� ������� 0205)�� ����Ͻÿ�.
select name,concat(substr(reg_num,3,2),substr(reg_num,5,2))
from muser;
//Q7 ������ ��� �޿��� ���Ͻÿ�.
select avg(salary)
from muser 
where substr(reg_num,length(reg_num))=1 or substr(reg_num,length(reg_num))=3;
//Q8 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿��� ����Ͻÿ�
select name,salary 
from muser 
where salary >(select avg(salary)from muser);
//Q9 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿�, ��ձ޿��� ����Ͻÿ�
select name,salary,(select avg(salary) 
from muser 
where salary>(select avg(salary)from muser))from muser where salary>(select avg(salary)from muser);
//Q10 �������� ��ձ޿����� ���� ���������� ��� ����Դϱ�
select count(*)
from muser 
where salary > (select avg(salary)from muser where substr(reg_num,length(reg_num))=2 or substr(reg_num,length(reg_num))=4);
//Q11 grade�� ��� �޿��� ����ϼ���..
select avg(salary) 
from muser 
group by grade;
//Q12 �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.
select grade,avg(salary) 
from muser 
group by grade having avg(salary)>(select avg(salary)from muser);
//Q13 �������� ���� ������ ����Ͻÿ�. (��� ���´� �̸�, ����(grade*salary*time)
select name �̸�,grade*salary*time ���� 
from muser;
//Q14 �������� ������ ����Ͻÿ�. (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)
select name �̸�,case substr(reg_num,8,1) when '1' then '��' 
                                         when '2' then '��'
                                         when '3' then '��'
                                         when '4' then '��'
                 end ���� 
                 from muser;
//Q15 time�� �ٹ��ð��� �ٹ��ð��� 31�̻��� ����� �̸��� ����Ͻÿ�.
select name �̸�, time �ٹ��ð� 
from muser 
where time >= 31;
//Q16 ¦���⵵�� �¾ ������� �̸��� ��� ����Ͻ�.
select name �̸� 
from muser 
where mod(substr(reg_num,1,2),2)=0; 
//Q17 �������� ��������� ����Ͻÿ�. (��� ���´� �̸��� �������(97��1��2��))
select name �̸�,concat(substr(reg_num,1,2),'��')��,concat(substr(reg_num,3,2),'��')��,concat(substr(reg_num,5,2),'��')�� 
from muser;
 
//Q18 ���������� ���Ƹ� �����ϱ� ���� ��å���� time�� 2�ð������ϱ�� �ߴ�. �̸� ó�� �Ͻÿ�.
select name �̸�,case substr(reg_num,8,1)when '2' then time+2
                                        when  '4' then time+2
                                        else time end �������� from muser;
                                
//Q19 ���̺� �ο����� ����Դϱ�
select substr(reg_num,1,2)����,count(*)�ο��� 
from muser 
group by substr(reg_num,1,2);
//Q20 2�г�׷�� 4�г� �׷��� ��� ����Դϱ�
select grade �г�,count(*)��
from muser
where grade=2 or grade=4
group by grade;
//#1) ��� ����� �¾ �� ���ñ��� �� ���� �������� ����Ͻÿ�(�������: �̸�, �ֹι�ȣ, ���ݱ�����ƿ¿���)
select
from muser
where

//#2) time�� ���̷� ��. 30~31���� ��ƿ� ������ ��, 32�� �̻��� ��ƿ� ������ �� ���ϱ�
select(select trunc(sum(months_between(sysdate,substr(reg_num,1,6))))
from muser
where time in (30,31)) as �������,(select trunc(sum(months_between(sysdate,substr(reg_num,1,6))))from muser where time >=32)as ����
from dual;
//#3) ���ɺ� �޿��� ��, over()�Լ� �̿�
select disinct 
       time ����,
       sum(salary) over(partition by time) ���� 
from muser;
//#4) ���ɺ� �ο���, over()�Լ� �̿�
//#5) ��޺� �޿��� �ְ�޿�, over()�Լ� �̿�
//#6) ���۰˻��Ͽ� ����Ŭ �Լ� ����
