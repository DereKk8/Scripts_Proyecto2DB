SELECT AA3.NOMBRE, AA3.SEXO, AA3.NUM_CITA, AA3.MONTO_RECLAMADO, AA3.MONTO_DEBITADO,(AA3.MONTO_RECLAMADO - AA3.MONTO_DEBITADO) AS DIFERENCIA
FROM
(
    -- Subconsulta para obtener los datos originales
    SELECT A2.NOMBRE, A2.SEXO, A2.ID, A2.NUM_CITA, C3.MONTO_RECLAMADO, C4.MONTO_DEBITADO
    FROM 
    (
        -- Subconsulta para obtener los datos base
        SELECT B1.NOMBRE, B1.SEXO, B1.ID, B2.NUM_CITA
        FROM
        (
            SELECT A1.CEDULA, A1.NOMBRE, A1.SEXO, CITA.ID
            FROM
            (
                SELECT CEDULA, NOMBRE, SEXO
                FROM PACIENTE
            ) A1
            INNER JOIN CITA ON A1.CEDULA = CITA.PACIENTE_CEDULA
        ) B1
        INNER JOIN 
        (
            SELECT C1.NOMBRE, COUNT(CITA.ID) AS NUM_CITA
            FROM
            (
                SELECT CEDULA, NOMBRE, SEXO
                FROM PACIENTE
            ) C1
            INNER JOIN CITA ON C1.CEDULA = CITA.PACIENTE_CEDULA
            GROUP BY C1.NOMBRE
        ) B2 ON B2.NOMBRE = B1.NOMBRE
    ) A2
    INNER JOIN RECLAMO ON A2.ID = RECLAMO.CITA_ID
    INNER JOIN
    (
        -- Subconsulta para obtener la suma de MONTO_RECLAMADO
        SELECT 'Total' AS NOMBRE, 'Total' AS SEXO, SUM(RECLAMO.MONTO_RECLAMADO) AS MONTO_RECLAMADO, RECLAMO.CITA_ID
        FROM
        (
            SELECT *
            FROM
            (
                SELECT A1.CEDULA, A1.NOMBRE, A1.SEXO, CITA.ID
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) A1
                INNER JOIN CITA ON A1.CEDULA = CITA.PACIENTE_CEDULA
            ) B1
            INNER JOIN 
            (
                SELECT C1.NOMBRE, COUNT(CITA.ID) AS NUM_CITA
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) C1
                INNER JOIN CITA ON C1.CEDULA = CITA.PACIENTE_CEDULA
                GROUP BY C1.NOMBRE
            ) B2 ON B2.NOMBRE = B1.NOMBRE
        ) A2
        INNER JOIN RECLAMO ON A2.ID = RECLAMO.CITA_ID
        GROUP BY RECLAMO.CITA_ID
    ) C3 ON C3.CITA_ID = RECLAMO.CITA_ID
    INNER JOIN
    (
        -- Subconsulta para obtener la suma de MONTO_DEBITADO
        SELECT 'Total' AS NOMBRE, 'Total' AS SEXO, SUM(RECLAMO.MONTO_DEBITADO) AS MONTO_DEBITADO, RECLAMO.CITA_ID
        FROM
        (
            SELECT *
            FROM
            (
                SELECT A1.CEDULA, A1.NOMBRE, A1.SEXO, CITA.ID
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) A1
                INNER JOIN CITA ON A1.CEDULA = CITA.PACIENTE_CEDULA
            ) B1
            INNER JOIN 
            (
                SELECT C1.NOMBRE, COUNT(CITA.ID) AS NUM_CITA
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) C1
                INNER JOIN CITA ON C1.CEDULA = CITA.PACIENTE_CEDULA
                GROUP BY C1.NOMBRE
            ) B2 ON B2.NOMBRE = B1.NOMBRE
        ) A2
        INNER JOIN RECLAMO ON A2.ID = RECLAMO.CITA_ID
        GROUP BY RECLAMO.CITA_ID
    ) C4 ON C4.CITA_ID = RECLAMO.CITA_ID
    
    UNION ALL
    
    -- Subconsulta para agregar la fila de totales
    SELECT 'Total', 'Total', NULL, NULL, SUM(C3.MONTO_RECLAMADO), SUM(C4.MONTO_DEBITADO)
    FROM 
    (
        SELECT B1.NOMBRE, B1.SEXO, B1.ID, B2.NUM_CITA
        FROM
        (
            SELECT A1.CEDULA, A1.NOMBRE, A1.SEXO, CITA.ID
            FROM
            (
                SELECT CEDULA, NOMBRE, SEXO
                FROM PACIENTE
            ) A1
            INNER JOIN CITA ON A1.CEDULA = CITA.PACIENTE_CEDULA
        ) B1
        INNER JOIN 
        (
            SELECT C1.NOMBRE, COUNT(CITA.ID) AS NUM_CITA
            FROM
            (
                SELECT CEDULA, NOMBRE, SEXO
                FROM PACIENTE
            ) C1
            INNER JOIN CITA ON C1.CEDULA = CITA.PACIENTE_CEDULA
            GROUP BY C1.NOMBRE
        ) B2 ON B2.NOMBRE = B1.NOMBRE
    ) A2
    INNER JOIN RECLAMO ON A2.ID = RECLAMO.CITA_ID
    INNER JOIN
    (
        SELECT 'Total' AS NOMBRE, 'Total' AS SEXO, SUM(RECLAMO.MONTO_RECLAMADO) AS MONTO_RECLAMADO, RECLAMO.CITA_ID
        FROM
        (
            SELECT *
            FROM
            (
                SELECT A1.CEDULA, A1.NOMBRE, A1.SEXO, CITA.ID
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) A1
                INNER JOIN CITA ON A1.CEDULA = CITA.PACIENTE_CEDULA
            ) B1
            INNER JOIN 
            (
                SELECT C1.NOMBRE, COUNT(CITA.ID) AS NUM_CITA
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) C1
                INNER JOIN CITA ON C1.CEDULA = CITA.PACIENTE_CEDULA
                GROUP BY C1.NOMBRE
            ) B2 ON B2.NOMBRE = B1.NOMBRE
        ) A2
        INNER JOIN RECLAMO ON A2.ID = RECLAMO.CITA_ID
        GROUP BY RECLAMO.CITA_ID
    ) C3 ON C3.CITA_ID = RECLAMO.CITA_ID
    INNER JOIN
    (
        SELECT 'Total' AS NOMBRE, 'Total' AS SEXO, SUM(RECLAMO.MONTO_DEBITADO) AS MONTO_DEBITADO, RECLAMO.CITA_ID
        FROM
        (
            SELECT *
            FROM
            (
                SELECT A1.CEDULA, A1.NOMBRE, A1.SEXO, CITA.ID
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) A1
                INNER JOIN CITA ON A1.CEDULA = CITA.PACIENTE_CEDULA
            ) B1
            INNER JOIN 
            (
                SELECT C1.NOMBRE, COUNT(CITA.ID) AS NUM_CITA
                FROM
                (
                    SELECT CEDULA, NOMBRE, SEXO
                    FROM PACIENTE
                ) C1
                INNER JOIN CITA ON C1.CEDULA = CITA.PACIENTE_CEDULA
                GROUP BY C1.NOMBRE
            ) B2 ON B2.NOMBRE = B1.NOMBRE
        ) A2
        INNER JOIN RECLAMO ON A2.ID = RECLAMO.CITA_ID
        GROUP BY RECLAMO.CITA_ID
    ) C4 ON C4.CITA_ID = RECLAMO.CITA_ID
) AA3;

