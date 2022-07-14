SELECT ID as timesheet_id,Date, Hours, Overtime, Total, IDproject, IDEmployee
INTO ldd.fact_timesheet
FROM ldd.Timesheets
ORDER BY timesheet_id;

ALTER TABLE ldd.fact_timesheet
ALTER COLUMN timesheet_id int NOT NULL;

ALTER TABLE ldd.fact_timesheet
ADD PRIMARY KEY (timesheet_id);

ALTER TABLE ldd.fact_timesheet
ADD FOREIGN KEY (IDproject) REFERENCES ldd.dim_projects(project_id);

ALTER TABLE ldd.fact_timesheet
ADD FOREIGN KEY (IDEmployee) REFERENCES ldd.dim_employees(employee_id);