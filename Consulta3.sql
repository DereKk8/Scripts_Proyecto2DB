SELECT paciente.nombre as Nombre_Paciente, representante.nombre as Nombre_Representante, tipo_relacion
FROM paciente, representante
WHERE paciente.representante_cedula = representante.cedula OR paciente.representante_cedula = NULL    
