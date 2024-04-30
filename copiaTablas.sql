CREATE TABLE alergia (
    id              VARCHAR2(3 CHAR) NOT NULL,
    descripcion     VARCHAR2(20 CHAR) NOT NULL,
    paciente_cedula VARCHAR2(10 CHAR)
);

ALTER TABLE alergia ADD CONSTRAINT alergia_pk PRIMARY KEY ( id );

CREATE TABLE aseguradora (
    nit                        VARCHAR2(9 CHAR) NOT NULL,
    nombre                     VARCHAR2(30 CHAR) NOT NULL,
    direccion                  VARCHAR2(50 CHAR) NOT NULL,
    direccion_ip               VARCHAR2(19 CHAR),
    persona_de_contacto_cedula VARCHAR2(10 CHAR) NOT NULL,
    poliza_numero              VARCHAR2(6 CHAR) NOT NULL
);

CREATE UNIQUE INDEX aseguradora__idxv1 ON
    aseguradora (
        persona_de_contacto_cedula
    ASC );

ALTER TABLE aseguradora ADD CONSTRAINT aseguradora_pk PRIMARY KEY ( nit );

CREATE TABLE cita (
    id                      INTEGER NOT NULL,
    fecha_de_programacion   DATE NOT NULL,
    hora_de_programacion    DATE NOT NULL,
    fecha_realizacion       DATE,
    hora_realizacion        DATE,
    motivo                  VARCHAR2(20 CHAR) NOT NULL,
    miembro_personal_cedula VARCHAR2(10 CHAR) NOT NULL,
    paciente_cedula         VARCHAR2(10 CHAR) NOT NULL
);

CREATE UNIQUE INDEX cita__idx ON
    cita (
        paciente_cedula
    ASC );

ALTER TABLE cita ADD CONSTRAINT cita_pk PRIMARY KEY ( id );

CREATE TABLE cobertura (
    id               VARCHAR2(2 CHAR) NOT NULL,
    tipo             VARCHAR2(20 CHAR) NOT NULL,
    cobertura_maxima FLOAT(10) NOT NULL
);

ALTER TABLE cobertura ADD CONSTRAINT cobertura_pk PRIMARY KEY ( id );

