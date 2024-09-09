//1. ���̺� ����� - ���� ������ �����ؼ� ���̺��� �����ϼ���
create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));

?//grade�� �г��̴�.

//2. ���̺� Ʃ�� ���� - ���� �����������ؼ� Ʃ���� �����ϼ���
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
//3. ����Ǯ��
//���κ��� ���� ������ Ǯ��, ������ ������ ���� ���纸��
//������ ������ ��ŭ ����� �ۼ��Ͽ� ���κ��� �����մϴ�.


//��ǥ����  
//�˻��� : ����Ŭ where ���� 2  5  6  8  9   10   11  15   17
//Q1. ��� ������� �̸��� ������ ��������� �˻��Ͻÿ�.  

select name,point,jumin from users;


//Q*2. 80�� �̻��� ����� �̸��� �ּ�, ������ �˻��Ͻÿ�.������̺��� user
//80�� �̻��� ����� �����ϴ� ���� Ʃ���� ����-where�ʿ��
//�ϴ� �ǹ��̹Ƿ� �������� ������ �Ӽ��� ���� ����
//where point >= 80
//���ϴ� ���� �̸��� �ּҿ� ���� �̹Ƿ� select�� �ʿ�
//���⿡ ��Ī�Ǵ� �÷��� name, addr, point

select name,addr,point
from user
where point >= 80




//Q3. �̸��� kim���� ���۵Ǵ� ����� �̸��� �ּҿ� ������ �˻��Ͻÿ�.

select name,addr,point from users where name like 'kim%' ;


//Q4. ���� �������� +10���� ������ ������ ����Ͻÿ�.
//   ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.

select point+10 from users;

//Q*5. 1�г��� ������ +1���� �÷��� ����ϼ���. 
//(��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
//������̺� user
//1�г��� ������� ���� Ʃ���� ����
//  > where grade=1
//���ϴ� ���� �����ε�. �׳� ������ �ƴ϶� +1����
//  >�������� �ذ�  select point+1

select point +1
from user
where grade=1

//Q*6. B����� ȹ���� ����� �̸�, �ּ�, ������ ����ϼ��� (B��� 80�� �̻� 90�� �̸��Դϴ�)

select name,addr,point from users where point >=80 and point<90;

//Q7. ���� ��� �� NULL�� ���� �Է����� ���� ���Դϴ�.
   �ּҸ� �Է����� ���� �л��� �̸���, �ּ�, �г�, ����, �ֹι�ȣ�� ����ϼ���

select name,addr,grade,point,jumin from users where addr is null;

//Q*8. 4�г��� ������ 10%�� �ø� ������ ����ϼ���.
//   (��, ���������ʹ� �ݿ����� �ʴ´�)
//������̺� : user
//4�г� ���� Ʃ���� ���� ����  : where grade=4
//���ϴ� ���� �����ε�
//������ �״�� ����ϴ°� �ƴ϶�. 10%�ø� ��
// > ����   select point*1.1

select point*1.1
from user
where grade=4

//Q*9. ������ ���� �л����� ����ϼ���.  ��ȣ, �̸�, �ּ�, ����Ʈ

select no,name,addr,point from users order by point asc;

//Q*10. �г��� ������������ �����Ͻÿ�, 
//�� �г��� ���� �� ��� ����Ʈ�� ���� 
//����� ���� ��µ˴ϴ�.
//    ����� ��ȣ, �̸�, �г�, ����Ʈ 
//������̺� user
//Ʃ���� �����ϱ� ���� ������ ����
//���ϴ� �÷��� ��ȣ�� �̸��� �г� ����Ʈ

select no,name,grade,point
from user
order by grade asc, point desc

//Q*11. ������ �������� -10�� ������ ��� 80�� �̻��� ����� �̸��� ����, ������ ��� ������ ����ϼ���.?

select name,point-10 from users where point-10>=80;

