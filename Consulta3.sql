SELECT paciente.nombre, representante.nombre, tipo_relacion
FROM paciente, cita
WHERE paciente.representante_cedula = representante.cedula OR paciente.representante_cedula = NULL    