CREATE TABLE miembro_personal (
    cedula    VARCHAR2(10 CHAR) NOT NULL,
    nombre    VARCHAR2(50 CHAR) NOT NULL,
    sexo      VARCHAR2(1 CHAR) NOT NULL,
    cargo     VARCHAR2(20 CHAR) NOT NULL,
    direccion VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE miembro_personal ADD CONSTRAINT miembro_personal_pk PRIMARY KEY ( cedula );

CREATE TABLE motivo (
    id          VARCHAR2(20 CHAR) NOT NULL,
    descripcion VARCHAR2(20 CHAR) NOT NULL,
    cita_id     INTEGER NOT NULL
);

ALTER TABLE motivo ADD CONSTRAINT motivo_pk PRIMARY KEY ( id );

CREATE TABLE paciente (
    cedula               VARCHAR2(10 CHAR) NOT NULL,
    nombre               VARCHAR2(50 CHAR) NOT NULL,
    sexo                 VARCHAR2(1 CHAR) NOT NULL,
    fecha_nacimiento     DATE NOT NULL,
    direccion            VARCHAR2(100 CHAR),
    representante_cedula VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE paciente ADD CONSTRAINT paciente_pk PRIMARY KEY ( cedula );

CREATE TABLE persona_de_contacto (
    cedula          VARCHAR2(10 CHAR) NOT NULL,
    telefono        VARCHAR2(10 CHAR) NOT NULL,
    aseguradora_nit VARCHAR2(9 CHAR) NOT NULL
);

CREATE UNIQUE INDEX persona_de_contacto__idx ON
    persona_de_contacto (
        aseguradora_nit
    ASC );

ALTER TABLE persona_de_contacto ADD CONSTRAINT persona_de_contacto_pk PRIMARY KEY ( cedula );

CREATE TABLE poliza (
    numero           VARCHAR2(6 CHAR) NOT NULL,
    mensualidad      FLOAT(6) NOT NULL,
    reclamo_codigo   VARCHAR2(5 CHAR) NOT NULL,
    cobertura_id     VARCHAR2(2 CHAR) NOT NULL,
    aseguradora_nit VARCHAR2(9 CHAR) NOT NULL
);

ALTER TABLE poliza ADD CONSTRAINT poliza_pk PRIMARY KEY ( numero );

CREATE TABLE reclamo (
    codigo                    VARCHAR2(5 CHAR) NOT NULL,
    fecha_de_emision          DATE,
    fecha_de_solicitud        DATE NOT NULL,
    estado                    VARCHAR2(10 CHAR) NOT NULL,
    monto_reclamado           FLOAT(10) NOT NULL,
    monto_debitado            FLOAT(10) NOT NULL,
    codigo_razon_pago_parcial VARCHAR2(3 CHAR),
    fecha_pago_parcial        DATE,
    cita_id                   INTEGER NOT NULL,
    poliza_numero             VARCHAR2(6 CHAR) NOT NULL
);

ALTER TABLE reclamo ADD constraint "chk pago parcial" 
    CHECK ((codigo_razon_pago_parcial IS NULL AND fecha_pago_parcial IS NOT NULL) OR (codigo_razon_pago_parcial IS NOT NULL AND fecha_pago_parcial IS NULL)) 
;
CREATE UNIQUE INDEX reclamo__idxv1 ON
    reclamo (
        poliza_numero
    ASC );

ALTER TABLE reclamo ADD CONSTRAINT reclamo_pk PRIMARY KEY ( codigo );

CREATE TABLE reclamo_en_disputa (
    codigo                 VARCHAR2(3 CHAR) NOT NULL,
    fecha_de_procesamiento DATE NOT NULL,
    motivo                 VARCHAR2(4000) NOT NULL,
    etapa                  INTEGER NOT NULL,
    fecha_finalizacion     DATE,
    resultado_etapa        VARCHAR2(15 CHAR),
    reclamo_codigo         VARCHAR2(5 CHAR) NOT NULL
);

CREATE UNIQUE INDEX reclamo_en_disputa__idx ON
    reclamo_en_disputa (
        reclamo_codigo
    ASC );

ALTER TABLE reclamo_en_disputa ADD CONSTRAINT reclamo_en_disputa_pk PRIMARY KEY ( codigo );

CREATE TABLE representante (
    cedula    VARCHAR2(10 CHAR) NOT NULL,
    nombre    VARCHAR2(50 CHAR) NOT NULL,
    telefono  VARCHAR2(10 CHAR) NOT NULL,
    direccion VARCHAR2(50 CHAR)
);

ALTER TABLE representante ADD CONSTRAINT representante_pk PRIMARY KEY ( cedula );

CREATE TABLE titulo (
    id                      VARCHAR2(3) NOT NULL,
    nombre                  VARCHAR2(100 CHAR) NOT NULL,
    miembro_personal_cedula VARCHAR2(10 CHAR)
);

ALTER TABLE titulo ADD CONSTRAINT titulo_pk PRIMARY KEY ( id );

ALTER TABLE alergia
    ADD CONSTRAINT alergia_paciente_fk FOREIGN KEY ( paciente_cedula )
        REFERENCES paciente ( cedula );

ALTER TABLE aseguradora
    ADD CONSTRAINT aseguradora_per_cont_fk FOREIGN KEY ( persona_de_contacto_cedula )
        REFERENCES persona_de_contacto ( cedula );

ALTER TABLE cita
    ADD CONSTRAINT cita_miembro_personal_fk FOREIGN KEY ( miembro_personal_cedula )
        REFERENCES miembro_personal ( cedula );

ALTER TABLE cita
    ADD CONSTRAINT cita_paciente_fk FOREIGN KEY ( paciente_cedula )
        REFERENCES paciente ( cedula );

ALTER TABLE motivo
    ADD CONSTRAINT motivo_cita_fk FOREIGN KEY ( cita_id )
        REFERENCES cita ( id );

ALTER TABLE paciente
    ADD CONSTRAINT paciente_representante_fk FOREIGN KEY ( representante_cedula )
        REFERENCES representante ( cedula );

ALTER TABLE persona_de_contacto
    ADD CONSTRAINT persona_contac_aseg_fk FOREIGN KEY ( aseguradora_nit )
        REFERENCES aseguradora ( nit );

ALTER TABLE poliza
    ADD CONSTRAINT poliza_cobertura_fk FOREIGN KEY ( cobertura_id )
        REFERENCES cobertura ( id );

ALTER TABLE poliza
    ADD CONSTRAINT poliza_reclamo_fk FOREIGN KEY ( reclamo_codigo )
        REFERENCES reclamo ( codigo );

ALTER TABLE reclamo
    ADD CONSTRAINT reclamo_cita_fk FOREIGN KEY ( cita_id )
        REFERENCES cita ( id );

ALTER TABLE reclamo_en_disputa
    ADD CONSTRAINT reclamo_en_disputa_reclamo_fk FOREIGN KEY ( reclamo_codigo )
        REFERENCES reclamo ( codigo );

ALTER TABLE reclamo
    ADD CONSTRAINT reclamo_poliza_fk FOREIGN KEY ( poliza_numero )
        REFERENCES poliza ( numero );

ALTER TABLE titulo
    ADD CONSTRAINT titulo_miembro_personal_fk FOREIGN KEY ( miembro_personal_cedula )
        REFERENCES miembro_personal ( cedula );
