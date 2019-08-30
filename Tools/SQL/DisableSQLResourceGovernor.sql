DROP workload GROUP AX_BATCH_WORKGROUP ON DATABASE
GO
DROP workload GROUP AX_ONLINE_WORKGROUP ON DATABASE
GO
ALTER workload GROUP "default" ON DATABASE 
WITH (MIN_CPU_PERCENT = 100
	,MAX_CPU_PERCENT = 100
	,MIN_LOG_RATE_PERCENT = 100
	,MAX_LOG_RATE_PERCENT = 100
	,MIN_IOPS_PERCENT = 100
	,MAX_IOPS_PERCENT = 100)
GO
ALTER RESOURCE GOVERNOR ON DATABASE WITH
(CLASSIFIER_FUNCTION=NULL)
GO
ALTER RESOURCE GOVERNOR ON DATABASE reconfigure
GO
-- this is just to set the AX configuration to an initial state
UPDATE AXClassificationTable SET CONFIGUREDDATETIME = NULL
 
-- check the results
SELECT * FROM sys.resource_governor_configuration
SELECT * FROM axclassificationtable 
SELECT * FROM SYS.DATABASE_RESOURCE_GOVERNOR_WORKLOAD_GROUPS 