select * from sql.user_event;

-- 1. 기본 퍼널 (visit → signup → purchase)
-- 유저가 visit, signup, purchase 이벤트를 순서대로 진행했다고 가정할 때, 각 단계의 유저 수와 단계별 전환율을 계산하시오.
with event_count as (
	select 
			event_name, 
			count(*)
	from 
		sql.user_event
	where 1=1
		and event_name in ('visit', 'signup', 'purchase')
	group by 
		event_name
	)
	select *
	from event_count;
	
with pivot_event as (
	select 
		sum(case when event_name = 'visit' then 1 else 0 end) as visit,
		sum(case when event_name = 'signup' then 1 else 0 end) as signup,
		sum(case when event_name = 'purchase' then 1 else 0 end) as purchase
	from 
		sql.user_event
	)
	, convert_ratio as (
	select 
		visit,
		signup,
		purchase,
		signup/visit as ratio1,
		purchase/signup as ratio2
	from
		pivot_event
	)
	select * from convert_ratio;


-- 2. 앱 설치 퍼널 (visit → signup → login)
-- 앱 유입 후 회원가입하고 로그인까지 완료한 유저의 수를 단계별로 구하고, 전환율을 함께 제시하시오.
with 






-- 3. 장바구니 퍼널 (visit → view_product → add_to_cart → purchase)
-- 다음 퍼널 단계를 가정하고 각 단계에서 몇 명의 유저가 도달했는지 계산하시오.
-- (단, 존재하지 않는 이벤트는 유사하게 임의로 view_product, add_to_cart로 대체하여 사용 가능)


-- 4. 채널별 퍼널 분석
-- 각 유입 채널(channel)별로 visit → signup → purchase 퍼널을 계산하고, 채널별 전환율을 비교하시오.


-- 5. 시간대별 퍼널 전환율 비교
-- 아침(06~12시), 오후(12~18시), 저녁(18~24시), 심야(00~06시)로 나누어 visit → signup 전환율을 비교하시오.



-- 6. 첫 유입 후 1일 이내 전환 퍼널
-- visit 이후 24시간 내에 signup, 그리고 다시 24시간 내에 purchase한 유저의 수를 퍼널 단계별로 구하시오.



-- 7. 장기 미전환 유저 비율
-- signup은 했지만 7일 이내 purchase를 하지 않은 유저의 비율을 구하시오.
-- 또한 전체 가입자 중 미전환 유저 비중을 구하시오.



-- 8. 플랫폼별 퍼널 비교 (web vs mobile)
-- visit → signup → purchase 퍼널을 플랫폼(web/mobile)별로 나누어 유저 수와 전환율을 비교하시오.



-- 9. 복귀 퍼널 (signup → login → purchase)
-- signup 이후 login 기록이 있고, 그 이후 purchase까지 이어진 유저를 분석하시오.
-- (단, login은 반드시 signup 이후에 발생한 것으로 간주)



-- 10. 1주일 간 퍼널 이탈율 추적
-- 최근 7일간(예: 2025-03-25~2025-03-31) 발생한 visit → signup → purchase 퍼널에서
-- user_event일자별 유입 유저 수, 전환율, 이탈율을 일자 기준으로 집계하시오.

















