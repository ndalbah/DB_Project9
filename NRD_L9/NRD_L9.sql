-- connect to SQL PLUS
connect sys/sys as sysdba

-- Create spool file
SPOOL C:\NRD_L9\NRD_L9.txt

-- Run script scott_emp_dept
@ C:\NRD_L9\scott_emp_dept.sql

-- Question #1
SELECT MAX(sal), MIN(sal) 
FROM emp;

-- Question #2
SELECT deptno, SUM(sal), MAX(sal), MIN(sal)
FROM  emp
WHERE job <>'PRESIDENT'
HAVING MIN(sal) > 1000
GROUP BY deptno;

-- Run script 7clearwater
@ C:\NRD_L9\7clearwater.sql

-- Question #3
SELECT item_id, SUM(inv_qoh), MIN(inv_price), MAX(inv_price)
FROM inventory
WHERE inv_size IN ('L', 'M')
HAVING SUM(inv_qoh) > 200
GROUP BY item_id
ORDER BY item_id;

-- Question #4
SELECT item_id, SUM(inv_qoh), MIN(inv_price), MAX(inv_price)
FROM inventory
WHERE inv_size IN ('S', NULL)
HAVING SUM(inv_qoh) > 100
GROUP BY item_id
ORDER BY item_id;

-- Question #5
SELECT inventory.item_id, SUM(inv_qoh), MIN(inv_price), item.item_desc, MAX(inv_price)
FROM inventory, item
WHERE inventory.item_id = item.item_id AND inv_size IN ('S', NULL)
HAVING SUM(inv_qoh) > 100
GROUP BY item.item_desc, inventory.item_id
ORDER BY item_id;

-- Run script 7Northwoods
@ C:\NRD_L9\7Northwoods.sql

-- Question #6
SELECT MAX(s_dob) "Youngest", MIN(s_dob) "Oldest"
FROM student;

-- Question #7
SELECT s_class "Class", MAX(s_dob) "Youngest", MIN(s_dob) "Oldest"
FROM student
GROUP BY s_class;

-- save spool
SPOOL OFF;