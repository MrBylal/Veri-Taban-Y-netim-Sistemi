create procedure life_refill
as
begin
set nocount on;
update Lives
set remaining_life=remaining_life+1,
last_life_given_at=getdate()
where remaining_life<5
and datediff(minute,last_life_given_at,getdate())>=15;
end;

go;
create procedure user_order_count
@user_id int,
@powerup_id int,
@count int
as
begin
select @count=isnull(sum(quantity),0)
from orders
where user_id=@user_id and powerup_id=@powerup_id;
end;

go;