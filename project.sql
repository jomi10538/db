use project

-- 회원 중 남자인 사람 이름 출력
select name "회원 이름"
from member
where gender = '남';

-- 회원 중 블랙회원 이름 출력
select name "회원 이름", grade "회원 등급"
from member
where grade = '블랙회원';

-- 리뷰 중 별점 4점 이상인 리뷰의 내용과 별점 출력
select r_massege "리뷰 내용", r_star 별점
from review
where r_star >= 4;

-- 리뷰 중 비밀글 내용 출력
select r_massege "리뷰 내용", replace(r_secret,1,'비밀 리뷰') "비밀글 여부"
from review
where r_secret = '1';

-- 식당 중 서울에 위치한 식당 이름 출력
select f_name "식당 이름", f_addr "식당 주소"
from food
where f_addr like '서울%';

-- 어플을 5번 이상 이용한 회원 이름과 횟수 출력
select v_id "방문 회원 ID", count(*) "방문 횟수"
from visitedlist
group by v_id having count(*) >= 5;


-- 2중 조인
-- 임의의 '회원', '매니저', '관리자' 등급의 각각의 회원의 경우의 리뷰 테이블을 출력
-- 임의의 회원의 경우
select  f.f_name "식당 이름", r.r_id "회원 이름", m.grade "등급",
		case when r.r_secret = 1 then case when r.r_id = '조리퐁' then r.r_massege else "--- 비밀글입니다. ---" end
			else r.r_massege end "리뷰 내용", 
		case when r.r_secret = 1 then '비밀 리뷰'
			else '공개 리뷰' end "비밀글 여부"
from review r
left outer join `member` m
on m.id = r.r_id
left outer join food f 
on f.f_code = r.r_code;

-- 임의의 매니저의 경우
select f.f_name "식당 이름", r.r_id "회원 이름", m.grade "등급",
		case when r.r_secret = 1 then
			 case when r.r_code = (select f.f_code from food f, `member` m where f.f_id = m.id and m.id = '고도리') then r.r_massege else "--- 비밀글입니다. ---" end
		     else r.r_massege end "리뷰 내용", 
	    case when r.r_secret = 1 then '비밀 리뷰'
	   		 else '공개 리뷰' end "비밀글 여부",
	   		 f.f_id "매니저 이름"
from review r
left outer join `member` m
on m.id = r.r_id
left outer join food f 
on f.f_code = r.r_code;

-- 임의의 관리자의 경우
select f.f_name "식당 이름", r.r_id "회원 이름", m.grade "등급", r.r_massege "리뷰 내용",
	    case when r.r_secret = 1 then '비밀 리뷰'
	   		 else '공개 리뷰' end "비밀글 여부"
from review r
left outer join `member` m
on m.id = r.r_id
left outer join food f 
on f.f_code = r.r_code;

-- 식당 별 평균 별점 소숫점 1자리 까지 출력
select f.f_name "식당 이름", round(avg(r.r_star),1) "평균 별점"
from food f, review r 
where f.f_code = r.r_code
group by f.f_name;

-- 리뷰 중 욕설을 사용한 경우 자바에서 필터링 되어 데이터 베이스에 저장된다고 가정.
-- 리뷰 내용은 전체 필터링 되며, 필터링은 '(%*$(^*@'로 필터링되고,
-- 이 문자열이 존재하는 리뷰를 쓴 회원의 등급이 '회원'일 경우 '블랙회원'으로 업데이트한다.
update `member` m
join review r 
on m.id = r.r_id 
set m.grade = '블랙회원'
where r.r_massege = '(%*$(^*@(&';

update `member` m
join visitedlist v 
on m.id = v.v_id 
set m.grade = '회원'
where v.v_id is null and m.grade = '블랙회원';

select m.id "회원 ID", m.name "회원 이름", r.r_massege "리뷰 내용", m.grade "회원 등급"
from member m, review r
where m.id = r.r_id and r_massege = '(%*$(^*@(&';

select m.id "회원 ID", m.name "회원 이름", m.grade "회원 등급"
from member m
where m.grade = '블랙회원';


-- 3중 조인
-- 방문대장에서 기둘기둘 회원이 방문한 기록 출력
select m.id "회원 ID", m.name "회원 이름", f.f_name "식당 이름", v.date_n "방문 날짜"
from member m
left outer join visitedlist v
on m.id = v.v_id 
left outer join food f 
on v.v_code = f.f_code
where v.v_id = '기둘기둘';

