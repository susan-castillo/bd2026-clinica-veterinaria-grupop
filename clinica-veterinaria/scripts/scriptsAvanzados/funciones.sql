
--Función que retorna la edad del paciente mediante la fecha de nacimiento.

--Creación de la función
create or replace function fn_get_edad(f_fecha_nacimiento date)
	returns int
	language plpgsql
as $$

--Declaración de variable c_edad, guardará la edad calculada.
declare
c_edad bigint;
begin

--Calcula directamente con el parámetro recibido
	c_edad = extract(year from age(current_date, f_fecha_nacimiento)); 
   
--Retorna la edad calculada, si es NULL retorna 0
	return coalesce(c_edad,0);

end;
$$;

-- Uso de la función en una consulta SELECT
select nombre_m, fecha_nacimiento, fn_get_edad(fecha_nacimiento) as edad from mascotas;


--Función que retorna historial clínico de una mascota. 
create or replace function fn_get_historial_medico(id int)
returns table(
    nombre_ma text,
    edad int,
    peso numeric(6,2),
    fecha_cita timestamp,
    veterinario text,
    diagnostico text,
    tratamiento text,
    medicamentos_recetados text
)
language plpgsql
as $$
begin
    return query
    select
        m.nombre_m::text,
        fn_get_edad(m.fecha_nacimiento)::int,
        m.peso_m,
        c.fecha_c,
		v.nombre_v::text,
        d.descripcion_d::text,
        t.descripcion_t::text,
		string_agg(
            me.nombre_m || ' (' || dt.dosis_dt || ')',
            ', '
        )::text as medicamentos_recetados
    from mascotas m

    join citas c on c.id_mascota = m.id_mascota
	join veterinario v on v.id_veterinario = c.id_veterinario
    join diagnosticos d on d.id_cita = c.id_cita
    join tratamiento t on t.id_diagnostico = d.id_diagnostico
    join detalles_tratamientos dt on dt.id_tratamiento = t.id_tratamiento
    join medicamentos me on me.id_medicamento = dt.id_medicamento
    where m.id_mascota = id
group by
 m.nombre_m,
    m.fecha_nacimiento,
    m.peso_m,
    c.fecha_c,
    d.descripcion_d,  
    t.descripcion_t,
	v.nombre_v;
end;
$$;


select * from fn_get_historial_medico(3);
