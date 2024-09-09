������ ��ǥ�� 1������ 7������ �Դϴ�.
drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --�ڵ��� ��ȣ
c_name varchar2(10),  -- �ڵ��� ����
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


�� �ڷḦ ȸ���� ����� �ڵ��� �����̴�.
1. ȸ���� �̸��� �ּҸ� ����Ͻÿ�.

select name,addr
from users;

2. ȸ���� �̸��� ������ �ڵ��� ��ȣ�� ����Ͻÿ�.

select name,c_num
from users,carinfo;


3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.

select name,addr
from users,carinfo
where users.id = carinfo.id and c_num='7788';

4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.

select u.name, u.addr
from users u
left outer join carinfo c
on u.id = c.id
where c.c_num is null;

5. ȸ������ ����� �ڵ��� ���� ����Ͻÿ�.

select u.id,count(*)
from users u 
inner join carinfo c
on u.id = c.id
group by u.id;

6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.

select u.name,count(*)
from users u
inner join carinfo c
on u.id = c.id
group by u.name having count(*)>=2;


7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.

select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.name is null;

-- ���� ���ʹ� 3�� ���̺��� �����ϴ� �����Դϴ�.

-- companycar ȸ�翡�� ������ �ڵ����� �ǹ�, 
carinfo�� �������� ������ �ڵ���

���� ���̺��� �����Ͻÿ�.
create table companycar(     -- �ڵ��� ����
c_num varchar2(4),   -- ����ȣ
c_com varchar2(30), 
c_name varchar2(10),  -- ���̸�
c_price number);  -- �� ����

���� Ʃ���� �����ϼ���
insert into companycar values ('1234','����','�ҳ�Ÿ',1000);
insert into companycar values ('3344','���','����',2000);
insert into companycar values ('7788','���','��2',800);
insert into companycar values ('9900','����','�׷���',2100);

8. ���� �ڵ����� ����ȣ, ������, �ڵ�����, ������ ����Ͻÿ�.

select c_num ����ȣ,c_com ������,c_name �ڵ�����,c_price ����
from companycar; 

9. ȸ�翡�����Ŵ� �Ͽ����� �������� ���� �ڵ����� ����ȣ, ������, �ڵ��� �̸��� ���   

select r.c_num ����ȣ,r.c_com ������,r.c_name �ڵ�����
from companycar r
left outer join carinfo c
on c.c_num = r.c_num
where c.c_num is null;

10. �ڵ��� ������ 1000���� �̻��� �ڵ����� �ڵ��� ��ȣ�� ����Ͻÿ�.
11. ������ �ڵ��� �߿� ȸ�翡�� ������ �ڵ����� �ƴ� �ڵ��� ��ȣ�� ����Ͻÿ�.
12. ��� ����� ������ ����Ͻÿ�. �̸�, �������� �ڵ�����ȣ, �ڵ����̸�
