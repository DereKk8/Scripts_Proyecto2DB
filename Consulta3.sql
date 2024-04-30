SELECT 
    p.nombre AS Paciente,
    r.nombre AS Representante,
    CASE 
        WHEN p.representante_cedula = r.cedula THEN p.descripcion_parentesco
        ELSE 'No tiene relacion'
    END AS Parentesco
FROM 
    paciente p
LEFT JOIN 
    representante r ON p.representante_cedula = r.cedula
