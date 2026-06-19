/* ============================================================
	!SCRIPT DML - Sistema de Gestión Veterinaria!
		> Script DML de carga inicial con datos representativos (INSERT)
	Repartición de tablas:
	* (1. especies, 2. razas, 3. propietarios, 4. mascotas, 5. especialidades, 6. veterinario, 7. citas) - Adriana
	* (8. diagnosticos, 9. procedimientos, 10. tratamiento, 11. medicamentos, 12. detalles_tratamientos, 13. facturas, 14. detalles_facturas) - Susan
 ============================================================ */
SELECT * FROM especies;
SELECT * FROM razas;
SELECT * FROM propietarios;
SELECT * FROM mascotas;
SELECT * FROM especialidades;
SELECT * FROM veterinario;
SELECT * FROM citas;
SELECT * FROM diagnosticos;
SELECT * FROM procedimientos;
SELECT * FROM tratamiento;
SELECT * FROM medicamentos;
SELECT * FROM detalles_tratamientos;
SELECT * FROM facturas;
SELECT * FROM detalles_facturas;

-- ============================================================
-- 1° INSERT: especies (17)
-- ============================================================
INSERT INTO especies (nombre_e, descripcion_e)
VALUES ('Can', 'Mamífero doméstico de la familia Canidae, comúnmente conocido como perro.'),
       ('Felino', 'Mamífero de la familia Felidae, incluye gatos domésticos y felinos salvajes.'),
       ('Ave', 'Animal vertebrado de sangre caliente con plumas, pico y alas.'),
       ('Conejo', 'Mamífero herbívoro de orejas largas, comúnmente criado como mascota.'),
       ('Reptil', 'Animal vertebrado de sangre fría con escamas, incluye lagartijas y serpientes.'),
       ('Pez', 'Animal acuático de sangre fría con aletas y branquias.'),
       ('Roedor', 'Mamífero caracterizado por sus incisivos prominentes, incluye hámster y cobaya.'),
       ('Hurón', 'Mamífero carnívoro domesticado de la familia Mustelidae.'),
       ('Anfibio', 'Animal vertebrado que puede vivir en agua y tierra, como ranas y salamandras.'),
       ('Équido', 'Mamífero ungulado de la familia Equidae, incluye caballos, burros y ponis.'),
       ('Porcino', 'Mamífero omnívoro doméstico de la familia Suidae, comúnmente conocido como cerdo.'),
       ('Ovejas', 'Mamífero rumiante de la familia Bovidae, comúnmente conocido como oveja.'),
       ('Caprino', 'Mamífero rumiante doméstico de la familia Bovidae, comúnmente conocido como cabra.'),
       ('Ave de corral', 'Aves criadas principalmente para la producción de huevos y carne.'),
       ('Primate', 'Orden de mamíferos que incluye monos y simios, de alta inteligencia.'),
       ('Marsupial', 'Mamífero que da a luz crías inmaduras y las desarrolla en una bolsa ventral.'),
       ('Arácnido', 'Artrópodo de ocho patas, incluye arañas y escorpiones.');


-- ============================================================
-- 2° INSERT: razas (61)
-- 5 por razas comunes, y solo 3 por menos comunes
-- ============================================================

-- Can (5 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Can'), 'Labrador Retriever'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Can'), 'Pastor Alemán'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Can'), 'Chihuahua'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Can'), 'Golden Retriever'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Can'), 'Bulldog Francés');

-- Felino (5 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Felino'), 'Siamés'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Felino'), 'Persa'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Felino'), 'Bengalí'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Felino'), 'Maine Coon'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Felino'), 'Angora');

-- Ave (5 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave'), 'Loro'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave'), 'Canario'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave'), 'Cacatúa'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave'), 'Periquito'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave'), 'Agapornis');

-- Roedor (5 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Roedor'), 'Hámster Sirio'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Roedor'), 'Cobaya'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Roedor'), 'Chinchilla'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Roedor'), 'Rata Fancy'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Roedor'), 'Jerbo');

-- Conejo (5 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Conejo'), 'Holandés'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Conejo'), 'Angora'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Conejo'), 'Rex'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Conejo'), 'Lionhead'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Conejo'), 'Mini Lop');

-- Reptil (3 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Reptil'), 'Dragón Barbudo'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Reptil'), 'Gecko Leopardo'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Reptil'), 'Iguana Verde');

-- Pez (3 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Pez'), 'Betta'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Pez'), 'Goldfish'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Pez'), 'Guppy');

-- Hurón (3 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Hurón'), 'Hurón Estándar'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Hurón'), 'Hurón Angora'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Hurón'), 'Hurón Albino');

-- Anfibio (3 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Anfibio'), 'Axolotl'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Anfibio'), 'Rana Africana'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Anfibio'), 'Salamandra Tigre');

-- Équido (3 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Équido'), 'Caballo Árabe'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Équido'), 'Poni Shetland'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Équido'), 'Burro Andaluz');

-- Porcino (3 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Porcino'), 'Cerdo Vietnamita'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Porcino'), 'Duroc'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Porcino'), 'Landrace');

-- Ovejas (3 razas)
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Ovejas'), 'Merino'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ovejas'), 'Suffolk'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ovejas'), 'Dorper');

-- Caprino (3 razas) - se eliminará después
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Caprino'), 'Boer'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Caprino'), 'Nubia'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Caprino'), 'Saanen');

-- Ave de corral (3 razas) - se eliminará después
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave de corral'), 'Gallina Leghorn'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave de corral'), 'Pato Pekín'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Ave de corral'), 'Pavo Real');

-- Primate (3 razas) - se eliminará después
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Primate'), 'Tití Común'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Primate'), 'Mono Ardilla'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Primate'), 'Lémur');

-- Marsupial (3 razas) - se eliminará después
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Marsupial'), 'Zarigüeya'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Marsupial'), 'Canguro Enano'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Marsupial'), 'Equidna');

