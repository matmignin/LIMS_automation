SELECT 
  TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')||'000' AS example_date,
  SUBSTR(m.creator, 1, 17) AS create_date,
  (SELECT employeename||DECODE(employeefirstname, NULL, NULL, ', '|| employeefirstname)||DECODE(empid, NULL, NULL, ' ('||empid||')') FROM elnprod.employee
  WHERE empid = REGEXP_SUBSTR(m.creator, '.+$', 18)) AS creator,
  SUBSTR(m.modifier, 1, 17) AS modified_date,
  (SELECT employeename||DECODE(employeefirstname, NULL, NULL, ', '|| employeefirstname)||DECODE(empid, NULL, NULL, ' ('||empid||')') FROM elnprod.employee
  WHERE empid = REGEXP_SUBSTR(m.modifier, '.+$', 18)) AS modifier,
  'N' AS deletion,
  (SELECT description FROM elnprod.domainvalue WHERE $X{EQUAL,UPPER(domainid),PARAM_CONFIG_LIST_REPORT} AND $X{EQUAL,UPPER(value),PARAM_CONFIG_DATE_FORMAT} AND deletion = 'N') AS report_date_format,
  (SELECT description FROM elnprod.domainvalue WHERE $X{EQUAL,UPPER(domainid),PARAM_CONFIG_LIST_REPORT} AND $X{EQUAL,UPPER(value),PARAM_CONFIG_DATETIME_FORMAT} AND deletion = 'N') AS report_date_time_format,
  (SELECT description FROM elnprod.domainvalue WHERE $X{EQUAL,UPPER(domainid),PARAM_CONFIG_LIST_REPORT} AND $X{EQUAL,UPPER(value),PARAM_CONFIG_COMPANY} AND deletion = 'N') AS report_confidential,
  (SELECT 'LMS Version: '||longalphavalue FROM elnprod.systemvalues WHERE $X{EQUAL,systemtypeid,PARAM_CONFIG_SYSTEMTYPEID} AND $X{EQUAL,valuecode,PARAM_CONFIG_VALUECODE}) AS report_lms_version,
  'Database: '||SYS_CONTEXT('USERENV', 'SERVER_HOST') AS report_server,
  (SELECT e.employeename||DECODE(e.employeefirstname,NULL,NULL,', '||e.employeefirstname)||' ('||e.empid||')' FROM elnprod.employee e WHERE $X{EQUAL,e.empid,USERID} ) AS report_print_by
 FROM elnprod.metadata m
 WHERE rownum = 1