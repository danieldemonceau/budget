psql -Upostgres -h***
password
DROP DATABASE budget;
CREATE DATABASE budget WITH OWNER ***;
\c budget ***
***

psql -U*** -h*** -dbudget

DROP TABLE category CASCADE;
CREATE TABLE category (
	catid	integer NOT NULL UNIQUE PRIMARY KEY,
	name	varchar(20),
	budget	double precision
);

INSERT INTO category (catid, name, budget) VALUES (1, 'Salary', -2072.92);
INSERT INTO category (catid, name, budget) VALUES (2, 'Savings', -1000);
INSERT INTO category (catid, name, budget) VALUES (3, 'Housing', 500);
INSERT INTO category (catid, name, budget) VALUES (4, 'Food/Household', 200);
INSERT INTO category (catid, name, budget) VALUES (5, 'Leisure', 150);
INSERT INTO category (catid, name, budget) VALUES (6, 'Health', 50);
INSERT INTO category (catid, name, budget) VALUES (7, 'Transportation', 80);
INSERT INTO category (catid, name, budget) VALUES (8, 'Bank fees	', 5);
INSERT INTO category (catid, name, budget) VALUES (9, 'Car', 0);
INSERT INTO category (catid, name, budget) VALUES (10, 'Gifts', 75);
INSERT INTO category (catid, name, budget) VALUES (11, 'Phone', 20);
INSERT INTO category (catid, name, budget) VALUES (12, 'Interest', 0);
INSERT INTO category (catid, name, budget) VALUES (13, 'Barber', 7.5);

DROP TABLE statement CASCADE;
CREATE TABLE statement (
	transid	serial NOT NULL UNIQUE PRIMARY KEY,
	transdate	date NOT NULL,
	amount	double precision NOT NULL,
	description	varchar(100) NOT NULL,
	valuedate	date,
	funds	double precision NOT NULL,
	catid	integer
);

INSERT INTO STATEMENT (transid, transdate, amount, description, funds, catid) VALUES (94, to_date('19/03/17', 'DD/MM/YY'), -1200 ,'Transfer to xx0972 NetBank', 1102.06, 2);
[...]

