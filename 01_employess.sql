SELECT  e1.ID as employee_id,  e1.DisplayName as employee_name, e1.Position as position, e1.Active as active, e2.DisplayName as manager_name, dep.Name as department_name
INTO ldd.dim_employees
FROM ldd.Employees as e1
LEFT JOIN ldd.Employees as e2
ON e1.IDManager = e2.ID
LEFT JOIN ldd.Departments as dep
ON e1.IDDepartment = dep.ID
ORDER BY e1.ID;

ALTER TABLE ldd.dim_employees
ALTER COLUMN employee_id int NOT NULL;

ALTER TABLE ldd.dim_employees
ADD PRIMARY KEY (employee_id);