-- Arácnido (3 razas) - se eliminará después
INSERT INTO razas (id_especie, nombre_r)
VALUES ((SELECT id_especie FROM especies WHERE nombre_e = 'Arácnido'), 'Tarántula Rosa'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Arácnido'), 'Escorpión Emperador'),
       ((SELECT id_especie FROM especies WHERE nombre_e = 'Arácnido'), 'Tarántula Patas Rojas');


-- ============================================================
-- 3° INSERT: propietarios (20)
-- ============================================================
INSERT INTO propietarios (dui_p, nombre_p, apellido_p, genero_p, telefono_p, telefono_secundario_p, correo_p,
                          direccion_p)
VALUES ('01234567-8', 'Adriana', 'Mejía', 'F', '7123-4567', '2234-5678', 'adriana.mejia@gmail.com',
        'Colonia Escalón, San Salvador'),
       ('02345678-9', 'Susan', 'Castillo', 'F', '7234-5678', '2345-6789', 'susan.castillo@gmail.com',
        'Reparto Los Héroes, San Salvador'),
       ('03456789-0', 'Francisco', 'NoSé', 'M', '7345-6789', '2456-7890', 'francisco.nose@gmail.com',
        'Colonia San Benito, San Salvador'),
       ('04567890-1', 'Daniel', 'Echegoyen', 'M', '7456-7890', '2567-8901', 'daniel.echegoyen@gmail.com',
        'Urbanización Madre Selva, Antiguo Cuscatlán'),
       ('05678901-2', 'Luis', 'Rodríguez', 'M', '7567-8901', '2678-9012', 'luis.rodriguez@gmail.com',
        'Colonia Miramonte, San Salvador'),
       ('06789012-3', 'Laura', 'Pérez', 'F', '7678-9012', '2789-0123', 'laura.perez@gmail.com',
        'Residencial Santa Elena, Antiguo Cuscatlán'),
       ('07890123-4', 'Roberto', 'Flores', 'M', '7789-0123', '2890-1234', 'roberto.flores@hotmail.com',
        'Colonia Jardines de Guadalupe, San Salvador'),
       ('08901234-5', 'Sofía', 'Chávez', 'F', '7890-1234', '2901-2345', 'sofia.chavez@gmail.com',
        'Colonia Maquilishuat, San Salvador'),
       ('09012345-6', 'Diego', 'Ramírez', 'M', '7901-2345', '2012-3456', 'diego.ramirez@gmail.com',
        'Urbanización California, Santa Tecla'),
       ('00123456-7', 'Valentina', 'Cruz', 'F', '7012-3456', '2123-4567', 'valentina.cruz@yahoo.com',
        'Colonia América, San Salvador'),
       ('11234567-8', 'Miguel', 'Castillo', 'M', '7523-4567', '2334-5678', 'miguel.castillo@gmail.com',
        'Reparto Shafick, San Salvador'),
       ('12345678-9', 'Isabella', 'Morales', 'F', '7634-5678', '2445-6789', 'isabella.morales@gmail.com',
        'Colonia Universitaria, San Salvador'),
       ('13456789-0', 'Andrés', 'Jiménez', 'M', '7745-6789', '2556-7890', 'andres.jimenez@hotmail.com',
        'Residencial Las Colinas, Santa Tecla'),
       ('14567890-1', 'Camila', 'Torres', 'F', '7856-7890', '2667-8901', 'camila.torres@gmail.com',
        'Colonia Lomas de San Francisco, Antiguo Cuscatlán'),
       ('15678901-2', 'Fernando', 'Aguilar', 'M', '7967-8901', '2778-9012', 'fernando.aguilar@gmail.com',
        'Colonia Centroamérica, San Salvador'),
       ('16789012-3', 'Valeria', 'Vásquez', 'F', '7078-9012', '2889-0123', 'valeria.vasquez@yahoo.com',
        'Urbanización Siena, Antiguo Cuscatlán'),
       ('17890123-4', 'Ricardo', 'Mendoza', 'M', '7189-0123', '2990-1234', 'ricardo.mendoza@gmail.com',
        'Colonia La Sultana, Antiguo Cuscatlán'),
       ('18901234-5', 'Gabriela', 'Rivas', 'F', '7290-1234', '2101-2345', 'gabriela.rivas@gmail.com',
        'Reparto Cucumacayán, San Salvador'),
       ('19012345-6', 'Alejandro', 'Molina', 'M', '7391-2345', '2212-3456', 'alejandro.molina@hotmail.com',
        'Colonia Médica, San Salvador'),
       ('10123456-7', 'Daniela', 'Ortiz', 'F', '7492-3456', '2323-4567', 'daniela.ortiz@gmail.com',
        'Colonia Escalón, San Salvador');


-- ============================================================
-- 4° INSERT: mascotas (71)
-- Can (10), Felino (10), Ave (10), Roedor (10), Conejo (10),
-- Reptil (3), Pez (3), Hurón (3), Anfibio (3), Équido (3),
-- Porcino (3), Ovejas (3)
-- Son 2 por cada raza común y solo 1 por cada raza menos comun
-- ============================================================
INSERT INTO mascotas (id_propietario, id_raza, nombre_m, fecha_nacimiento, sexo_m, peso_m, tamanio_m)
VALUES
-- Can - Labrador Retriever (2)
(1, 1, 'Max', '2021-03-15', 'Macho', 30.5, 'Grande'),
(2, 1, 'Luna', '2020-07-22', 'Hembra', 28.0, 'Grande'),

-- Can - Pastor Alemán (2)
(3, 2, 'Rex', '2019-11-10', 'Macho', 35.0, 'Grande'),
(4, 2, 'Nala', '2022-01-05', 'Hembra', 29.5, 'Grande'),

-- Can - Chihuahua (2)
(5, 3, 'Tiny', '2023-05-18', 'Macho', 2.1, 'Pequeño'),
(6, 3, 'Bella', '2022-09-30', 'Hembra', 1.8, 'Pequeño'),

-- Can - Golden Retriever (2)
(7, 4, 'Buddy', '2021-06-12', 'Macho', 32.0, 'Grande'),
(8, 4, 'Daisy', '2020-12-01', 'Hembra', 27.5, 'Grande'),

-- Can - Bulldog Francés (2)
(9, 5, 'Gordo', '2022-04-20', 'Macho', 12.0, 'Mediano'),
(10, 5, 'Coco', '2023-02-14', 'Hembra', 10.5, 'Mediano'),

-- Felino - Siamés (2)
(11, 6, 'Milo', '2021-08-03', 'Macho', 4.5, 'Mediano'),
(12, 6, 'Nube', '2022-11-25', 'Hembra', 3.8, 'Mediano'),

-- Felino - Persa (2)
(13, 7, 'Pelusa', '2020-03-17', 'Hembra', 4.2, 'Mediano'),
(14, 7, 'Simon', '2019-07-09', 'Macho', 5.0, 'Mediano'),

-- Felino - Bengalí (2)
(15, 8, 'Tigre', '2022-06-01', 'Macho', 5.5, 'Mediano'),
(16, 8, 'Mia', '2023-01-19', 'Hembra', 4.0, 'Mediano'),

-- Felino - Maine Coon (2)
(17, 9, 'Gigante', '2020-09-14', 'Macho', 8.5, 'Grande'),
(18, 9, 'Reina', '2021-12-30', 'Hembra', 6.5, 'Grande'),

-- Felino - Angora (2)
(19, 10, 'Blanca', '2022-03-08', 'Hembra', 3.5, 'Mediano'),
(20, 10, 'Fluffy', '2021-10-22', 'Macho', 4.0, 'Mediano'),

-- Ave - Loro (2)
(1, 11, 'Paco', '2018-05-11', 'Macho', 0.40, 'Pequeño'),
(2, 11, 'Verde', '2019-08-23', 'Hembra', 0.30, 'Pequeño'),

-- Ave - Canario (2)
(3, 12, 'Sol', '2022-02-14', 'Macho', 0.02, 'Pequeño'),
(4, 12, 'Pio', '2023-04-01', 'Hembra', 0.02, 'Pequeño'),

-- Ave - Cacatúa (2)
(5, 13, 'Nieve', '2020-11-05', 'Hembra', 0.35, 'Pequeño'),
(6, 13, 'Rocky', '2019-03-28', 'Macho', 0.40, 'Pequeño'),

-- Ave - Periquito (2)
(7, 14, 'Azul', '2023-06-10', 'Macho', 0.03, 'Pequeño'),
(8, 14, 'Verdecito', '2022-08-15', 'Hembra', 0.03, 'Pequeño'),

-- Ave - Agapornis (2)
(9, 15, 'Amor', '2022-01-30', 'Hembra', 0.05, 'Pequeño'),
(10, 15, 'Pico', '2021-07-17', 'Macho', 0.05, 'Pequeño'),

-- Roedor - Hámster Sirio (2)
(11, 16, 'Bolita', '2023-03-12', 'Macho', 0.15, 'Pequeño'),
(12, 16, 'Canela', '2022-10-05', 'Hembra', 0.13, 'Pequeño'),

-- Roedor - Cobaya (2)
(13, 17, 'Manchas', '2021-05-20', 'Macho', 1.10, 'Pequeño'),
(14, 17, 'Trebol', '2022-07-14', 'Hembra', 0.90, 'Pequeño'),

-- Roedor - Chinchilla (2)
(15, 18, 'Gris', '2020-04-08', 'Macho', 0.60, 'Pequeño'),
(16, 18, 'Suave', '2021-09-19', 'Hembra', 0.50, 'Pequeño'),

-- Roedor - Rata Fancy (2)
(17, 19, 'Raton', '2023-01-25', 'Macho', 0.35, 'Pequeño'),
(18, 19, 'Noche', '2022-06-30', 'Hembra', 0.28, 'Pequeño'),

-- Roedor - Jerbo (2)
(19, 20, 'Salto', '2023-05-03', 'Macho', 0.08, 'Pequeño'),
(20, 20, 'Arena', '2022-11-11', 'Hembra', 0.07, 'Pequeño'),

-- Conejo - Holandés (2)
(1, 21, 'Dutch', '2021-02-18', 'Macho', 2.0, 'Pequeño'),
(2, 21, 'Mochi', '2022-04-27', 'Hembra', 1.8, 'Pequeño'),

-- Conejo - Angora (2)
(3, 22, 'Algodon', '2020-08-09', 'Macho', 3.5, 'Mediano'),
(4, 22, 'Lana', '2021-11-14', 'Hembra', 3.2, 'Mediano'),

-- Conejo - Rex (2)
(5, 23, 'Terciopelo', '2022-07-21', 'Macho', 4.0, 'Mediano'),
(6, 23, 'Suavecito', '2023-03-05', 'Hembra', 3.5, 'Mediano'),

-- Conejo - Lionhead (2)
(7, 24, 'Melena', '2022-09-16', 'Macho', 1.8, 'Pequeño'),
(8, 24, 'Leon', '2021-04-02', 'Hembra', 1.6, 'Pequeño'),

-- Conejo - Mini Lop (2)
(9, 25, 'Orejon', '2023-02-28', 'Macho', 2.2, 'Pequeño'),
(10, 25, 'Floppy', '2022-06-13', 'Hembra', 2.0, 'Pequeño'),

-- Reptiles (1 c/u)
(11, 26, 'Spike', '2021-01-15', 'Macho', 0.45, 'Mediano'),
(12, 27, 'Spot', '2022-03-22', 'Hembra', 0.07, 'Pequeño'),
(13, 28, 'Verde', '2020-06-30', 'Macho', 3.50, 'Grande'),

-- Peces (1 c/u)
(14, 29, 'Escarlata', '2023-01-10', 'Macho', 0.01, 'Pequeño'),
(15, 30, 'Naranja', '2022-05-18', 'Hembra', 0.05, 'Pequeño'),
(16, 31, 'Colores', '2023-04-05', 'Macho', 0.01, 'Pequeño'),

-- Hurones (1 c/u)
(17, 32, 'Bandido', '2021-09-07', 'Macho', 1.2, 'Pequeño'),
(18, 33, 'Pelin', '2022-12-19', 'Hembra', 0.9, 'Pequeño'),
(19, 34, 'Blanco', '2023-02-01', 'Macho', 1.0, 'Pequeño'),

-- Anfibios (1 c/u)
(20, 35, 'Axo', '2022-08-14', 'Macho', 0.3, 'Pequeño'),
(1, 36, 'Croac', '2021-11-28', 'Hembra', 0.08, 'Pequeño'),
(2, 37, 'Tigresa', '2020-07-03', 'Hembra', 0.12, 'Pequeño'),

-- Équidos (1 c/u)
(3, 38, 'Trueno', '2018-03-25', 'Macho', 450, 'Grande'),
(4, 39, 'Pony', '2019-10-11', 'Hembra', 180, 'Mediano'),
(5, 40, 'Burrito', '2017-06-16', 'Macho', 200, 'Mediano'),

-- Porcinos (1 c/u)
(6, 41, 'Chanchito', '2021-04-14', 'Macho', 45, 'Mediano'),
(7, 42, 'Rosado', '2020-01-22', 'Hembra', 120, 'Grande'),
(8, 43, 'Oink', '2019-08-30', 'Macho', 150, 'Grande'),

-- Ovejas (1 c/u)
(9, 44, 'Lana', '2020-11-17', 'Hembra', 55, 'Mediano'),
(10, 45, 'Negrita', '2021-03-04', 'Hembra', 70, 'Mediano'),
(11, 46, 'Borrego', '2022-07-09', 'Macho', 65, 'Mediano');


-- ============================================================
-- 5° INSERT: especialidades (20)
-- ============================================================
INSERT INTO especialidades (nombre_esp, descripcion_esp)
VALUES ('Medicina General Veterinaria', 'Atención médica integral para animales domésticos.'),
       ('Cirugía Veterinaria', 'Procedimientos quirúrgicos preventivos y correctivos.'),
       ('Dermatología Veterinaria', 'Diagnóstico y tratamiento de enfermedades de la piel.'),
       ('Odontología Veterinaria', 'Prevención y tratamiento de enfermedades dentales.'),
       ('Cardiología Veterinaria', 'Diagnóstico y tratamiento de enfermedades cardiovasculares.'),
       ('Neurología Veterinaria', 'Atención de trastornos del sistema nervioso.'),
       ('Oftalmología Veterinaria', 'Diagnóstico y tratamiento de enfermedades oculares.'),
       ('Oncología Veterinaria', 'Diagnóstico y tratamiento del cáncer en animales.'),
       ('Traumatología Veterinaria', 'Tratamiento de fracturas y lesiones musculoesqueléticas.'),
       ('Ortopedia Veterinaria', 'Corrección y tratamiento de problemas óseos y articulares.'),
       ('Medicina Interna Veterinaria', 'Diagnóstico y tratamiento de enfermedades complejas.'),
       ('Nutrición Veterinaria', 'Planes alimenticios y control nutricional.'),
       ('Etología Veterinaria', 'Estudio y tratamiento de problemas de comportamiento animal.'),
       ('Anestesiología Veterinaria', 'Administración y monitoreo de anestesia.'),
       ('Medicina Preventiva', 'Vacunación, desparasitación y control sanitario.'),
       ('Reproducción Animal', 'Manejo reproductivo y fertilidad animal.'),
       ('Medicina de Animales Exóticos', 'Atención de reptiles, aves y pequeños mamíferos.'),
       ('Urgencias Veterinarias', 'Atención de emergencias médicas y quirúrgicas.'),
       ('Diagnóstico por Imágenes', 'Radiografías, ecografías y otros estudios diagnósticos.'),
       ('Fisioterapia y Rehabilitación', 'Recuperación funcional tras lesiones o cirugías.');


-- ============================================================
-- 6° INSERT: veterinario (40)
-- 2 veterinarios por especialidad :)
-- ============================================================
INSERT INTO veterinario (id_especialidad, nombre_v, apellido_v, telefono_v, correo_v)
VALUES ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina General Veterinaria'), 'Carlos',
        'Martínez', '7000-0001', 'carlos.martinez@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina General Veterinaria'), 'Laura',
        'Torres', '7000-0002', 'laura.torres@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Cirugía Veterinaria'), 'Ana', 'López',
        '7000-0003', 'ana.lopez@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Cirugía Veterinaria'), 'Javier', 'Castillo',
        '7000-0004', 'javier.castillo@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Dermatología Veterinaria'), 'Jorge', 'Ramírez',
        '7000-0005', 'jorge.ramirez@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Dermatología Veterinaria'), 'Daniela', 'Romero',
        '7000-0006', 'daniela.romero@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Odontología Veterinaria'), 'Sofía', 'Castro',
        '7000-0007', 'sofia.castro@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Odontología Veterinaria'), 'Andrés', 'Flores',
        '7000-0008', 'andres.flores@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Cardiología Veterinaria'), 'Ricardo', 'Mendoza',
        '7000-0009', 'ricardo.mendoza@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Cardiología Veterinaria'), 'Patricia', 'Vega',
        '7000-0010', 'patricia.vega@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Neurología Veterinaria'), 'Miguel', 'Herrera',
        '7000-0011', 'miguel.herrera@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Neurología Veterinaria'), 'Valeria', 'Reyes',
        '7000-0012', 'valeria.reyes@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Oftalmología Veterinaria'), 'Diego', 'Silva',
        '7000-0013', 'diego.silva@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Oftalmología Veterinaria'), 'María', 'Campos',
        '7000-0014', 'maria.campos@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Oncología Veterinaria'), 'Fernando', 'Vega',
        '7000-0015', 'fernando.vega@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Oncología Veterinaria'), 'Gabriela', 'Morales',
        '7000-0016', 'gabriela.morales@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Traumatología Veterinaria'), 'Eduardo', 'Cruz',
        '7000-0017', 'eduardo.cruz@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Traumatología Veterinaria'), 'Andrea',
        'Navarro', '7000-0018', 'andrea.navarro@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Ortopedia Veterinaria'), 'Luis', 'Pérez',
        '7000-0019', 'luis.perez@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Ortopedia Veterinaria'), 'Karen', 'Rivas',
        '7000-0020', 'karen.rivas@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina Interna Veterinaria'), 'Óscar', 'Ruiz',
        '7000-0021', 'oscar.ruiz@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina Interna Veterinaria'), 'Lucía',
        'Benítez', '7000-0022', 'lucia.benitez@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Nutrición Veterinaria'), 'Roberto', 'Aguilar',
        '7000-0023', 'roberto.aguilar@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Nutrición Veterinaria'), 'Paula', 'Gómez',
        '7000-0024', 'paula.gomez@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Etología Veterinaria'), 'Tomás', 'Molina',
        '7000-0025', 'tomas.molina@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Etología Veterinaria'), 'Camila', 'Ortiz',
        '7000-0026', 'camila.ortiz@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Anestesiología Veterinaria'), 'Raúl', 'Fuentes',
        '7000-0027', 'raul.fuentes@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Anestesiología Veterinaria'), 'Natalia',
        'Arias', '7000-0028', 'natalia.arias@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina Preventiva'), 'Héctor', 'Salazar',
        '7000-0029', 'hector.salazar@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina Preventiva'), 'Elena', 'Mejía',
        '7000-0030', 'elena.mejia@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Reproducción Animal'), 'Samuel', 'Castillo',
        '7000-0031', 'samuel.castillo@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Reproducción Animal'), 'Verónica', 'Lara',
        '7000-0032', 'veronica.lara@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina de Animales Exóticos'), 'Esteban',
        'Santos', '7000-0033', 'esteban.santos@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Medicina de Animales Exóticos'), 'Tatiana',
        'Rojas', '7000-0034', 'tatiana.rojas@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Urgencias Veterinarias'), 'Iván', 'Peña',
        '7000-0035', 'ivan.pena@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Urgencias Veterinarias'), 'Mónica', 'Vargas',
        '7000-0036', 'monica.vargas@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Diagnóstico por Imágenes'), 'Roberto', 'León',
        '7000-0037', 'roberto.leon@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Diagnóstico por Imágenes'), 'Melissa', 'Pineda',
        '7000-0038', 'melissa.pineda@veterinaria.com'),

       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Fisioterapia y Rehabilitación'), 'Cristian',
        'Durán', '7000-0039', 'cristian.duran@veterinaria.com'),
       ((SELECT id_especialidad FROM especialidades WHERE nombre_esp = 'Fisioterapia y Rehabilitación'), 'Alejandra',
        'Escobar', '7000-0040', 'alejandra.escobar@veterinaria.com');

       
