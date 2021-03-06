
# 求每个班级成绩的top3学生

#定义存储过程
delimiter $$
drop procedure if exists wk;
create procedure wk()
begin
declare i int;
declare n int;
set i=1;
set n=(select count(1) from (select * from student group by c_id) c);
while i<=n do
select * from student where c_id=i order by score limit 3;
set i=i+1;
end while;
end $$
delimiter ;
call wk();



#sql语句

select  *  from student t where 
(select count(1)+1 from student where c_id=t.c_id and score>t.score) <= 3 
order by t.c_id, t.score desc
