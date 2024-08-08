select C.id, C.name 
from customers C, locations L
where L.id != C.id;

select C.id, C.name 
from customers C 
left join locations L on C.id = L.id_customers
where L.id_customers is null
order by C.id


select Pr.name, Fr.name 
from products Pr
join providers Fr on Pr.id_providers = Fr.id
where Fr.name ='Ajax SA'

select prod.name, fornec.name, cat.name 
from products prod
join providers fornec on prod.id_providers = fornec.id 
join categories cat on  prod.id_categories = cat.id
where fornec.name ='Sansul SA'
and cat.name ='Imported';

select prod.name , fornec.name, prod.price
from products prod 
join providers fornec on prod.id_providers = fornec.id 
join categories cat on prod.id_categories = cat.id
where prod.price > 1000 
and cat.name = 'Super Luxury';

select cliente.name , pedido.id 
from customers cliente 
join orders pedido on pedido.id_customers = cliente.id 
where pedido.orders_date BETWEEN '2016-01-01' AND '2016-06-30';

select prod.name 
from products prod 
join providers fornec on prod.id_providers = fornec.id
where prod.amount between 10 and 20 
and fornec.name like 'P%';