-- ============================================================
-- 7° INSERT: citas (50)
-- 35 Completadas, 5 En curso, 5 Cancelada, 5 Programada
-- ============================================================
INSERT INTO citas (id_mascota, id_veterinario, fecha_c, motivo_c, estado_c, costo_c)
VALUES (1, 1, '2025-01-10 09:00:00', 'Consulta general', 'Completada', 20.00),
       (2, 2, '2025-01-15 10:30:00', 'Vacunación anual', 'Completada', 25.00),
       (3, 3, '2025-01-20 14:00:00', 'Control de peso', 'Completada', 18.00),
       (4, 4, '2025-01-25 11:00:00', 'Desparasitación', 'Completada', 15.00),
       (5, 5, '2025-02-01 09:30:00', 'Chequeo preventivo', 'Completada', 22.00),
       (6, 6, '2025-02-05 15:00:00', 'Consulta dermatológica', 'Completada', 30.00),
       (7, 7, '2025-02-10 10:00:00', 'Control de crecimiento', 'Completada', 20.00),
       (8, 8, '2025-02-15 13:30:00', 'Revisión general', 'Completada', 20.00),
       (9, 9, '2025-02-20 08:00:00', 'Problema respiratorio', 'Completada', 35.00),
       (10, 10, '2025-02-25 16:00:00', 'Control nutricional', 'Completada', 25.00),
       (11, 11, '2025-03-02 09:00:00', 'Vacunación de refuerzo', 'Completada', 25.00),
       (12, 12, '2025-03-06 11:00:00', 'Consulta general', 'Completada', 20.00),
       (13, 13, '2025-03-10 14:00:00', 'Revisión ocular', 'Completada', 30.00),
       (14, 14, '2025-03-15 10:30:00', 'Control postoperatorio', 'Completada', 40.00),
       (15, 15, '2025-03-20 15:30:00', 'Chequeo preventivo', 'Completada', 22.00),
       (16, 16, '2025-03-25 09:15:00', 'Evaluación cardiológica', 'Completada', 45.00),
       (17, 17, '2025-04-01 13:00:00', 'Revisión de rutina', 'Completada', 20.00),
       (18, 18, '2025-04-05 11:45:00', 'Control de peso', 'Completada', 18.00),
       (19, 19, '2025-04-10 10:00:00', 'Consulta por alergia', 'Completada', 35.00),
       (20, 20, '2025-04-15 16:30:00', 'Desparasitación', 'Completada', 15.00),
       (21, 21, '2025-04-20 09:00:00', 'Vacunación anual', 'Completada', 25.00),
       (22, 22, '2025-04-25 14:30:00', 'Consulta general', 'Completada', 20.00),
       (23, 23, '2025-05-01 10:15:00', 'Chequeo preventivo', 'Completada', 22.00),
       (24, 24, '2025-05-05 15:00:00', 'Problema digestivo', 'Completada', 32.00),
       (25, 25, '2025-05-10 09:45:00', 'Control de crecimiento', 'Completada', 20.00),
       (26, 26, '2025-05-15 11:30:00', 'Consulta dermatológica', 'Completada', 30.00),
       (27, 27, '2025-05-20 13:00:00', 'Revisión general', 'Completada', 20.00),
       (28, 28, '2025-05-25 16:00:00', 'Control nutricional', 'Completada', 25.00),
       (29, 29, '2025-06-01 08:30:00', 'Evaluación médica', 'Completada', 28.00),
       (30, 30, '2025-06-05 14:00:00', 'Consulta preventiva', 'Completada', 20.00),
       (31, 31, '2025-06-10 10:00:00', 'Vacunación anual', 'Completada', 25.00),
       (32, 32, '2025-06-15 15:30:00', 'Control de peso', 'Completada', 18.00),
       (33, 33, '2025-06-20 09:15:00', 'Chequeo preventivo', 'Completada', 22.00),
       (34, 34, '2025-06-25 11:45:00', 'Consulta general', 'Completada', 20.00),
       (35, 35, '2025-06-28 14:30:00', 'Revisión post tratamiento', 'Completada', 30.00),
       (36, 1, '2026-06-01 09:00:00', 'Tratamiento en seguimiento', 'En curso', 35.00),
       (37, 2, '2026-06-02 11:00:00', 'Recuperación postoperatoria', 'En curso', 50.00),
       (38, 3, '2026-06-03 15:00:00', 'Control especializado', 'En curso', 40.00),
       (39, 4, '2026-06-04 10:00:00', 'Evaluación médica continua', 'En curso', 30.00),
       (40, 5, '2026-06-05 13:00:00', 'Monitoreo clínico', 'En curso', 28.00),
       (41, 6, '2025-07-10 09:00:00', 'Cita cancelada por propietario', 'Cancelada', 0.00),
       (42, 7, '2025-08-15 11:00:00', 'Cancelación por emergencia', 'Cancelada', 0.00),
       (43, 8, '2025-09-05 14:00:00', 'Reprogramación solicitada', 'Cancelada', 0.00),
       (44, 9, '2025-10-20 10:30:00', 'Ausencia del propietario', 'Cancelada', 0.00),
       (45, 10, '2025-11-12 15:00:00', 'Cancelación administrativa', 'Cancelada', 0.00),
       (46, 11, '2026-07-10 09:00:00', 'Vacunación programada', 'Programada', 25.00),
       (47, 12, '2026-07-22 14:00:00', 'Chequeo preventivo programado', 'Programada', 20.00),
       (48, 13, '2026-08-05 10:30:00', 'Control de peso programado', 'Programada', 18.00),
       (49, 14, '2026-08-18 16:00:00', 'Consulta de seguimiento', 'Programada', 30.00),
       (50, 15, '2026-08-30 11:00:00', 'Evaluación médica programada', 'Programada', 22.00),
       (3,  2, '2026-06-18 09:00:00', 'Problema respiratorio',   'Completada', 35.00),
       (17, 2, '2026-06-19 10:30:00', 'Problema respiratorio',   'Completada', 35.00),
       (42, 2, '2026-06-20 11:00:00', 'Problema respiratorio',   'Completada', 35.00),
       (8,  7, '2026-06-18 14:00:00', 'Consulta dermatológica',  'Completada', 30.00),
       (29, 7, '2026-06-19 15:30:00', 'Consulta dermatológica',  'Completada', 30.00),
       (50, 7, '2026-06-20 09:45:00', 'Consulta dermatológica',  'Completada', 30.00),
       (11, 2, '2026-06-18 08:00:00', 'Vacunación anual',        'Completada', 25.00),
       (23, 2, '2026-06-19 13:00:00', 'Vacunación anual',        'Completada', 25.00),
       (36,15, '2026-06-20 16:00:00', 'Problema digestivo',      'Completada', 32.00),
       (44,15, '2026-06-21 10:00:00', 'Problema digestivo',      'Completada', 32.00),
       (5,  2, '2026-01-08 09:00:00', 'Chequeo general',         'Completada', 20.00),
       (14, 2, '2026-02-15 10:30:00', 'Vacunación anual',        'Completada', 25.00),
       (22, 2, '2026-03-22 14:00:00', 'Control de peso',         'En curso',   18.00),
       (31, 7, '2026-04-10 11:15:00', 'Problema digestivo',      'Completada', 32.00),
       (40, 7, '2026-05-18 15:00:00', 'Consulta dermatológica',  'Completada', 30.00),
       (18,15, '2026-07-06 08:30:00', 'Revisión general',        'En curso',   20.00),
       (27, 2, '2026-08-12 13:45:00', 'Control postoperatorio',  'Completada', 40.00),
       (35, 7, '2026-09-25 16:00:00', 'Chequeo preventivo',      'Completada', 22.00),
       (45, 2, '2026-10-14 09:20:00', 'Problema respiratorio',   'Completada', 35.00),
       (50, 2, '2026-11-28 10:40:00', 'Control nutricional',     'En curso',   25.00);
	 

