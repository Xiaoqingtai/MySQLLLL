-- 删除孙悟空同学的考试成绩 
mysql> select * from exam_result;
mysql> delete from exam_result where name = '孙悟空';
--只要是姓名符合，都将被删除
--直接删除表：会删除表内的所有的数据，但是，这张表还是存在 的，只不过里面没有数据了！！

--NULL约束
drop table if exists student; create table student( id int, sn int, name varchar(20) NOT NULL,qq_mail varchar(20) );
--UNIQUE 唯一约束
drop table if exists student; create table student( id int, sn int unique, name varchar(20) NOT NULL, qq_mail varchar(20) );
--DEFAULT 默认值约束：
drop table if exists student; create table student( id int, sn int unique, name varchar(20) NOT NULL, qq_mail varchar(20) DEFAULT '110@qq.com' );
--进行插入：
mysql> insert into student(id,sn,name,qq_mail) values(1,101,'bit','123@qq.com'); Query OK, 1 row affected (0.01 sec)
--到底怎么体现默认值呢？
mysql> insert into student(id,sn,name) values(3,103,'bit3');
-- 在此时只要不指定列，不给qq_mail任何值。

--primary key 主键约束：
--她是NOT NULL 和 UNIQUE的结合。
--也就是说，当一个字段被PRIMARY KEY 修饰后，
--那么这个 字段就是不能为空且是独一无二的！！！ 
--因为是独一无二的，所以，一般搭配：auto_increment;
--创建表：
drop table if exists student; 
create table student( 
id int PRIMARY KEY AUTO_INCREMENT, 
sn int unique, name varchar(20) NOT NULL, 
qq_mail varchar(20) DEFAULT '110@qq.com' 
);

--当创建好表之后，表中没有任何的数据，当第一次执行插入的时 候，当前主键，也就是ID，会自动从1开始。
--当我将刚刚插入的数据删除后，再次进行插入的时候，就会在原 来的基础，也就是上一次最后插入的语句的ID上开始加1；
--只有当你把整个表都删除了，那么你再次插入的时候，才是从1开 始的！！！

--FOREIGN KEY 外键约束 
--外键用于关联其他表的主键或唯一键，
--语法：foreign key (字段 名) references 主表(列)
drop table if exists classes; 
create table classes( 
id int PRIMARY KEY AUTO_INCREMENT, 
name varchar(20), 
`desc` varchar(30) );
drop table if exists student; 
create table student( 
id int PRIMARY KEY AUTO_INCREMENT, 
sn int unique, 
name varchar(20) NOT NULL,
qq_mail varchar(20) DEFAULT '110@qq.com' ,
classes_id int, 
FOREIGN KEY (classes_id) REFERENCES classes(id) 
);
-- classes_id就是外键，关联的是classes这张表的id字段 
--这样做：安全！！！
--1、插入数据： 问题：请问应该先插入哪个表？？？
--答案是：先插入主表！！

--CHECK约束
drop table if exists test_user; 
create table test_user ( 
id int, name varchar(20), 
sex varchar(1), 
heck (sex ='男' or sex='女') 
); 
--将来在插入数据的时候，只能插入sex为男或者女。 
mysql> insert into test_user values(1,'bit','哈'); 
Query OK, 1 row affected (0.01 sec)

