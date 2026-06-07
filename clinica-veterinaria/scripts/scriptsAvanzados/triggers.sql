-- TRIGGERS
-- ============================================================

--TRIGGERS PARA EL CONTROL DE ENTIDADES DÉBILES
-- ============================================================
-- 1. Automatización para DETALLES_FACTURAS
CREATE OR REPLACE FUNCTION tg_secuencia_detalle_factura()
    RETURNS TRIGGER AS $$
BEGIN
    -- Busca el último número de renglón de esta factura y le suma 1. Si es el primero, inicia en 1.
    SELECT COALESCE(MAX(id_detalle_factura), 0) + 1
    INTO NEW.id_detalle_factura
    FROM detalles_facturas
    WHERE id_factura = NEW.id_factura;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_antes_insertar_detalle_factura
    BEFORE INSERT ON detalles_facturas
    FOR EACH ROW
EXECUTE FUNCTION tg_secuencia_detalle_factura();


-- 2. Automatización para DETALLES_TRATAMIENTOS
CREATE OR REPLACE FUNCTION tg_secuencia_detalle_tratamiento()
    RETURNS TRIGGER AS $$
BEGIN
    -- Busca el último número de renglón de este tratamiento y le suma 1. Si es el primero, inicia en 1.
    SELECT COALESCE(MAX(id_detalle_tratamiento), 0) + 1
    INTO NEW.id_detalle_tratamiento
    FROM detalles_tratamientos
    WHERE id_tratamiento = NEW.id_tratamiento;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_antes_insertar_detalle_tratamiento
    BEFORE INSERT ON detalles_tratamientos
    FOR EACH ROW
EXECUTE FUNCTION tg_secuencia_detalle_tratamiento();