-- ============================================================
-- 8° INSERT: diagnosticos (20 Inserts)
-- Solo se han vinculado con citas en estado Completada o En curso
-- ============================================================
INSERT INTO diagnosticos (id_cita, descripcion_d, observaciones_d, fecha_d)
VALUES (1, 'Otitis externa bilateral', 'Presencia de ácaros y secreción de mal olor.', '2025-01-10'),
       (2, 'Paciente sano para vacunación', 'Sin hallazgos clínicos anormales.', '2025-01-15'),
       (3, 'Obesidad grado I', 'Se recomienda estrictamente cambio a dieta metabólica.', '2025-01-20'),
       (4, 'Gastroenteritis bacteriana', 'Presenta deshidratación leve del 5%.', '2025-01-25'),
       (5, 'Chequeo de rutina conforme', 'Mascota activa con buena condición corporal.', '2025-02-01'),
       (6, 'Dermatitis alérgica por pulga (DAPP)', 'Lesiones alopécicas en la zona lumbosacra.', '2025-02-05'),
       (7, 'Control de cachorro en desarrollo', 'Dentición decidua completa y sana.', '2025-02-10'),
       (8, 'Revisión general preventiva', 'Linfonodos normales, mucosas rosadas.', '2025-02-15'),
       (9, 'Infección respiratoria felina (Calicivirus)', 'Úlceras linguales leves y estornudos.', '2025-02-20'),
       (10, 'Control nutricional avanzado', 'Monitoreo de porcentaje de grasa corporal.', '2025-02-25'),
       (11, 'Refuerzo de vacuna quíntuple', 'Paciente apto para inmunización.', '2025-03-02'),
       (12, 'Conjuntivitis bacteriana severa', 'Secreción purulenta en ojo izquierdo.', '2025-03-06'),
       (13, 'Ulcera corneal superficial', 'Ojo derecho afectado por rascado violento.', '2025-03-10'),
       (14, 'Fractura de fémur izquierdo', 'Traumatismo por atropellamiento vial.', '2025-03-15'),
       (15, 'Evaluación geriátrica preventiva', 'Monitoreo de articulaciones por edad.', '2025-03-20'),
       (16, 'Soplo cardíaco grado II/VI', 'Cardiomiopatía hipertrófica en fase inicial.', '2025-03-25'),
       (17, 'Revisión periódica clínica', 'Sin alteraciones aparentes en sistemas.', '2025-04-01'),
       (18, 'Control de peso semestral', 'Evolución favorable en pérdida de peso.', '2025-04-05'),
       (19, 'Dermatitis por Malassezia', 'Infección micótica secundaria en pliegues.', '2025-04-10'),
       (20, 'Desparasitación cuatrimestral', 'Tratamiento preventivo antiparasitario.', '2025-04-15'),
   	   (51, 'Infección respiratoria felina (Calicivirus)', 'Estornudos frecuentes y secreción nasal serosa bilateral.', '2026-06-14'),
       (52, 'Bronquitis aguda canina', 'Tos productiva persistente con sibilancias leves al auscultarse.',  '2026-06-10'),
       (53, 'Traqueobronquitis infecciosa (Tos de las perreras)','Tos seca en accesos, sin fiebre asociada al momento del examen.', '2026-06-01'),
       (54, 'Dermatitis alérgica por pulga (DAPP)', 'Lesiones eritematosas en región inguinal y base de la cola.', '2026-06-08'),
       (55, 'Dermatitis por Malassezia', 'Infección micótica con prurito intenso en pliegues cutáneos.', '2026-06-09'),
       (56, 'Sarna sarcóptica', 'Infestación moderada con costras en pabellones auriculares.', '2026-06-02'),
       (57, 'Paciente apto para vacunación anual', 'Sin hallazgos clínicos anormales previos a la inmunización.', '2026-06-08'),
       (58, 'Refuerzo de vacuna polivalente canina', 'Titer bajo detectado en control previo; revacunación indicada.', '2026-06-14'),
       (59, 'Gastroenteritis aguda', 'Vómitos y diarrea de 48 horas de evolución, hidratación conservada.','2026-06-12'),
       (60, 'Colitis crónica reagudizada', 'Heces con moco y sangre fresca; dieta blanda estricta indicada.', '2026-06-11'),
	   (61, 'Mascota en buen estado general.', 'Continuar con controles preventivos cada 6 meses.', '2026-06-15'),
	   (62, 'Esquema de vacunación completado.', 'Aplicar próxima vacuna según calendario.', '2026-06-15'),
	   (63, 'Leve sobrepeso detectado.', 'Dieta balanceada y ejercicio diario durante 30 minutos.', '2026-06-16'),
	   (64, 'Gastroenteritis leve.', 'Dieta blanda y medicación durante 5 días.', '2026-06-16'),
	   (65, 'Dermatitis alérgica.', 'Aplicar crema dermatológica y evitar alérgenos.', '2026-06-16'),
	   (66, 'Recuperación favorable después de cirugía.', 'Reposo y revisión en 7 días.', '2026-06-17'),
	   (67, 'Cicatrización adecuada.', 'Retirar puntos en la próxima consulta.', '2026-06-17'),
	   (68, 'Sin hallazgos clínicos importantes.', 'Mantener controles preventivos.', '2026-06-17'),
	   (69, 'Infección respiratoria leve.', 'Antibióticos y reposo por una semana.', '2026-06-18'),
	   (70, 'Estado nutricional aceptable.', 'Mantener dieta recomendada y seguimiento mensual.', '2026-06-18');