DROP VIEW W0102;
CREATE VIEW W0102 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('02/01/2017', 'DD/MM/YYYY') AND to_date('15/01/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W0304;
CREATE VIEW W0304 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('16/01/2017', 'DD/MM/YYYY') AND to_date('29/01/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W0506;
CREATE VIEW W0506 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('30/01/2017', 'DD/MM/YYYY') AND to_date('12/02/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W0708;
CREATE VIEW W0708 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('13/02/2017', 'DD/MM/YYYY') AND to_date('26/02/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W0910;
CREATE VIEW W0910 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('27/02/2017', 'DD/MM/YYYY') AND to_date('12/03/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W1112;
CREATE VIEW W1112 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('13/03/2017', 'DD/MM/YYYY') AND to_date('26/03/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W1314;
CREATE VIEW W1314 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('27/03/2017', 'DD/MM/YYYY') AND to_date('09/04/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W1516;
CREATE VIEW W1516 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('10/04/2017', 'DD/MM/YYYY') AND to_date('23/04/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W1718;
CREATE VIEW W1718 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('24/04/2017', 'DD/MM/YYYY') AND to_date('07/05/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W1920;
CREATE VIEW W1920 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('08/05/2017', 'DD/MM/YYYY') AND to_date('21/05/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W2122;
CREATE VIEW W2122 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('22/05/2017', 'DD/MM/YYYY') AND to_date('04/06/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W2324;
CREATE VIEW W2324 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('05/06/2017', 'DD/MM/YYYY') AND to_date('18/06/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W2526;
CREATE VIEW W2526 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('19/06/2017', 'DD/MM/YYYY') AND to_date('02/07/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W2728;
CREATE VIEW W2728 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('03/07/2017', 'DD/MM/YYYY') AND to_date('16/07/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W2930;
CREATE VIEW W2930 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('17/07/2017', 'DD/MM/YYYY') AND to_date('30/07/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W3132;
CREATE VIEW W3132 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('31/07/2017', 'DD/MM/YYYY') AND to_date('13/08/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W3334;
CREATE VIEW W3334 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('14/08/2017', 'DD/MM/YYYY') AND to_date('27/08/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W3536;
CREATE VIEW W3536 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('28/08/2017', 'DD/MM/YYYY') AND to_date('10/09/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W3738;
CREATE VIEW W3738 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('11/09/2017', 'DD/MM/YYYY') AND to_date('24/09/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W3940;
CREATE VIEW W3940 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('25/09/2017', 'DD/MM/YYYY') AND to_date('08/10/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W4142;
CREATE VIEW W4142 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('09/10/2017', 'DD/MM/YYYY') AND to_date('22/10/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W4344;
CREATE VIEW W4344 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('23/10/2017', 'DD/MM/YYYY') AND to_date('05/11/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W4546;
CREATE VIEW W4546 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('06/11/2017', 'DD/MM/YYYY') AND to_date('19/11/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W4748;
CREATE VIEW W4748 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('20/11/2017', 'DD/MM/YYYY') AND to_date('03/12/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W4950;
CREATE VIEW W4950 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('04/12/2017', 'DD/MM/YYYY') AND to_date('17/12/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;
DROP VIEW W5152;
CREATE VIEW W5152 AS SELECT c.name category, c.budget budget, coalesce(sum(s.amount), 0) balance, coalesce((c.budget + sum(s.amount)), 0) saving FROM statement s RIGHT JOIN category c ON s.catid = c.catid WHERE s.transdate BETWEEN to_date('18/12/2017', 'DD/MM/YYYY') AND to_date('31/12/2017', 'DD/MM/YYYY') GROUP BY c.catid order by c.catid;

SELECT * FROM W0102;
SELECT * FROM W0304;
SELECT * FROM W0506;
SELECT * FROM W0708;
SELECT * FROM W0910;
SELECT * FROM W1112;
SELECT * FROM W1314;
SELECT * FROM W1516;
SELECT * FROM W1718;
SELECT * FROM W1920;
SELECT * FROM W2122;
SELECT * FROM W2324;
SELECT * FROM W2526;
SELECT * FROM W2728;
SELECT * FROM W2930;
SELECT * FROM W3132;
SELECT * FROM W3334;
SELECT * FROM W3536;
SELECT * FROM W3738;
SELECT * FROM W3940;
SELECT * FROM W4142;
SELECT * FROM W4344;
SELECT * FROM W4546;
SELECT * FROM W4748;
SELECT * FROM W4950;
SELECT * FROM W5152;

SELECT cat.name category, cat.budget,
-- to_char(coalesce(w0102.balance, 0), '99999.00') "w0102 b", to_char(cat.budget + coalesce(w0102.balance, 0), '99999.00') "w0102 s",
-- to_char(coalesce(w0304.balance, 0), '99999.00') "w0304 b", to_char(cat.budget + coalesce(w0304.balance, 0), '99999.00') "w0304 s",
-- to_char(coalesce(w0506.balance, 0), '99999.00') "w0506 b", to_char(cat.budget + coalesce(w0506.balance, 0), '99999.00') "w0506 s",
-- to_char(coalesce(w0708.balance, 0), '99999.00') "w0708 b", to_char(cat.budget + coalesce(w0708.balance, 0), '99999.00') "w0708 s",
-- to_char(coalesce(w0910.balance, 0), '99999.00') "w0910 b", to_char(cat.budget + coalesce(w0910.balance, 0), '99999.00') "w0910 s",
to_char(coalesce(w1112.balance, 0), '99999.00') "w1112 b", to_char(cat.budget + coalesce(w1112.balance, 0), '99999.00') "w1112 s",
to_char(coalesce(w1314.balance, 0), '99999.00') "w1314 b", to_char(cat.budget + coalesce(w1314.balance, 0), '99999.00') "w1314 s",
to_char(coalesce(w1516.balance, 0), '99999.00') "w1516 b", to_char(cat.budget + coalesce(w1516.balance, 0), '99999.00') "w1516 s",
to_char(coalesce(w1718.balance, 0), '99999.00') "w1718 b", to_char(cat.budget + coalesce(w1718.balance, 0), '99999.00') "w1718 s",
to_char(coalesce(w1920.balance, 0), '99999.00') "w1920 b", to_char(cat.budget + coalesce(w1920.balance, 0), '99999.00') "w1920 s",
to_char(coalesce(w2122.balance, 0), '99999.00') "w2122 b", to_char(cat.budget + coalesce(w2122.balance, 0), '99999.00') "w2122 s",
to_char(coalesce(w2324.balance, 0), '99999.00') "w2324 b", to_char(cat.budget + coalesce(w2324.balance, 0), '99999.00') "w2324 s",
-- to_char(coalesce(w2526.balance, 0), '99999.00') "w2526 b", to_char(cat.budget + coalesce(w2526.balance, 0), '99999.00') "w2526 s",
-- to_char(coalesce(w2728.balance, 0), '99999.00') "w2728 b", to_char(cat.budget + coalesce(w2728.balance, 0), '99999.00') "w2728 s",
-- to_char(coalesce(w2930.balance, 0), '99999.00') "w2930 b", to_char(cat.budget + coalesce(w2930.balance, 0), '99999.00') "w2930 s",
-- to_char(coalesce(w3132.balance, 0), '99999.00') "w3132 b", to_char(cat.budget + coalesce(w3132.balance, 0), '99999.00') "w3132 s",
-- to_char(coalesce(w3334.balance, 0), '99999.00') "w3334 b", to_char(cat.budget + coalesce(w3334.balance, 0), '99999.00') "w3334 s",
-- to_char(coalesce(w3536.balance, 0), '99999.00') "w3536 b", to_char(cat.budget + coalesce(w3536.balance, 0), '99999.00') "w3536 s",
-- to_char(coalesce(w3738.balance, 0), '99999.00') "w3738 b", to_char(cat.budget + coalesce(w3738.balance, 0), '99999.00') "w3738 s",
-- to_char(coalesce(w3940.balance, 0), '99999.00') "w3940 b", to_char(cat.budget + coalesce(w3940.balance, 0), '99999.00') "w3940 s",
-- to_char(coalesce(w4142.balance, 0), '99999.00') "w4142 b", to_char(cat.budget + coalesce(w4142.balance, 0), '99999.00') "w4142 s",
-- to_char(coalesce(w4344.balance, 0), '99999.00') "w4344 b", to_char(cat.budget + coalesce(w4344.balance, 0), '99999.00') "w4344 s",
-- to_char(coalesce(w4546.balance, 0), '99999.00') "w4546 b", to_char(cat.budget + coalesce(w4546.balance, 0), '99999.00') "w4546 s",
-- to_char(coalesce(w4748.balance, 0), '99999.00') "w4748 b", to_char(cat.budget + coalesce(w4748.balance, 0), '99999.00') "w4748 s",
-- to_char(coalesce(w4950.balance, 0), '99999.00') "w4950 b", to_char(cat.budget + coalesce(w4950.balance, 0), '99999.00') "w4950 s",
-- to_char(coalesce(w5152.balance, 0), '99999.00') "w5152 b", to_char(cat.budget + coalesce(w5152.balance, 0), '99999.00') "w5152 s",
to_char(
-- cat.budget + coalesce(w0102.balance, 0)
-- + cat.budget + coalesce(w0304.balance, 0)
-- + cat.budget + coalesce(w0506.balance, 0)
-- + cat.budget + coalesce(w0708.balance, 0)
-- + cat.budget + coalesce(w0910.balance, 0)
cat.budget + coalesce(w1112.balance, 0)
+ cat.budget + coalesce(w1314.balance, 0)
+ cat.budget + coalesce(w1516.balance, 0)
+ cat.budget + coalesce(w1718.balance, 0)
+ cat.budget + coalesce(w1920.balance, 0)
+ cat.budget + coalesce(w2122.balance, 0)
+ cat.budget + coalesce(w2324.balance, 0)
-- + cat.budget + coalesce(w2526.balance, 0)
-- + cat.budget + coalesce(w2728.balance, 0)
-- + cat.budget + coalesce(w2930.balance, 0)
-- + cat.budget + coalesce(w3132.balance, 0)
-- + cat.budget + coalesce(w3334.balance, 0)
-- + cat.budget + coalesce(w3536.balance, 0)
-- + cat.budget + coalesce(w3738.balance, 0)
-- + cat.budget + coalesce(w3940.balance, 0)
-- + cat.budget + coalesce(w4142.balance, 0)
-- + cat.budget + coalesce(w4344.balance, 0)
-- + cat.budget + coalesce(w4546.balance, 0)
-- + cat.budget + coalesce(w4748.balance, 0)
-- + cat.budget + coalesce(w4950.balance, 0)
-- + cat.budget + coalesce(w5152.balance, 0)
, '99999.00') "Total"
FROM category cat
LEFT JOIN w0102 ON cat.name = w0102.category
LEFT JOIN w0304 ON cat.name = w0304.category
LEFT JOIN w0506 ON cat.name = w0506.category
LEFT JOIN w0708 ON cat.name = w0708.category
LEFT JOIN w0910 ON cat.name = w0910.category
LEFT JOIN w1112 ON cat.name = w1112.category
LEFT JOIN w1314 ON cat.name = w1314.category
LEFT JOIN w1516 ON cat.name = w1516.category
LEFT JOIN w1718 ON cat.name = w1718.category
LEFT JOIN w1920 ON cat.name = w1920.category
LEFT JOIN w2122 ON cat.name = w2122.category
LEFT JOIN w2324 ON cat.name = w2324.category
LEFT JOIN w2526 ON cat.name = w2526.category
LEFT JOIN w2728 ON cat.name = w2728.category
LEFT JOIN w2930 ON cat.name = w2930.category
LEFT JOIN w3132 ON cat.name = w3132.category
LEFT JOIN w3334 ON cat.name = w3334.category
LEFT JOIN w3536 ON cat.name = w3536.category
LEFT JOIN w3738 ON cat.name = w3738.category
LEFT JOIN w3940 ON cat.name = w3940.category
LEFT JOIN w4142 ON cat.name = w4142.category
LEFT JOIN w4344 ON cat.name = w4344.category
LEFT JOIN w4546 ON cat.name = w4546.category
LEFT JOIN w4748 ON cat.name = w4748.category
LEFT JOIN w4950 ON cat.name = w4950.category
LEFT JOIN w5152 ON cat.name = w5152.category
ORDER BY cat.catid;
