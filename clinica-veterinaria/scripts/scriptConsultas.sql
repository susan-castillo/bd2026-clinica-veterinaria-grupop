-- Script de consultas SQL desarrolladas que respondan a la necesidad del negocio

-- 1. Medicamentos prescritos con mayor frecuencia
SELECT
    med.id_medicamento,
    med.nombre_m AS medicamento,
    med.presentacion_m AS presentacion,
    COUNT(dt.id_medicamento) AS veces_recetado
FROM detalles_tratamientos dt
         JOIN medicamentos med ON dt.id_medicamento = med.id_medicamento
GROUP BY med.id_medicamento, med.nombre_m, med.presentacion_m
ORDER BY veces_recetado DESC;

-- 2. Ingresos totales por especialidad veterinaria
SELECT
    esp.nombre_esp AS especialidad,
    SUM(df.subtotal_df) AS ingresos_totales
FROM detalles_facturas df
-- Se une con citas cuando el detalle es una consulta
         LEFT JOIN citas c ON df.id_cita = c.id_cita
-- Se une con procedimientos cuando el detalle es un procedimiento quirúrgico/examen
         LEFT JOIN procedimientos proc ON df.id_procedimiento = proc.id_procedimiento
         LEFT JOIN diagnosticos d ON proc.id_diagnostico = d.id_diagnostico
         LEFT JOIN citas c_proc ON d.id_cita = c_proc.id_cita
-- Se consolida el veterinario que atendió, ya sea por cita directa o por procedimiento
         JOIN veterinario v ON v.id_veterinario = COALESCE(c.id_veterinario, c_proc.id_veterinario)
         JOIN especialidades esp ON v.id_especialidad = esp.id_especialidad
GROUP BY esp.nombre_esp
ORDER BY ingresos_totales DESC;

--3. los propietarios que más dinero han generado mediante citas y facturas.
SELECT
    p.id_propietario,
    p.nombre_p || ' ' || p.apellido_p AS propietario,
    COUNT(f.id_factura) AS total_facturas,
    SUM(f.total_f) AS ingresos_generados
FROM propietarios p
JOIN mascotas m
    ON p.id_propietario = m.id_propietario
JOIN citas c
    ON m.id_mascota = c.id_mascota
JOIN facturas f
    ON c.id_cita = f.id_cita
WHERE f.estado_f = 'Pagada'
GROUP BY p.id_propietario, p.nombre_p, p.apellido_p
ORDER BY ingresos_generados DESC;

--4. Mascotas con cumpleaños en el mes actual y contacto del propietario
SELECT
    m.nombre_m,
    TO_CHAR(m.fecha_nacimiento, 'DD/MM') AS cumpleanos,
    DATE_PART('year', AGE(m.fecha_nacimiento)) AS edad_actual,
    p.nombre_p || ' ' || p.apellido_p AS propietario,
    p.telefono_p,
    p.correo_p
FROM mascotas m
JOIN propietarios p ON m.id_propietario = p.id_propietario
WHERE DATE_PART('month', m.fecha_nacimiento) = DATE_PART('month', CURRENT_DATE)
ORDER BY DATE_PART('day', m.fecha_nacimiento);
