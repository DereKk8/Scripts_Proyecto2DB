DROP TABLE titulo;
DROP TABLE MOTIVO;
DROP TABLE ALERGIA;
ALTER TABLE PACIENTE DROP CONSTRAINT PACIENTE_REPRESENTANTE_fk;
DROP TABLE REPRESENTANTE;
ALTER TABLE cita DROP CONSTRAINT CITA_PACIENTE_fk;
DROP TABLE PACIENTE;
ALTER TABLE RECLAMO DROP CONSTRAINT RECLAMO_CITA_fk;
DROP TABLE CITA;
DROP TABLE MIEMBRO_PERSONAL;
ALTER TABLE RECLAMO_EN_DISPUTA DROP CONSTRAINT RECLAMO_EN_DISPUTA_RECLAMO_FK;
DROP TABLE RECLAMO_EN_DISPUTA;
ALTER TABLE RECLAMO DROP CONSTRAINT RECLAMO_POLIZA_FK;
ALTER TABLE POLIZA DROP CONSTRAINT POLIZA_RECLAMO_FK;
DROP TABLE RECLAMO;
ALTER TABLE POLIZA DROP CONSTRAINT POLIZA_COBERTURA_FK;
DROP TABLE COBERTURA;
DROP TABLE PERSONA_DE_CONTACTO;
DROP TABLE ASEGURADORA;
DROP TABLE POLIZA;
