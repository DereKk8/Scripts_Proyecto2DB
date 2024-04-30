SELECT 
    p.nombre AS Paciente,
    r.nombre AS Representante,
    CASE 
        WHEN p.representante_cedula = r.cedula THEN r.tipo_relacion
        ELSE 'No tiene relacion'
    END AS Relacion
FROM 
    paciente p
LEFT JOIN 
    representante r ON p.representante_cedula = r.cedula
