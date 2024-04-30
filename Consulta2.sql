SELECT mp.cargo AS clase_de_miembro,
       SUM(CASE WHEN mp.sexo = 'M' THEN (r.monto_reclamado - r.monto_debitado) ELSE 0 END) AS reclamaciones_no_pagadas_masculino,
       SUM(CASE WHEN mp.sexo = 'F' THEN (r.monto_reclamado - r.monto_debitado) ELSE 0 END) AS reclamaciones_no_pagadas_femenino
FROM reclamo r
JOIN cita c ON r.cita_id = c.id
JOIN miembro_personal mp ON c.miembro_personal_cedula = mp.cedula
WHERE r.estado <> 'Pagado Totalmente'
GROUP BY mp.cargo;
