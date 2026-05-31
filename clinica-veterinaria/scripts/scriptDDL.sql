--SCRIPT DDL (Creación de bases de datos, restricciones y tablas)

create database Veterinaria
-- ============================================================
-- 1. TABLA: especies
--    Catálogo de especies (ej. perro, gato, etc.)
-- ============================================================
CREATE TABLE especies (
    id_especie        BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_e          VARCHAR(100)   NOT NULL,
    descripcion_e     TEXT           NOT NULL
);

-- ============================================================
-- 2. TABLA: razas
--    Razas asociadas a cada especie
-- ============================================================
CREATE TABLE razas (
    id_raza           BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_especie        BIGINT            NOT NULL,
    nombre_r          VARCHAR(100)   NOT NULL,
    CONSTRAINT fk_razas_especie
        FOREIGN KEY (id_especie) REFERENCES especies (id_especie)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- 3. TABLA: propietarios
--    Dueños de las mascotas
-- ============================================================
CREATE TABLE propietarios (
    id_propietario          BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dui_p                   VARCHAR(20)    UNIQUE NOT NULL,
    nombre_p                VARCHAR(100)   NOT NULL,
    apellido_p              VARCHAR(100)   NOT NULL,
    genero_p                VARCHAR(10)    CHECK (genero_p IN ('M', 'F', 'Otro')),
    telefono_p              VARCHAR(20)    NOT NULL UNIQUE,
    telefono_secundario_p   VARCHAR(20)    NOT NULL,
    correo_p                VARCHAR(150)   UNIQUE,
    direccion_p             TEXT
);

-- ============================================================
-- 4. TABLA: mascotas
--    Pacientes de la clínica; dependen de propietario y especie
-- ============================================================
CREATE TABLE mascotas (
    id_mascota        BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_propietario    BIGINT            NOT NULL,
    id_especie        BIGINT            NOT NULL,
    id_raza           BIGINT,
    nombre_m          VARCHAR(100)   NOT NULL,
    fecha_nacimiento  DATE,
    edad_m            INT,           -- atributo derivado (calculable)
    sexo_m            VARCHAR(10)    CHECK (sexo_m IN ('Macho', 'Hembra')),
    peso_m            DECIMAL(6,2),
    tamanio_m         VARCHAR(50),
    CONSTRAINT fk_mascotas_propietario
        FOREIGN KEY (id_propietario) REFERENCES propietarios (id_propietario)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_mascotas_especie
        FOREIGN KEY (id_especie) REFERENCES especies (id_especie)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_mascotas_raza
        FOREIGN KEY (id_raza) REFERENCES razas (id_raza)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ============================================================
-- 5. TABLA: especialidades
--    Especialidades médicas de los veterinarios
-- ============================================================
CREATE TABLE especialidades (
    id_especialidad   BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_esp        VARCHAR(150)   NOT NULL,
    descripcion_esp   TEXT
);

-- ============================================================
-- 6. TABLA: veterinario
--    Personal veterinario de la clínica
--    Con relación a especialidades
-- ============================================================
CREATE TABLE veterinario (
    id_veterinario    BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_especialidad   BIGINT            NOT NULL,
    nombre_v          VARCHAR(100)   NOT NULL,
    apellido_v        VARCHAR(100)   NOT NULL,
    telefono_v        VARCHAR(20) UNIQUE,
    correo_v          VARCHAR(150) UNIQUE,
    CONSTRAINT fk_veterinario_especialidad
        FOREIGN KEY (id_especialidad) REFERENCES especialidades (id_especialidad)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- 7. TABLA: citas
--    Citas médicas de mascotas atendidas por veterinarios
-- ============================================================
CREATE TABLE citas (
    id_cita           BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_mascota        BIGINT            NOT NULL,
    id_veterinario    BIGINT            NOT NULL,
    fecha_c           TIMESTAMP      NOT NULL,
    motivo_c          TEXT,
    estado_c          VARCHAR(20)    NOT NULL DEFAULT 'Programada',
    costo_c           DECIMAL(10,2),
    CONSTRAINT fk_citas_mascota
        FOREIGN KEY (id_mascota) REFERENCES mascotas (id_mascota)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_citas_veterinario
        FOREIGN KEY (id_veterinario) REFERENCES veterinario (id_veterinario)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_estado_c CHECK (estado_c IN ('Programada', 'En curso', 'Completada', 'Cancelada'))
);

-- ============================================================
-- 8. TABLA: diagnosticos
--    Diagnóstico generado en cada cita
-- ============================================================
CREATE TABLE diagnosticos (
    id_diagnostico    BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cita           BIGINT            NOT NULL,   
    descripcion_d     TEXT           NOT NULL,
    observaciones_d   TEXT,
    fecha_d           DATE,
    CONSTRAINT fk_diagnosticos_cita
        FOREIGN KEY (id_cita) REFERENCES citas (id_cita)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- 9. TABLA: procedimientos
--     Catálogo de procedimientos clínicos
-- ============================================================
CREATE TABLE procedimientos (
    id_procedimiento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_diagnostico BIGINT NOT NULL,
    nombre_p VARCHAR(100),
    descripcion_p TEXT,
    costo_p DECIMAL(10,2),
    CONSTRAINT fk_procedimientos_diagnostico
        FOREIGN KEY (id_diagnostico)
        REFERENCES diagnosticos(id_diagnostico)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- 10. TABLA: tratamiento
--     Tratamientos médicos (catálogo general)
-- ============================================================
CREATE TABLE tratamiento (
    id_tratamiento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_diagnostico BIGINT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion_t TEXT,
    indicaciones_t TEXT,
    CONSTRAINT fk_tratamiento_diagnostico
        FOREIGN KEY (id_diagnostico)
        REFERENCES diagnosticos(id_diagnostico)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- 11. TABLA: medicamentos
--     Catálogo de medicamentos disponibles
-- ============================================================
CREATE TABLE medicamentos (
    id_medicamento    BIGINT            GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_m          VARCHAR(150)      NOT NULL,
    presentacion_m    VARCHAR(100),
    laboratorio_m     VARCHAR(150),
    precio_m DECIMAL(10,2)     NOT NULL DEFAULT 0,
    stock_m           INT               NOT NULL DEFAULT 0,
    CONSTRAINT chk_precio_m CHECK (precio_m >= 0),
    CONSTRAINT chk_stock_m CHECK (stock_m >= 0)
);

-- ============================================================
-- 12. TABLA: detalles_tratamientos  (entidad débil)
--     Detalle de los tratamientos asignados a un diagnóstico
-- ============================================================
CREATE TABLE detalles_tratamientos (
    id_detalle_tratamiento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dosis_dt VARCHAR(100),
    frecuencia_dt VARCHAR(100),
    duracion_dias_dt INT,
    id_tratamiento BIGINT NOT NULL,
    id_medicamento BIGINT NOT NULL,
    CONSTRAINT fk_dt_tratamiento
        FOREIGN KEY (id_tratamiento)
        REFERENCES tratamiento(id_tratamiento)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_dt_medicamento
        FOREIGN KEY (id_medicamento)
        REFERENCES medicamentos(id_medicamento)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- 13. TABLA: facturas
--     Factura generada por cada cita (relación 1:1 con citas;
--     la FK id_cita vive en facturas)
-- ============================================================
CREATE TABLE facturas (
    id_factura BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fecha_emision_f DATE NOT NULL,
    estado_f VARCHAR(50),
    total_f DECIMAL(10,2),
    id_cita BIGINT UNIQUE,
    CONSTRAINT fk_facturas_cita
        FOREIGN KEY (id_cita)
        REFERENCES citas(id_cita)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- 14. TABLA: detalles_facturas  (entidad débil)
--     Líneas de detalle de cada factura.
--     Puede contener: tratamientos, procedimientos,
--     medicamentos o el costo de la cita en sí.
-- ============================================================
CREATE TABLE detalles_facturas (
    id_detalle_factura BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descripcion_df TEXT,
    cantidad_df BIGINT,
    precio_unit_df DECIMAL(10,2),
    subtotal_df DECIMAL(10,2),
    id_factura BIGINT NOT NULL,
    id_cita BIGINT NULL,
    id_medicamento BIGINT NULL,
    id_tratamiento BIGINT NULL,
    id_procedimiento BIGINT NULL,
    CONSTRAINT fk_df_factura
        FOREIGN KEY (id_factura)
        REFERENCES facturas(id_factura)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_df_cita
        FOREIGN KEY (id_cita)
        REFERENCES citas(id_cita)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_df_medicamento
        FOREIGN KEY (id_medicamento)
        REFERENCES medicamentos(id_medicamento)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_df_tratamiento
        FOREIGN KEY (id_tratamiento)
        REFERENCES tratamiento(id_tratamiento)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_df_procedimiento
        FOREIGN KEY (id_procedimiento)
        REFERENCES procedimientos(id_procedimiento)
        ON UPDATE CASCADE ON DELETE SET NULL
);