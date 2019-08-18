mysql> select * from p1;
+------+------+
| a    | b    |
+------+------+
|    1 |    2 |
|    2 |    2 |
|    3 |    3 |
|    1 |    4 |
+------+------+
4 rows in set (0.00 sec)

mysql> select * from p2;
+------+------+
| b    | c    |
+------+------+
|    1 |    2 |
|    2 |    2 |
|    3 |    3 |
+------+------+
3 rows in set (0.00 sec)

mysql> select * from p1 left join p2 on p1.b = p2.b;
+------+------+------+------+
| a    | b    | b    | c    |
+------+------+------+------+
|    1 |    2 |    2 |    2 |
|    2 |    2 |    2 |    2 |
|    3 |    3 |    3 |    3 |
|    1 |    4 | NULL | NULL |
+------+------+------+------+
4 rows in set (0.00 sec)

mysql> select * from p1 right join p2 on p1.b = p2.b;
+------+------+------+------+
| a    | b    | b    | c    |
+------+------+------+------+
|    1 |    2 |    2 |    2 |
|    2 |    2 |    2 |    2 |
|    3 |    3 |    3 |    3 |
| NULL | NULL |    1 |    2 |
+------+------+------+------+
4 rows in set (0.00 sec)

mysql> select * from p1 left join p2 on p1.b = p2.b union select * from p1 right join p2 on p1.b = p2.b;
+------+------+------+------+
| a    | b    | b    | c    |
+------+------+------+------+
|    1 |    2 |    2 |    2 |
|    2 |    2 |    2 |    2 |
|    3 |    3 |    3 |    3 |
|    1 |    4 | NULL | NULL |
| NULL | NULL |    1 |    2 |
+------+------+------+------+
5 rows in set (0.00 sec)

mysql> select * from p1 left join p2 on p1.b = p2.b union all select * from p1 right join p2 on p1.b = p2.b;
+------+------+------+------+
| a    | b    | b    | c    |
+------+------+------+------+
|    1 |    2 |    2 |    2 |
|    2 |    2 |    2 |    2 |
|    3 |    3 |    3 |    3 |
|    1 |    4 | NULL | NULL |
|    1 |    2 |    2 |    2 |
|    2 |    2 |    2 |    2 |
|    3 |    3 |    3 |    3 |
| NULL | NULL |    1 |    2 |
+------+------+------+------+
8 rows in set (0.00 sec)


