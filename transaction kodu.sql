create procedure order_take
@user_id int,
@powerup_id int,
@quantity int as
begin
begin transaction
begin try
insert into orders(user_id,powerup_id,quantity)
values (@user_id,@powerup_id,@quantity);
update user_powerups
set quantity=quantity+@quantity
where user_id=@user_id and powerup_id=@powerup_id;
if(@@ROWCOUNT=0)
begin
THROW 50001, 'Hata: The specified user or powerup could not be found.', 1;
end
commit transaction;
print 'order completed successfully';
end try
begin catch
rollback transaction;
print 'there is an error:'+Error_message()
end catch
end;