-- ============================================================
-- 9° INSERT: procedimientos (20 Inserts)
-- Vinculados a diagnósticos id 1 al 20
-- ============================================================
INSERT INTO procedimientos (id_diagnostico, nombre_p, descripcion_p, costo_p)
VALUES
    (1,  'Limpieza ótica profunda', 'Lavado clínico de conducto auditivo externo.', 15.00),
    (2,  'Revisión física pre-vacunación', 'Exploración de ganglios y temperatura.', 10.00),
    (4,  'Fluidoterapia ambulatoria', 'Administración de solución Hartman intravenosa.', 25.00),
    (5,  'Hemograma completo de control', 'Evaluación de rutina de células sanguíneas.', 15.00),
    (6,  'Raspado de piel superficial', 'Toma de muestra para descarte de ectoparásitos.', 10.00),
    (7,  'Coprológico por flotación', 'Examen de descarte de parásitos gastrointestinales.', 10.00),
    (8,  'Limpieza dental preventiva básica', 'Eliminación manual de placa dental incipiente.', 20.00),
    (9,  'Prueba rápida Triple Felina', 'Descarte de Leucemia, SIDA y Panleucopenia.', 35.00),
    (10, 'Medición de presión arterial', 'Monitoreo preventivo cardiovascular.', 15.00),
    (11, 'Inyección subcutánea terapéutica', 'Aplicación clínica controlada.', 5.00),
    (12, 'Limpieza ocular con suero', 'Lavado antiséptico de sacos conjuntivales.', 8.00),
    (13, 'Prueba de Fluoresceína', 'Tinción ocular para evaluar extensión de úlcera.', 8.00),
    (14, 'Radiografía digital', 'Dos proyecciones ortogonales de fémur izquierdo.', 40.00),
    (14, 'Cirugía Ortopédica - Osteosíntesis', 'Fijación de fémur mediante placa y tornillos.', 350.00),
    (15, 'Perfil geriátrico bioquímico', 'Análisis de funcionamiento renal y hepático.', 35.00),
    (16, 'Ecocardiograma Doppler', 'Evaluación dimensional y flujo de cámaras cardíacas.', 65.00),
    (17, 'Examen general de orina', 'Toma de muestra y lectura de Sedimento.', 12.00),
    (18, 'Medición de glucosa en sangre', 'Monitoreo rápido con glucómetro portátil.', 6.00),
    (19, 'Citología de piel', 'Tinción e identificación microscópica de levaduras.', 12.00),
    (20, 'Aplicación de spot-on clínico', 'Colocación profesional de antiparasitario.', 5.00),
    (21, 'Prueba rápida Triple Felina', 'Descarte de Leucemia, SIDA y Panleucopenia en felino con cuadro respiratorio.', 35.00),
    (22, 'Radiografía de tórax', 'Dos proyecciones para evaluación de campo pulmonar.', 30.00),
    (23, 'Auscultación cardiopulmonar ampliada', 'Evaluación de ruidos pulmonares con estetoscopio digital.', 12.00),
    (24, 'Raspado de piel superficial', 'Toma de muestra para identificación de ectoparásitos.', 10.00),
    (25, 'Citología de piel', 'Tinción e identificación microscópica de levaduras y cocos.', 12.00),
    (26, 'Prueba de alergia intradérmica', 'Evaluación de hipersensibilidad cutánea por sospecha de sarna.', 45.00),
    (27, 'Revisión física pre-vacunación', 'Exploración de ganglios, temperatura y mucosas.', 10.00),
    (28, 'Inyección subcutánea terapéutica', 'Aplicación clínica controlada de vacuna polivalente.', 5.00),
    (29, 'Coprológico por flotación', 'Examen de descarte de parásitos gastrointestinales.', 10.00),
    (30, 'Ecografía abdominal', 'Evaluación de intestino grueso y colon por imagen.', 40.00),
    (31, 'Consulta clínica preventiva', 'Evaluación física general para confirmar el buen estado de salud.', 18.00),
    (32, 'Aplicación de vacuna séxtuple', 'Administración del refuerzo correspondiente según el esquema de vacunación.', 30.00),
    (33, 'Evaluación nutricional', 'Análisis del peso corporal y elaboración de un plan alimenticio.', 20.00),
    (34, 'Fluidoterapia intravenosa', 'Administración de líquidos y electrolitos para corregir la deshidratación.', 35.00),
    (35, 'Baño dermatológico medicado', 'Tratamiento tópico con champú especializado para dermatitis alérgica.', 25.00),
    (36, 'Control postquirúrgico', 'Revisión de la evolución de la herida y del proceso de recuperación.', 22.00),
    (37, 'Retiro de suturas', 'Extracción de puntos de la herida quirúrgica y limpieza de la zona.', 15.00),
    (38, 'Desparasitación preventiva', 'Aplicación de antiparasitario interno y externo.', 18.00),
    (39, 'Nebulización', 'Terapia respiratoria para facilitar la eliminación de secreciones.', 20.00),
    (40, 'Control nutricional', 'Seguimiento del plan alimenticio y evaluación del estado corporal.', 18.00);
	
