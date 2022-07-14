SELECT p.ID as project_id, p.Name as project_name, cl.Name as client_name, cntry.Name as country_name, com.Name as complexity, s.Name as stage, ss.Name as support_status, p.LastTimesheet
INTO ldd.dim_projects
FROM ldd.Projects as p
LEFT JOIN ldd.Clients as cl
ON p.IDClient = cl.ID
LEFT JOIN ldd.Countries as cntry
ON p.IDCountry=cntry.ID
LEFT JOIN ldd.Complexities as com
ON p.IDComplexity = com.ID
LEFT JOIN ldd.Stages as s
ON p.IDStage = s.ID
LEFT JOIN ldd.SupportStatuses as ss
ON p.IDSupportStatus=ss.ID
ORDER BY project_id;

ALTER TABLE ldd.dim_projects
ALTER COLUMN project_id int NOT NULL;

ALTER TABLE ldd.dim_projects
ADD PRIMARY KEY (project_id);