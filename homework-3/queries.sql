-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
select c.company_name,
	concat(e.first_name, ' ', e.last_name) as employee_name
from customers as c
full join orders as o
	on o.customer_id = c.customer_id
join employees as e
	on e.employee_id = o.employee_id
join shippers as s
	on s.shipper_id = o.ship_via
where c.city = 'London' and e.city = 'London' and s.company_name = 'United Package'


-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
select p.product_name,
	p.units_in_stock,
	s.contact_name,
	s.phone
from products as p
join suppliers as s
	on p.supplier_id = s.supplier_id
join categories as c
	on p.category_id = c.category_id
where p.units_in_stock < 25 and discontinued <> 1 and c.category_name in ('Dairy Products', 'Condiments')
order by p.units_in_stock


-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
select company_name
from customers a
left join orders b
	on a.customer_id = b.customer_id
where b.order_id is null


-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
select product_name
from products
where product_id in (
	select product_id
	from order_details
	where quantity = 10
)
group by product_name