-- ============================================================
-- 10° INSERT: tratamiento (20 Inserts)
-- ============================================================
INSERT INTO tratamiento (id_diagnostico, fecha_inicio, fecha_fin, descripcion_t, indicaciones_t)
VALUES (1, '2025-01-10', '2025-01-17', 'Tratamiento Otitis infecciosa', 'Limpieza diaria previa a las gotas.'),
       (2, '2025-01-15', '2025-01-18', 'Monitoreo post-vacunal inmediato', 'Reportar decaimiento o fiebre al médico.'),
       (3, '2025-01-20', '2025-04-20', 'Plan nutricional metabólico', 'Pesar ración exacta indicada por la mañana.'),
       (4, '2025-01-25', '2025-01-30', 'Esquema de soporte digestivo', 'Dieta blanda líquida en porciones pequeñas.'),
       (5, '2025-02-01', '2025-02-08', 'Suplementación vitamínica general', 'Mezclar con el alimento húmedo diariamente.'),
       (6, '2025-02-05', '2025-03-05', 'Control ectoparásitos y DAPP', 'Aplicar pipeta y evitar contacto con pulgas.'),
       (7, '2025-02-10', '2025-02-15', 'Esquema preventivo de crecimiento', 'Monitorear consistencia de las heces.'),
       (8, '2025-02-15', '2025-02-22', 'Higiene dental oral preventiva', 'Aplicar gel antiséptico dental por las noches.'),
       (9, '2025-02-20', '2025-02-27', 'Soporte antiviral y sintomático', 'Mantener en ambiente cálido y asear nariz.'),
       (10, '2025-02-25', '2025-03-25', 'Esquema dietético para control graso', 'Prohibido dar premios o comida casera.'),
       (11, '2025-03-02', '2025-03-05', 'Manejo preventivo inmunológico', 'Evitar paseos públicos por las próximas 48h.'),
       (12, '2025-03-06', '2025-03-13', 'Terapia oftálmica antibacteriana', 'Aplicar colirio rigurosamente en horarios.'),
       (13, '2025-03-10', '2025-03-20', 'Manejo biológico de úlcera corneal', 'Uso obligatorio de collar isabelino 24/7.'),
       (14, '2025-03-16', '2025-04-16', 'Manejo analgésico postoperatorio', 'Reposo absoluto en jaula o espacio pequeño.'),
       (15, '2025-03-20', '2025-04-20', 'Condroprotección geriátrica articular', 'Suministrar tableta masticable por las mañanas.'),
       (16, '2025-03-25', '2025-09-25', 'Terapia cardíaca de mantenimiento', 'Evitar emociones fuertes y ejercicio extremo.'),
       (17, '2025-04-01', '2025-04-08', 'Tratamiento preventivo urinario', 'Aumentar el consumo de agua colocando más fuentes.'),
       (18, '2025-04-05', '2025-04-12', 'Control glucémico preventivo', 'Mantener horarios fijos para la alimentación.'),
       (19, '2025-04-10', '2025-04-24', 'Tratamiento antimicótico tópico', 'Baños terapéuticos dejando actuar el champú.'),
       (20, '2025-04-15', '2025-04-18', 'Plan antiparasitario de amplio espectro', 'Verificar la eliminación de parásitos en cajas.'),
       (21, '2026-06-18', '2026-06-25', 'Soporte antiviral y mucolítico felino', 'Mantener en ambiente cálido y limpiar secreción nasal.'),
       (22, '2026-06-19', '2026-06-26', 'Terapia broncodilatadora ambulatoria', 'Evitar exposición a humo, polvo y ambientes fríos.'),
       (23, '2026-06-20', '2026-06-27', 'Manejo sintomático de traqueobronquitis', 'Reposo y aislamiento de otros perros por 7 días.'),
       (24, '2026-06-18', '2026-07-18', 'Control ectoparásitos y DAPP', 'Aplicar pipeta y evitar contacto con pulgas del entorno.'),
       (25, '2026-06-19', '2026-07-03', 'Tratamiento antimicótico tópico intensivo', 'Baños terapéuticos dejando actuar el champú 10 minutos.'),
       (26, '2026-06-20', '2026-07-20', 'Terapia antiparasitaria y antiinflamatoria', 'Tratar también el ambiente del hogar con acaricida.'),
       (27, '2026-06-18', '2026-06-21', 'Monitoreo post-vacunal inmediato', 'Reportar decaimiento, fiebre o vómito al médico.'),
       (28, '2026-06-19', '2026-06-22', 'Refuerzo inmunológico post-vacunación', 'Evitar paseos públicos por las próximas 48 horas.'),
       (29, '2026-06-20', '2026-06-27', 'Esquema de soporte digestivo agudo', 'Dieta blanda en porciones pequeñas cada 4 horas.'),
       (30, '2026-06-21', '2026-07-05', 'Manejo de colitis crónica reagudizada', 'Prohibido dar comida casera o premios fuera de dieta.'),
	   (31, '2026-06-15', '2026-06-20', 'Seguimiento preventivo sin medicación específica.', 'Mantener una alimentación balanceada y asistir al control en seis meses.'),
       (32, '2026-06-15', '2026-06-16', 'Observación posterior a la aplicación de la vacuna.', 'Vigilar posibles reacciones adversas durante las siguientes 24 horas.'),
       (33, '2026-06-16', '2026-07-16', 'Plan de reducción de peso mediante dieta controlada.', 'Disminuir las porciones de alimento y realizar ejercicio diariamente.'),
       (34, '2026-06-16', '2026-06-21', 'Tratamiento para gastroenteritis con medicamentos y dieta blanda.', 'Mantener hidratación constante y administrar los medicamentos según indicación.'),
       (35, '2026-06-16', '2026-06-30', 'Tratamiento para dermatitis alérgica.', 'Aplicar crema tópica dos veces al día y evitar el contacto con alérgenos.'),
       (36, '2026-06-17', '2026-06-24', 'Recuperación postoperatoria con control de la herida.', 'Mantener reposo, evitar esfuerzos y administrar analgésicos prescritos.'),
       (37, '2026-06-17', '2026-06-24', 'Seguimiento del proceso de cicatrización.', 'Mantener la herida limpia y asistir al retiro de suturas en la fecha indicada.'),
       (38, '2026-06-17', '2026-06-18', 'Control preventivo sin necesidad de tratamiento farmacológico.', 'Continuar con los controles veterinarios de rutina.'),
       (39, '2026-06-18', '2026-06-25', 'Tratamiento para infección respiratoria leve.', 'Administrar antibióticos completos y evitar la exposición al frío.'),
       (40, '2026-06-18', '2026-07-18', 'Seguimiento nutricional y control del peso corporal.', 'Mantener la dieta recomendada y realizar actividad física moderada.');

