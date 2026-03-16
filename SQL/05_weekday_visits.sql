-- (Query 5) Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)


select
	extract('dow' from visit_page_date) as dia_semana,
	case 
		when extract('dow' from visit_page_date)=0 then 'domingo'
		when extract('dow' from visit_page_date)=1 then 'segunda-feira'
		when extract('dow' from visit_page_date)=2 then 'terça-feira'
		when extract('dow' from visit_page_date)=3 then 'quarta-feira'
		when extract('dow' from visit_page_date)=4 then 'quinta-feira'
		when extract('dow' from visit_page_date)=5 then 'sexta-feira'
		when extract('dow' from visit_page_date)=6 then 'sábado'
		else null end as "dia da semana",
	count(*) as "visitas (#)"

from sales.funnel
where visit_page_date between '2021-08-01' and '2021-08-31'
group by dia_semana
order by dia_semana