//Q12. 2�г��� ��� �л��� ����Ͻÿ� . ��� �÷�����
    �̸� �ּ� �г����� ����Ͻÿ�. ���⼭ �̸��� name�÷�, �ּҴ� addr�÷�, �г��� grade�÷��� �ǹ�

select name,addr,grade from users where grade=2;


//�߰�����  -- ����Ŭ �Լ��� �˻��� ������
//Q13. �л��� �� ����Դϱ�? 

select count(*) from users;


//Q14. 1�г��� �� ����Դϱ�?

select count(*) from users where grade=1;

//Q*15. ��� �л��� �̸��� �г��� ����Ͻÿ�. 
//�� �̸��� ��� �ҹ��ڷθ� ����Ͻÿ�. 
//������̺� user
//Ʃ���� ���� ���� �ִ°�? ����.
//���ϴ� ��(�÷�)�� �̸��� �г��Դϴ�.select name,grade

select lower(name),grade from users;

//��, ��� �ҹ��ڷθ� ����Ͻÿ�..
//���ϴ� ���� ��Ī�Ǵ� �÷��� name�ε� 
//�̰��� �ҹ��ڷθ�? ������ �����Ѱ�? �Լ��� �����Ѱ�?
 ---- �Լ� ���� ���� ---
//select lower('ABCD') from dual;
// 1. ����Ŭ���� �̹� ���� �����ϴ� �����Լ�
//     �Ű������� ���� �ҹ��ڷ� �ٲٴ� ���
// 2. lower()�� �Լ��� call�ϴ� �۾�, �̶� �Ű������� ���ڿ� 'ABCD'����
// 3. �Լ��� ����� ������. ��� ���� abcd
----------------------------





//Q*16. 2�г� �л��� �̸��� �г��� ����Ͻÿ�. ������ ���ؼ� �ּҴ� �ձ��� 2���ڸ� ����Ͻÿ�.

select name,grade,substr(addr,1,2) from users where grade=2; 

//Q*17. ��� �л��� ������ ���� �ڸ��� �����Ͻÿ�. 
//- �ݿø� ���� (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
//-�����ڸ�����

select trunc(point,-1)���谪 from users;


//Q18. ��� �л��� ������ �ݿø��Ͽ� ����Ͻÿ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)- �����ڸ�����

select round(point)�ݿø� from users;

//Q19. 2�г��� ��� ����Դϱ�?

select count(*) from users where grade=2;

//Q20. 1�г��� 80�� �̻��� ����Դϱ�?

select count(*) from users where grade=1 and point>=80;

//Q21. 3�г��� ����� �����Դϱ�?

select avg(point) from users where grade=3;

//Q22. ��ü �л� �� �ְ����� �����Դϱ�?

select max(point) from users;

//Q23. 2�г� �� ���� ���� ������ ȹ���� ������ �����Դϱ�?
?
select min(point) from users;

//��Ǫ�� ����
//Q24. ������ ���ؼ� �ּҸ� ��� ������� �ʰ� ���� �� ���ڸ� ����ϰ� �ڿ� *�� �ϳ� ������.
   (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
   ��)suwon  >> su*

select concat(substr(addr,1,3),'*')from users;

//Q25. �̸��� �� �տ� *�� �� �ڿ���*�� ������ ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)

select concat(concat('*',substr(name,2,length(name)-2)),'*')from users;

//Q26. ��������� �״�� ������� ����
    xx �� xx �� xx �� �������� ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�. ������ �����Ѵ�)

select concat(substr(jumin,1,2),'��')��,concat(substr(jumin,3,2),'��')��,concat(substr(jumin,5,2),'��')�� from users;

//Q27. �̸�, ����Ʈ, �г�, �������, ������ �߰��Ѵ�. ������ ������Ϸ� �Ǵ��ϸ� ������ ���ڰ�1�̸� ��
    2�̸� ����� ǥ���Ѵ�. 