-- ============================================================
-- 11° INSERT: medicamentos (20 Inserts)
-- ============================================================
INSERT INTO medicamentos (nombre_m, presentacion_m, laboratorio_m, precio_m, stock_m)
VALUES ('Epiotic Complete', 'Suspensión ótica 125ml', 'Virbac', 18.50, 25),
       ('Synulox Tablets', 'Blíster 10 tabletas 250mg', 'Zoetis', 14.25, 40),
       ('Metonil Jarabe', 'Frasco 30ml', 'Calox', 8.00, 30),
       ('Bravecto Perros', 'Tableta masticable 20-40kg', 'MSD', 38.00, 15),
       ('Simparica Trio', 'Tableta masticable 5-10kg', 'Zoetis', 22.00, 20),
       ('Doxitabs', 'Blíster 10 tabletas 100mg', 'Veterina', 9.50, 50),
       ('Tobramicina Gotas', 'Frasco gotero ophthalmic', 'Laboratorios', 7.50, 25),
       ('Meloxicam Solución', 'Frasco gotas 10ml 0.5%', 'Drag Pharma', 11.20, 35),
       ('Enrofloxacina', 'Blíster 10 tabletas 150mg', 'Calox', 12.00, 45),
       ('Fortekor 5mg', 'Caja 28 tabletas', 'Elanco', 29.50, 12),
       ('Malaseb Champú', 'Frasco 250ml', 'Dermavet', 24.00, 18),
       ('Drontal Plus', 'Tableta individual', 'Elanco', 4.50, 100),
       ('NexGard Spectra', 'Tableta masticable 2-3.5kg', 'Boehringer', 19.75, 22),
       ('Clindamicina', 'Caja 16 cápsulas 150mg', 'Drag Pharma', 13.10, 30),
       ('Ketosteril Vet', 'Caja 100 tabletas', 'Fresenius', 55.00, 8),
       ('Prednisolona 5mg', 'Blíster 10 tabletas', 'Calox', 4.20, 60),
       ('Cranberry Urinary', 'Frasco 60 tabletas mastic', 'Nutri-Vet', 21.50, 14),
       ('Tramadol Gotas', 'Frasco gotero 20ml', 'Drag Pharma', 13.40, 28),
       ('Amoxicilina + AC', 'Frasco suspensión 60ml', 'Zoetis', 16.50, 35),
       ('Canisulta', 'Ungüento dérmico 15g', 'Veterina', 9.00, 40),
	   ('Cerenia', 'Caja 4 tabletas 24mg', 'Zoetis', 27.50, 18),
       ('Apoquel', 'Caja 20 tabletas 16mg', 'Zoetis', 48.00, 12),
       ('Aureomicina Oftálmica', 'Tubo 3.5g', 'Pfizer', 11.50, 25),
       ('Baytril', 'Blíster 10 tabletas 50mg', 'Elanco', 18.75, 30),
       ('Omeprazol Vet', 'Caja 14 cápsulas 20mg', 'Calox', 9.80, 40),
       ('Lactato de Ringer', 'Bolsa 500ml', 'Baxter', 6.50, 60),
       ('Atopica', 'Caja 15 cápsulas 50mg', 'Elanco', 62.00, 10),
       ('Rimadyl', 'Blíster 14 tabletas 50mg', 'Zoetis', 26.00, 22),
       ('Metronidazol Vet', 'Caja 20 tabletas 250mg', 'Drag Pharma', 14.50, 35),
       ('Mupirocina Ungüento', 'Tubo 15g', 'Calox', 8.90, 28);


-- ============================================================
-- 12° INSERT: detalles_tratamientos (Automatizado por Trigger)
-- ============================================================
INSERT INTO detalles_tratamientos (id_detalle_tratamiento, id_tratamiento, id_medicamento, dosis_dt, frecuencia_dt, duracion_dias_dt)
VALUES (1, 1, 1, '5 gotas por oído afectado', 'Cada 12 horas', 7), -- El trigger asignará: id_detalle_tratamiento = 1
       (2, 1, 19, '1.5 ml vía oral', 'Cada 12 horas', 7),          -- El trigger asignará: id_detalle_tratamiento = 2
       (3, 2, 19, '2.0 ml vía oral', 'Cada 12 horas', 5),          -- Inicia nuevo padre, trigger asignará: 1
       (4, 2, 3, '1.0 ml vía oral', 'Cada 8 horas', 3),            -- Trigger asignará: 2
       (5, 3, 4, '1 tableta masticable total', 'Dosis única', 1),
       (6, 4, 6, '1/2 tableta vía oral', 'Cada 12 horas', 7),
       (7, 5, 7, '2 gotas en ojo izquierdo', 'Cada 6 horas', 7),
       (8, 6, 7, '1 gota en ojo derecho', 'Cada 4 horas', 10),
       (9, 6, 8, '6 gotas vía oral', 'Cada 24 horas', 5),
       (10, 7, 8, '12 gotas vía oral', 'Cada 24 horas', 5),
       (11, 7, 14, '1 cápsula vía oral', 'Cada 12 horas', 10),
       (12, 8, 10, '1/2 tableta vía oral', 'Cada 24 horas', 180),
       (13, 9, 11, 'Baño completo dos por semana', 'Cada 3 días', 14),
       (14, 10, 12, '1 tableta y media vía oral', 'Dosis única', 1),
       (15, 11, 5, '1 tableta masticable total', 'Dosis única', 1),
       (16, 12, 14, '1/2 cápsula vía oral', 'Cada 12 horas', 7),
       (17, 13, 15, '1/4 tableta vía oral', 'Cada 24 horas', 180),
       (18, 14, 17, '1 tableta triturada en comida', 'Cada 12 horas', 7),
       (19, 15, 5, '1 tableta masticable total', 'Dosis única', 1),
       (20, 16, 19, '1.0 ml suspensión vía oral', 'Cada 12 horas', 10);

--NUEVOS DATOS
INSERT INTO detalles_tratamientos (id_detalle_tratamiento, id_tratamiento, id_medicamento, dosis_dt, frecuencia_dt, duracion_dias_dt)
VALUES
       (21, 21, 2,  '5 ml jarabe vía oral',               'Cada 12 horas', 7), 
       (22, 22, 9,  '1 tableta vía oral',                 'Cada 12 horas', 7),   
       (23, 22, 8,  '8 gotas vía oral',                   'Cada 24 horas', 5),   
       (24, 23, 3,  '1.5 ml vía oral',                    'Cada 12 horas', 7),   
       (25, 24, 4,  '1 tableta masticable total',          'Dosis única',   1),  
       (26, 25, 11, 'Baño completo dos veces por semana', 'Cada 3 días',   14),  
       (27, 26, 16, '1/2 tableta vía oral',               'Cada 24 horas', 14),  
       (28, 27, 5,  '1 tableta masticable total',          'Dosis única',   1),   
       (29, 28, 19, '1.0 ml suspensión vía oral',         'Cada 12 horas', 7),   
       (30, 29, 7,  '1 tableta vía oral',                 'Cada 24 horas', 7),
	   (31, 31, 21, '1 tableta vía oral',                 'Cada 24 horas', 5),
       (32, 32, 22, '1/2 tableta vía oral',               'Cada 24 horas', 14),
       (33, 33, 30, 'Aplicar una capa fina sobre la lesión', 'Cada 12 horas', 10),
       (34, 34, 29, '1 tableta vía oral',                 'Cada 12 horas', 7),
       (35, 35, 27, '1 cápsula vía oral',                 'Cada 24 horas', 21),
       (36, 36, 28, '1 tableta vía oral',                 'Cada 12 horas', 7),
       (37, 37, 26, '1 dosis intravenosa',                'Cada 24 horas', 3),
       (38, 38, 23, '2 gotas en el ojo afectado',         'Cada 8 horas', 7),
       (39, 39, 24, '1 tableta vía oral',                 'Cada 24 horas', 10),
       (40, 40, 25, '1 cápsula vía oral',                 'Cada 24 horas', 14);


-- ============================================================
-- 13° INSERT: facturas (20 Inserts)
-- ============================================================
INSERT INTO facturas (id_cita, fecha_emision_f, estado_f, total_f)
VALUES (1, '2025-01-10', 'Pendiente', 0),   -- id_factura: 1  (Cuadra con Detalles F1)
       (2, '2025-01-15', 'Pendiente', 0),   -- id_factura: 2  (Cuadra con Detalles F2)
       (3, '2025-01-20', 'Pagada', 18.00),
       (4, '2025-01-25', 'Pendiente', 0),   -- id_factura: 4  (Cuadra con Detalles F4)
       (5, '2025-02-01', 'Pagada', 22.00),
       (6, '2025-02-05', 'Pendiente', 0),   -- id_factura: 6  (Cuadra con Detalles F6)
       (7, '2025-02-10', 'Pagada', 20.00),
       (8, '2025-02-15', 'Pagada', 20.00),
       (9, '2025-02-20', 'Pagada', 79.50),
       (10, '2025-02-25', 'Pagada', 25.00),
       (12, '2025-03-06', 'Pagada', 47.50),
       (13, '2025-03-10', 'Pagada', 49.20),
       (14, '2025-03-15', 'Pendiente', 0), -- id_factura: 13 (Cuadra con Detalles F14)
       (16, '2025-03-25', 'Pagada', 139.50),
       (19, '2025-04-10', 'Pagada', 71.00),
       (24, '2025-05-05', 'Pagada', 61.50),
       (26, '2025-05-15', 'Pagada', 62.00),
       (31, '2025-06-11', 'Pendiente', 0), -- id_factura: 18 (Cuadra con Detalles F18)
       (34, '2025-06-25', 'Pagada', 109.00),
       (35, '2025-06-28', 'Pagada', 81.50),
       (61, '2026-06-15', 'Pendiente', 0),
       (62, '2026-06-15', 'Pendiente', 0),
       (63, '2026-06-16', 'Pendiente', 0),
       (64, '2026-06-16', 'Pendiente', 0),
       (65, '2026-06-16', 'Pendiente', 0),
       (66, '2026-06-17', 'Pendiente', 0),
       (67, '2026-06-17', 'Pendiente', 0),
       (68, '2026-06-17', 'Pendiente', 0),
       (69, '2026-06-18', 'Pendiente', 0),
       (70, '2026-06-18', 'Pendiente', 0);


