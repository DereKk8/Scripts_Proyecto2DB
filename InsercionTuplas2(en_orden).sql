-- insertar tuplas en orden

-- #1
-- Tabla representante
INSERT INTO representante (cedula, nombre, telefono, direccion, tipo_relacion) 
VALUES ('2247654329', 'Roberto Pérez', '3176543210', 'Av. Principal 456', 'Padre');

INSERT INTO representante (cedula, nombre, telefono, direccion, tipo_relacion) 
VALUES ('8864567890', 'Sofía López', '3174567890', 'Calle Secundaria 123', 'Madre');

-- #2
-- Tabla paciente
INSERT INTO paciente (cedula, nombre, sexo, fecha_nacimiento, direccion, representante_cedula) 
VALUES ('1234567890', 'Pedro Martínez', 'M',TO_DATE('1990-06-15','YYYY-MM-DD'), 'Av. Principal 123', '2247654329');

INSERT INTO paciente (cedula, nombre, sexo, fecha_nacimiento, direccion, representante_cedula) 
VALUES ('0987654321', 'Ana López', 'F', TO_DATE('1985-04-20','YYYY-MM-DD'), 'Calle Secundaria 789', '8864567890');

INSERT INTO paciente (cedula, nombre, sexo, fecha_nacimiento, direccion, representante_cedula) 
VALUES ('1234555790', 'Juan Quintana', 'M',TO_DATE('2000-07-20','YYYY-MM-DD'), 'Calle Principal 567', NULL);


--#3
-- Tabla alergia
INSERT INTO alergia (id, descripcion, paciente_cedula) 
VALUES ('001', 'Polen', '1234567890');

INSERT INTO alergia (id, descripcion, paciente_cedula) 
VALUES ('002', 'Ácaros', '0987654321');

--#4
-- Tabla cobertura
INSERT INTO cobertura (id, tipo, cobertura_maxima) 
VALUES ('01', 'Cobertura básica', 1000.00);

INSERT INTO cobertura (id, tipo, cobertura_maxima) 
VALUES ('02', 'Cobertura avanzada', 5000.00);

--#5
-- Tabla miembro_personal
INSERT INTO miembro_personal (cedula, nombre, sexo, cargo, direccion) 
VALUES ('2957634021', 'Juan Pérez', 'M', 'Médico General', 'Av. Principal 789');

INSERT INTO miembro_personal (cedula, nombre, sexo, cargo, direccion) 
VALUES ('1464567858', 'María González', 'F', 'Enfermera', 'Calle Secundaria 456');

--#6
-- Tabla titulo
INSERT INTO titulo (id, nombre, miembro_personal_cedula) 
VALUES ('T01', 'Médico General', '2957634021');

INSERT INTO titulo (id, nombre, miembro_personal_cedula) 
VALUES ('T02', 'Enfermera', '1464567858');


---------------------------------------------------------------------Tuplas que no sirven todavia---------------------------------------------------



-- Tabla cita
INSERT INTO cita (id, fecha_de_programacion, hora_de_programacion, fecha_realizacion, hora_realizacion, motivo, miembro_personal_cedula, paciente_cedula) 
VALUES (1, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), '2024-05-01', '10:30:00', 'Consulta general', '0987654321', '1234567890');

INSERT INTO cita (id, fecha_de_programacion, hora_de_programacion, fecha_realizacion, hora_realizacion, motivo, miembro_personal_cedula, paciente_cedula) 
VALUES (2, TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_TIMESTAMP('15:30:00', 'HH24:MI:SS'), NULL, NULL, 'Control de alergia', '0987654321', '0987654321');

-- Tabla motivo
INSERT INTO motivo (id, descripcion, cita_id) 
VALUES ('M01', 'Consulta médica', 1);

INSERT INTO motivo (id, descripcion, cita_id) 
VALUES ('M02', 'Seguimiento', 2);

-- Tabla persona_de_contacto
INSERT INTO persona_de_contacto (cedula, telefono, aseguradora_nit) 
VALUES ('7772226420', '3164567890', '123477539');

INSERT INTO persona_de_contacto (cedula, telefono, aseguradora_nit) 
VALUES ('1200647820', '3161543210', '554543216');

-- Tabla poliza
INSERT INTO poliza (numero, mensualidad, reclamo_codigo, cobertura_id, aseguradora_nit) 
VALUES ('000001', 50.00, 'R001', '01', '123456789');

INSERT INTO poliza (numero, mensualidad, reclamo_codigo, cobertura_id, aseguradora_nit) 
VALUES ('000002', 80.00, 'R002', '02', '987654321');

-- Tabla reclamo
INSERT INTO reclamo (codigo, fecha_de_emision, fecha_de_solicitud, estado, monto_reclamado, monto_debitado, codigo_razon_pago_parcial, fecha_pago_parcial, cita_id, poliza_numero) 
VALUES ('R001', TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'Pendiente', 200.00, 0.00, NULL, NULL, 1, '000001');

INSERT INTO reclamo (codigo, fecha_de_emision, fecha_de_solicitud, estado, monto_reclamado, monto_debitado, codigo_razon_pago_parcial, fecha_pago_parcial, cita_id, poliza_numero) 
VALUES ('R002', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'En proceso', 300.00, 0.00, 'R003', '2024-06-01', 2, '000002');

-- Tabla reclamo_en_disputa
INSERT INTO reclamo_en_disputa (codigo, fecha_de_procesamiento, motivo, etapa, fecha_finalizacion, resultado_etapa, reclamo_codigo) 
VALUES ('RD001', TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Revisión de documentos', 1, NULL, NULL, 'R001');

INSERT INTO reclamo_en_disputa (codigo, fecha_de_procesamiento, motivo, etapa, fecha_finalizacion, resultado_etapa, reclamo_codigo) 
VALUES ('RD002', TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Análisis de reclamo', 2, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Aprobado', 'R002');

