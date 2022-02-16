SELECT
	-- Ingredient info
	i.generic2 AS ingredient_group,
	i.ingredientid,
	i.generic1 AS label_claim,
   	-- Ingredient Test Result info
	-- Ingredient name/description
	CASE
		WHEN UPPER(i.ingredientid) LIKE 'MULTI-PART INGREDIENT LIST%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(i2.ingredientid) LIKE 'MULTI%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT A%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT A%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT B%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT B%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT C%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT C%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT D%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT D%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT E%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT E%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT F%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT F%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT G%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT G%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT H%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT H%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT I%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT I%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT J%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT J%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT K%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT K%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT L%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT L%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT M%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT M%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT N%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT N%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT O%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT O%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT P%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT P%' AND i2.formulationguid = i.formulationguid)
		WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT Q%'
		THEN
			(SELECT LISTAGG(i2.description) WITHIN GROUP (ORDER BY i2.ingredientid)
			 FROM ingredient i2
			 WHERE UPPER(ingredientid) LIKE 'GENERIC INGREDIENT Q%' AND i2.formulationguid = i.formulationguid)
		ELSE i.description
	END AS ingredient,
	-- Result display value
	CASE
		WHEN tr.resulttype = 'LIST'
			AND (tr.resultvaluation <> 'SKIP LOT' OR tr.resultvaluation IS NULL)
		THEN
			DECODE(t.requirement, NULL, trr.listvalue, t.requirement)
		WHEN tr.resulttype <> 'LIST'
		AND (tr.resultvaluation <> 'SKIP LOT' OR tr.resultvaluation IS NULL)
		THEN
			DECODE(tr.resulttype,NULL,NULL,tr.requirement)
		ELSE
			''
	END AS specification_range,
CASE
		WHEN tr.resulttype = 'NUMERIC'
			AND tr.status = 70
			AND (tr.resultvaluation <> 'SKIP LOT' OR tr.resultvaluation IS NULL)
		THEN
			tr.prefix||TRIM(TO_CHAR(REGEXP_SUBSTR(REPLACE(tr.numericalresulttext,tr.prefix,''),'^\d+'),'999,999,999'))
			|| CASE
					WHEN INSTR(tr.numericalresulttext,'.') > 0
					THEN
						SUBSTR(tr.numericalresulttext,INSTR(tr.numericalresulttext,'.'))
						END
				|| DECODE(tr.unit,NULL,NULL,' '||tr.unit)
		WHEN tr.resulttype IN ('LIST','TEXT')
				AND tr.status = 70
				AND (tr.resultvaluation <> 'SKIP LOT' OR tr.resultvaluation IS NULL)
		THEN
			tr.textresult || DECODE(tr.unit,NULL,NULL,' ' ||tr.unit)
		 WHEN tr.status = 10
			AND (tr.resultvaluation <> 'SKIP LOT' OR tr.resultvaluation IS NULL)
		THEN
			 'pending'
		ELSE
			CASE
				WHEN UPPER(i.ingredientid) LIKE 'INGREDIENT NOTE%'
					OR UPPER(i.ingredientid) LIKE 'MULTI-PART INGREDIENT LIST%'
					AND i.generic3 IS NULL
				THEN
					''
				WHEN UPPER(i.ingredientid) LIKE 'GENERIC INGREDIENT%'
					AND i.generic3 IS NULL
				THEN
					'Not Tested'
				WHEN i.generic3 IS NOT NULL
				THEN
					i.generic3
				ELSE 'Not Tested'
			END
	END AS result,
	tr.resultdate  AS test_date,
				-- Method
				CASE
					WHEN (tr.resultvaluation <> 'SKIP LOT'
						OR tr.resultvaluation IS NULL)
					THEN
						sm.description
					ELSE  ''
				END AS method,
	tr.generic01   AS notebook_ref,
	tr.status,
	(SELECT dv.description
	FROM domainvalue dv
	WHERE UPPER(dv.domainid) = 'REPORT PARAMETERS'
	AND UPPER(dv.value)      = 'DATE FORMAT'
	AND dv.deletion          = 'N'
	) AS report_date_format,
	tr.resulttype,
	tr.resultguid
FROM
		(SELECT sampleguid, formulationid FROM (
		SELECT ps.sampleguid, ps.formulationid,
		CASE
			WHEN ps.configurationid = 'I, Analytical' THEN 1
			WHEN ps.configurationid = 'CT, Analytical' THEN 2
			WHEN ps.configurationid = 'I, Physical' THEN 3
			WHEN ps.configurationid = 'CT, Physical' THEN 4
			ELSE 100
		END sample_order
		FROM physicalsample ps
		WHERE ps.batchnumber = $P{INGBATCHNUMBER}
			AND ps.deletion = 'N'
		ORDER BY sample_order
		)
		WHERE ROWNUM = 1
		) psi
		JOIN formulation f ON f.formulationid = psi.formulationid
				AND f.deletion = 'N'
		JOIN ingredient i ON i.formulationguid = f.formulationguid
				AND i.deletion = 'N'
		LEFT JOIN testresult tr
ON tr.sampleguid = psi.sampleguid
	AND UPPER(tr.resultid) = UPPER(i.ingredientid)
	AND tr.deletion = 'N'
		AND tr.flagisfinalresult = 'Y'
LEFT JOIN test t ON t.testguid  = tr.testguid
	AND t.deletion = 'N'
LEFT JOIN smmethod sm ON sm.methodid   = t.methodid
	AND sm.versionno = t.methodversionno
	AND sm.deletion  = 'N'
LEFT JOIN testresultrequirement trr
	ON trr.resultguid = tr.resultguid
	AND trr.valuationcode = 1
WHERE NOT(UPPER(ingredientid) LIKE 'MULTI%'
	AND SUBSTR(ingredientid,-1,1) <> 1)
	AND NOT(UPPER(ingredientid) LIKE 'GENERIC INGREDIENT%'
	AND SUBSTR(ingredientid,-1,1) <> 1)
ORDER BY i.position