-- ============================================================
-- 14° INSERT: detalles_facturas (Automatizado por Trigger)
-- ============================================================
INSERT INTO detalles_facturas (id_detalle_factura, id_factura, id_cita, id_medicamento, id_tratamiento, id_procedimiento, descripcion_df,
                               cantidad_df, precio_unit_df)
VALUES
-- Factura 1 (Otitis de Max) - Se auto-generarán renglones del 1 al 4
(1, 1, 1, NULL, NULL, NULL, 'Costo de atención - Consulta Médica Base', 1, 20.00),
(2, 1, NULL, NULL, NULL, 1, 'Procedimiento Clínico: Limpieza ótica profunda', 1, 15.00),
(3, 1, NULL, 1, 1, NULL, 'Medicamento Recetado: Epiotic Complete 125ml', 1, 18.50),
(4, 1, NULL, 19, 1, NULL, 'Medicamento Recetado: Amoxicilina + AC Suspensión', 1, 16.75),

-- Factura 2 (Vacunación de Luna) - Se auto-generará renglón 1
(5, 2, 2, NULL, NULL, NULL, 'Costo de atención - Vacunación anual', 1, 25.00),

-- Factura 4 (Gastroenteritis de Nala) - Se auto-generarán renglones del 1 al 3
(6, 4, 4, NULL, NULL, NULL, 'Costo de atención - Desparasitación clínica', 1, 15.00),
(7, 4, NULL, NULL, NULL, 2, 'Procedimiento Clínico: Fluidoterapia ambulatoria', 1, 25.00),
(8, 4, NULL, 19, 2, NULL, 'Medicamento Recetado: Amoxicilina + AC 60ml', 1, 14.25),

-- Factura 6 (Dermatitis de Tiny) - Se auto-generarán renglones del 1 al 3
(8, 6, 6, NULL, NULL, NULL, 'Costo de atención - Consulta dermatológica', 1, 30.00),
(9, 6, NULL, NULL, NULL, 3, 'Procedimiento Clínico: Raspado de piel superficial', 1, 10.00),
(10, 6, NULL, 4, 3, NULL, 'Medicamento Recetado: Bravecto Pastilla masticable', 1, 38.00),

-- Factura 13 (Cirugía de pierna de Simon - Se auto-generarán renglones del 1 al 5)
(11, 13, 14, NULL, NULL, NULL, 'Costo de atención - Control postoperatorio', 1, 40.00),
(12, 13, NULL, NULL, NULL, 6, 'Procedimiento Clínico: Radiografía digital de fémur', 1, 40.00),
(13, 13, NULL, NULL, NULL, 7, 'Procedimiento Quirúrgico: Fijación interna ósea', 1, 350.00),
(14, 13, NULL, 8, 7, NULL, 'Medicamento Analgésico: Meloxicam Solución gotas', 1, 11.20),
(15, 13, NULL, 14, 7, NULL, 'Medicamento Antibiótico: Clindamicina 150mg', 1, 16.90),

-- Factura 18 (Problema dental felino - Se auto-generarán renglones del 1 al 7)
(16, 18, 31, NULL, NULL, NULL, 'Costo de atención - Vacunación anual base', 1, 25.00),
(17, 18, NULL, NULL, NULL, 12, 'Procedimiento Dental: Profilaxis ultrasónica', 1, 60.00),
(18, 18, NULL, NULL, NULL, 14, 'Procedimiento Quirúrgico: Extracción de incisivo', 3, 20.00),
(19, 18, NULL, 14, 12, NULL, 'Medicamento Antibiótico: Clindamicina caja', 2, 13.10),
(20, 21, 61, NULL, NULL, NULL, 'Costo de atención - Consulta médica general', 1, 20.00),
(21, 21, NULL, NULL, NULL, 31, 'Procedimiento Clínico: Consulta clínica preventiva', 1, 18.00),
(22, 21, NULL, 21, 31, NULL, 'Medicamento Recetado: Cerenia', 1, 27.50),

-- Factura 22 (Traqueobronquitis de Rocky - Se auto-generarán renglones del 1 al 3)
(23, 22, 62, NULL, NULL, NULL, 'Costo de atención - Vacunación anual', 1, 25.00),
(24, 22, NULL, NULL, NULL, 32, 'Procedimiento Clínico: Aplicación de vacuna séxtuple', 1, 30.00),
(25, 22, NULL, 22, 32, NULL, 'Medicamento Recetado: Apoquel', 1, 48.00),

-- Factura 23 (Alergia de Bella - Se auto-generarán renglones del 1 al 3)
(26, 23, 63, NULL, NULL, NULL, 'Costo de atención - Evaluación nutricional', 1, 20.00),
(27, 23, NULL, NULL, NULL, 33, 'Procedimiento Clínico: Evaluación nutricional', 1, 20.00),
(28, 23, NULL, 30, 33, NULL, 'Medicamento Recetado: Mupirocina Ungüento', 1, 8.90),

-- Factura 24 (Gastroenteritis de Nala - Se auto-generarán renglones del 1 al 3)
(29, 24, 64, NULL, NULL, NULL, 'Costo de atención - Consulta por gastroenteritis', 1, 25.00),
(30, 24, NULL, NULL, NULL, 34, 'Procedimiento Clínico: Fluidoterapia intravenosa', 1, 35.00),
(31, 24, NULL, 29, 34, NULL, 'Medicamento Recetado: Metronidazol Vet', 1, 14.50),

-- Factura 25 (Dermatitis de Tiny - Se auto-generarán renglones del 1 al 3)
(32, 25, 65, NULL, NULL, NULL, 'Costo de atención - Consulta dermatológica', 1, 30.00),
(33, 25, NULL, NULL, NULL, 35, 'Procedimiento Clínico: Baño dermatológico medicado', 1, 25.00),
(34, 25, NULL, 27, 35, NULL, 'Medicamento Recetado: Atopica', 1, 62.00),

-- Factura 26 (Control postquirúrgico de Simon - Se auto-generarán renglones del 1 al 3)
(35, 26, 66, NULL, NULL, NULL, 'Costo de atención - Control postquirúrgico', 1, 30.00),
(36, 26, NULL, NULL, NULL, 36, 'Procedimiento Clínico: Control postquirúrgico', 1, 22.00),
(37, 26, NULL, 28, 36, NULL, 'Medicamento Recetado: Rimadyl', 1, 26.00),

-- Factura 27 (Retiro de suturas de Simon - Se auto-generarán renglones del 1 al 3)
(38, 27, 67, NULL, NULL, NULL, 'Costo de atención - Retiro de suturas', 1, 20.00),
(39, 27, NULL, NULL, NULL, 37, 'Procedimiento Clínico: Retiro de suturas', 1, 15.00),
(40, 27, NULL, 26, 37, NULL, 'Medicamento Recetado: Lactato de Ringer', 1, 6.50),

-- Factura 28 (Consulta preventiva de Max - Se auto-generarán renglones del 1 al 3)
(41, 28, 68, NULL, NULL, NULL, 'Costo de atención - Consulta preventiva', 1, 20.00),
(42, 28, NULL, NULL, NULL, 38, 'Procedimiento Clínico: Desparasitación preventiva', 1, 18.00),
(43, 28, NULL, 23, 38, NULL, 'Medicamento Recetado: Aureomicina Oftálmica', 1, 11.50),

-- Factura 29 (Consulta respiratoria de Rocky - Se auto-generarán renglones del 1 al 3)
(44, 29, 69, NULL, NULL, NULL, 'Costo de atención - Consulta respiratoria', 1, 25.00),
(45, 29, NULL, NULL, NULL, 39, 'Procedimiento Clínico: Nebulización', 1, 20.00),
(46, 29, NULL, 24, 39, NULL, 'Medicamento Recetado: Baytril', 1, 18.75),

-- Factura 30 (Control nutricional de Bella - Se auto-generarán renglones del 1 al 3)
(47, 30, 70, NULL, NULL, NULL, 'Costo de atención - Control nutricional', 1, 20.00),
(48, 30, NULL, NULL, NULL, 40, 'Procedimiento Clínico: Control nutricional', 1, 18.00),
(49, 30, NULL, 25, 40, NULL, 'Medicamento Recetado: Omeprazol Vet', 1, 9.80);
