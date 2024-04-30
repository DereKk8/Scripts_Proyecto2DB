INSERT INTO REPRESENTANTE (CEDULA, NOMBRE, TELEFONO, DIRECCION)
VALUES ('987654321', 'Juan Rodríguez', '5559876543', 'Calle Principal 456');

INSERT INTO PACIENTE (CEDULA, NOMBRE, SEXO, FECHA_NACIMIENTO, DIRECCION, REPRESENTANTE_CEDULA, DESCRIPCION_PARENTESCO)
VALUES ('1234567891', 'Ana Martínez', 'F', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Calle Principal 123', '987654321','Padre');
INSERT INTO PACIENTE (CEDULA, NOMBRE, SEXO, FECHA_NACIMIENTO, DIRECCION, REPRESENTANTE_CEDULA, DESCRIPCION_PARENTESCO)
VALUES ('1234567892', 'Ana Gutierrez', 'F', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Calle Secundria 123', '987654321','Padre');
INSERT INTO PACIENTE (CEDULA, NOMBRE, SEXO, FECHA_NACIMIENTO, DIRECCION, REPRESENTANTE_CEDULA, DESCRIPCION_PARENTESCO)
VALUES ('1234567893', 'Ana Pyandé', 'F', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Calle Tercera 123', '987654321','Padre');
INSERT INTO PACIENTE (CEDULA, NOMBRE, SEXO, FECHA_NACIMIENTO, DIRECCION, REPRESENTANTE_CEDULA, DESCRIPCION_PARENTESCO)
VALUES ('1234567894', 'Esteban Diaz', 'M', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Calle Quinta 123', '987654321','Padre');

INSERT INTO ALERGIA (ID, DESCRIPCION, PACIENTE_CEDULA)
VALUES ('001', 'Alergia al polen', '1234567891');

INSERT INTO COBERTURA (ID, TIPO, COBERTURA_MAXIMA)
VALUES ('01', 'Hospitalización', 10000.00);

INSERT INTO MIEMBRO_PERSONAL (CEDULA, NOMBRE, SEXO, CARGO, DIRECCION)
VALUES ('1234567890', 'Juan Pérez', 'M', 'Médico General', 'Calle Principal 123');

INSERT INTO TITULO (ID, NOMBRE, MIEMBRO_PERSONAL_CEDULA)
VALUES ('001', 'Doctor en Medicina', '1234567890');

INSERT INTO CITA (ID, FECHA_DE_PROGRAMACION, HORA_DE_PROGRAMACION, FECHA_REALIZACION, HORA_REALIZACION, MOTIVO, MIEMBRO_PERSONAL_CEDULA, PACIENTE_CEDULA)
VALUES (1, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), NULL, NULL, 'Consulta de rutina', '1234567890', '1234567891');
INSERT INTO CITA (ID, FECHA_DE_PROGRAMACION, HORA_DE_PROGRAMACION, FECHA_REALIZACION, HORA_REALIZACION, MOTIVO, MIEMBRO_PERSONAL_CEDULA, PACIENTE_CEDULA)
VALUES (2, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), NULL, NULL, 'Consulta de rutina', '1234567890', '1234567891');
INSERT INTO CITA (ID, FECHA_DE_PROGRAMACION, HORA_DE_PROGRAMACION, FECHA_REALIZACION, HORA_REALIZACION, MOTIVO, MIEMBRO_PERSONAL_CEDULA, PACIENTE_CEDULA)
VALUES (3, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), NULL, NULL, 'Consulta de rutina', '1234567890', '1234567892');
INSERT INTO CITA (ID, FECHA_DE_PROGRAMACION, HORA_DE_PROGRAMACION, FECHA_REALIZACION, HORA_REALIZACION, MOTIVO, MIEMBRO_PERSONAL_CEDULA, PACIENTE_CEDULA)
VALUES (4, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), NULL, NULL, 'Consulta de rutina', '1234567890', '1234567893');
INSERT INTO CITA (ID, FECHA_DE_PROGRAMACION, HORA_DE_PROGRAMACION, FECHA_REALIZACION, HORA_REALIZACION, MOTIVO, MIEMBRO_PERSONAL_CEDULA, PACIENTE_CEDULA)
VALUES (5, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), NULL, NULL, 'Consulta de rutina', '1234567890', '1234567894');

INSERT INTO MOTIVO (ID, DESCRIPCION, CITA_ID)
VALUES ('001', 'Consulta de rutina', 1);

INSERT INTO PERSONA_DE_CONTACTO (CEDULA, TELEFONO)
VALUES ('1234567890', '5551234567');

INSERT INTO ASEGURADORA (NIT, NOMBRE, DIRECCION, DIRECCION_IP, PERSONA_DE_CONTACTO_CEDULA)
VALUES ('123456789', 'Seguros XYZ', 'Calle Principal 123', '192.168.0.1', '1234567890');

INSERT INTO POLIZA (NUMERO,MENSUALIDAD, COBERTURA_ID, ASEGURADORA_NIT)
VALUES('00001',300000.0, '01', '123456789');

INSERT INTO RECLAMO (CODIGO, FECHA_DE_EMISION, FECHA_DE_SOLICITUD, ESTADO, MONTO_RECLAMADO, MONTO_DEBITADO, CODIGO_RAZON_PAGO_PARCIAL, FECHA_PAGO_PARCIAL, CITA_ID, POLIZA_NUMERO)
VALUES ('0001', TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Pendiente', 500.00, 100.00, NULL, NULL, 1, '00001');
INSERT INTO RECLAMO (CODIGO, FECHA_DE_EMISION, FECHA_DE_SOLICITUD, ESTADO, MONTO_RECLAMADO, MONTO_DEBITADO, CODIGO_RAZON_PAGO_PARCIAL, FECHA_PAGO_PARCIAL, CITA_ID, POLIZA_NUMERO)
VALUES ('0001', TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Pendiente', 500.00, 20.00, NULL, NULL, 2, '00001');
INSERT INTO RECLAMO (CODIGO, FECHA_DE_EMISION, FECHA_DE_SOLICITUD, ESTADO, MONTO_RECLAMADO, MONTO_DEBITADO, CODIGO_RAZON_PAGO_PARCIAL, FECHA_PAGO_PARCIAL, CITA_ID, POLIZA_NUMERO)
VALUES ('0001', TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Pendiente', 500.00, 50.00, NULL, NULL, 3, '00001');
INSERT INTO RECLAMO (CODIGO, FECHA_DE_EMISION, FECHA_DE_SOLICITUD, ESTADO, MONTO_RECLAMADO, MONTO_DEBITADO, CODIGO_RAZON_PAGO_PARCIAL, FECHA_PAGO_PARCIAL, CITA_ID, POLIZA_NUMERO)
VALUES ('0001', TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Pendiente', 500.00, 500.00, NULL, NULL, 4, '00001');

INSERT INTO RECLAMO_EN_DISPUTA (CODIGO, FECHA_DE_PROCESAMIENTO, MOTIVO, ETAPA, FECHA_FINALIZACION, RESULTADO_ETAPA, RECLAMO_CODIGO)
VALUES ('001', TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'Problema con la cobertura', 1, NULL, NULL, '0001');


