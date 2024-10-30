-- Inserta al menos cinco nuevos estudiantes en la tabla «estudiantes».
INSERT INTO estudiantes (nombre, edad)
VALUES 
('Karla', 25),
('Felipe', 25),
('Zafiro', 20),
('Catalina', 21),
('Sebastian', 19);

-- Inserta al menos cuatro nuevos cursos en la tabla «cursos». 
INSERT INTO cursos (nombre, duracion)
VALUES
('Programación Orientada a Objeto', 36),
('Fundamentos de la Web', 24),
('Introducción a la programación con JAVA', 31),
('Bases de datos', 45);

SELECT * FROM estudiantes;
SELECT * FROM cursos;
SELECT * FROM inscripciones;

DELETE FROM estudiantes WHERE id_estudiante > 0;
ALTER TABLE estudiantes auto_increment =1;

DELETE FROM inscripciones WHERE estudiantes_id_estudiante > 0;
ALTER TABLE inscripciones AUTO_INCREMENT=1;

-- Asociar a cuatro de los estudiantes a al menos dos de los cursos dados de alta.
INSERT INTO inscripciones (estudiantes_id_estudiante, cursos_id_curso)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(4, 3),
(4, 4);

-- Proyecta a todos los estudiantes y sus respectivos cursos. (CON Y SIN JOIN)
SELECT E.nombre, C.nombre
FROM (estudiantes E, cursos C) INNER JOIN inscripciones I
ON E.id_estudiante = I.estudiantes_id_estudiante AND 
C.id_curso = I.cursos_id_curso
ORDER BY E.nombre;

SELECT E.nombre, C.nombre
FROM estudiantes E, cursos C, inscripciones I
WHERE E.id_estudiante = I.estudiantes_id_estudiante AND 
C.id_curso = I.cursos_id_curso
ORDER BY E.nombre;

-- Proyecta todos los estudiantes que están inscritos en un curso específico, 
-- utilizando el nombre del curso como criterio de búsqueda. (CON Y SIN JOIN)
SELECT E.nombre AS Estudiante, C.nombre AS Curso
FROM (estudiantes E, cursos C) INNER JOIN inscripciones I
ON E.id_estudiante = I.estudiantes_id_estudiante AND 
C.id_curso = I.cursos_id_curso AND C.nombre = 'Introducción a la programación con JAVA';

SELECT E.nombre AS Estudiante, C.nombre AS Curso
FROM estudiantes E, cursos C, inscripciones I
WHERE E.id_estudiante = I.estudiantes_id_estudiante
AND C.id_curso = I.cursos_id_curso
AND C.nombre = 'Introducción a la programación con JAVA';
-- Nombres cursos:
-- Programación Orientada a Objeto
-- Fundamentos de la Web
-- Introducción a la programación con JAVA
-- Bases de datos

-- Proyecta todos los cursos en los que está inscrito un estudiante específico,
-- utilizando su nombre como criterio de búsqueda. (CON Y SIN JOIN)
SELECT E.nombre AS Estudiante, C.nombre AS Curso
FROM (estudiantes E, cursos C) INNER JOIN inscripciones I
ON E.id_estudiante = I.estudiantes_id_estudiante AND 
C.id_curso = I.cursos_id_curso AND E.nombre = 'Karla';

SELECT E.nombre AS Estudiante, C.nombre AS Curso
FROM estudiantes E, cursos C, inscripciones I
WHERE E.id_estudiante = I.estudiantes_id_estudiante
AND C.id_curso = I.cursos_id_curso
AND E.nombre = 'Karla';
-- Nombres Estudiantes con cursos asociados: Karla - Felipe - Catalina - Zafiro

-- Cuenta el número de estudiantes inscritos en cada curso 
-- y muestra el nombre del curso junto con el número de estudiantes inscritos. (CON Y SIN JOIN)
SELECT C.nombre AS Curso, COUNT(I.cursos_id_curso) AS TotaldeInscritos
FROM cursos C INNER JOIN inscripciones I
ON I.cursos_id_curso = C.id_curso
GROUP BY I.cursos_id_curso;

SELECT C.nombre AS Curso, COUNT(I.cursos_id_curso) AS TotaldeInscritos
FROM  cursos C, inscripciones I
WHERE I.cursos_id_curso = C.id_curso
GROUP BY I.cursos_id_curso;

-- Encuentra los estudiantes que no están inscritos en ningún curso.
SELECT E.nombre 
FROM estudiantes E LEFT JOIN inscripciones I
ON E.id_estudiante = I.estudiantes_id_estudiante
WHERE I.estudiantes_id_estudiante IS NULL;

