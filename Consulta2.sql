SELECT mp.cargo AS clase_de_miembro,
       mp.sexo,
       SUM(r.monto_reclamado - r.monto_debitado) AS reclamaciones_no_pagadas
FROM reclamo r
JOIN cita c ON r.cita_id = c.id
JOIN miembro_personal mp ON c.miembro_personal_cedula = mp.cedula
WHERE r.estado <> 'Pagado Totalmente'
GROUP BY mp.cargo, mp.sexo;
