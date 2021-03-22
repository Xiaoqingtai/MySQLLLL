--现在有员工表、部门表和薪资表。部门表depart的字段有depart_id， name；员工表 staff 的字段有 staff_id， name， age， depart_id；薪资表salary 的字段有 salary_id，staff_id，salary，month。
--（问题a）：求每个部门'2016-09'月份的部门薪水总额
--（问题b）：求每个部门的部门人数，要求输出部门名称和人数
--（问题c）：求公司每个部门的月支出薪资数，要求输出月份和本月薪资总数

select dep.name,
sum(sal.salary) from salary sal
from salary sal 
join staff sta on sal.staff_id=sta.staff_id
join depart dep on sta.depart_id=dep.depart_id
where year(sal.month)=2016
and month(sal.month)=9
group by dep.depart_id;