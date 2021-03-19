SUM:
mysql> select sum(math) from exam_result;
mysql> select sum(math) from exam_result where math < 70;
AVG: 
mysql> select AVG(math) from exam_result;
MAX: 
mysql> select MAX(math) from exam_result;
MIN: 查找数学成绩大于70分的，最低分。 
mysql> select MIN(math) from exam_result where math > 70;