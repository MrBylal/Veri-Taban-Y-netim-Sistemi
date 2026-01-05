create trigger  TRG_AfterPowerupInsert
onpowerup
after insert
as
begin
set nocount on;
insert into  user_powerups (user_id,powerup_id,quantity)
select u.user_id,i.powerup_id,0
from users u
cross join inserted i;
end;
go;

create trigger TRG_AfterUserInsert
on users
after insert
as
begin
set nocount on;
insert into user_powerups (user_id, powerup_id, quantity)
select
i.user_id,p.powerup_id,0
from inserted i
cross join powerup p;
end;
go;
create trigger user_life_log
on users
after insert
as
begin
insert into Lives(user_id,last_life_given_at)
select user_id,getdate()
from inserted
end;
go;