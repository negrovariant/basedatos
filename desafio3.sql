

-- paso 1 se crea base de datos llamada movies

CREATE DATABASE movies;

--nos conectamos a la base de datos

\c movies;

--creamos tabla llamada peliculas

CREATE TABLE peliculas(
id INT PRIMARY KEY,
peliculas VARCHAR(255),
año_estreno INT,
director VARCHAR
);


--creamos tabla llamada reparto

CREATE TABLE reparto(
  id SERIAL PRIMARY KEY, 
  pelicula_id INT,
  actor VARCHAR (50),
  FOREIGN KEY (pelicula_id)
  REFERENCES peliculas (id )
);

--paso 2 importamos archivo csv a las tablas correspondientes

\COPY peliculas (id, peliculas, año_estreno, director) FROM 'C:\Users\paran\Desktop\Ruby-on-Rails\SQL\desafio3sql\peliculas.csv' csv header;
\COPY reparto (pelicula_id, actor) FROM 'C:\Users\paran\Desktop\Ruby-on-Rails\SQL\desafio3sql\reparto.csv' csv;

--paso 3 Obtener el ID de la película “Titanic”.

SELECT id FROM peliculas WHERE peliculas ='Titanic';

--resultado
id
----
2
(1 fila)

--paso 4 Listar a todos los actores que aparecen en la película "Titanic".

SELECT actor AS actores FROM reparto WHERE pelicula_id = (SELECT id FROM peliculas WHERE peliculas ='Titanic');

--resultado
      actores
-------------------
Leonardo DiCaprio
Kate Winslet
Billy Zane
Kathy Bates
Frances Fisher
Bernard Hill
Jonathan Hyde
Danny Nucci
David Warner
Bill Paxton
Gloria Stuart
Victor Garber
Suzy Amis
(13 filas)

--paso 5 Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT COUNT(pelicula_id) AS total_peliculas_de_Harrison_Ford FROM reparto WHERE actor = 'Harrison Ford';

--resultado

total_peliculas_de_harrison_ford
----------------------------------
            8
(1 fila)

--paso 6 Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.

SELECT * FROM peliculas WHERE año_estreno BETWEEN 1990 AND 1999 ORDER BY peliculas ASC;

-- resultado

id |                 peliculas                  | año_estreno |       director
----+--------------------------------------------+-------------+-----------------------
 76 | American Beauty                            |        1999 | Sam Mendes
 20 | American History X                         |        1998 | Tony Kaye
  9 | Braveheart                                 |        1995 | Mel Gibson
  7 | Cadena perpetua                            |        1994 | Frank Darabont
 12 | Eduardo Manostijeras                       |        1990 | Tim Burton
 27 | El club de la pelea                        |        1999 | David Fincher
 68 | El Padrino. Parte III                      |        1990 | Francis Ford Coppola
 75 | El profesional                             |        1994 | Luc Besson
 22 | El sexto sentido                           |        1999 | M. Night Shyamalan
 45 | El show de Truman                          |        1998 | Peter Weir
 25 | El silencio de los corderos                |        1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |        1994 | Neil Jordan
  1 | Forest Gump                                |        1994 | Robert Zemeckis
 42 | Hombres de negro                           |        1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |        1993 | Steven Spielberg
 31 | La milla verde                             |        1999 | Frank Darabont
 30 | Matrix                                     |        1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         |        1997 | James L. Brooks
 29 | Parque Jur├ísico                           |        1993 | Steven Spielberg
 47 | Pesadilla antes de navidad                 |        1993 | Henry Selick
 23 | Pulp Fiction                               |        1994 | Quentin Tarantino
 14 | Salvar al soldado Ryan                     |        1998 | Steven Spielberg
 39 | Seven                                      |        1995 | David Fincher
 86 | Star Wars. Episodio I: La amenaza fantasma |        1999 | George Lucas
 40 | Terminator 2: el juicio final              |        1991 | James Cameron
  2 | Titanic                                    |        1997 | James Cameron
 11 | Toy Story                                  |        1995 | John Lasseter
 46 | Toy Story 2                                |        1999 | John Lasseter
 79 | Trainspotting                              |        1996 | Danny Boyle
 98 | Uno de los nuestros                        |        1990 | Martin Scorsese
(30 filas)

--paso 7 Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.

SELECT peliculas, LENGTH(peliculas) longitud_titulo FROM peliculas;

--resultado

                       peliculas                       | longitud_titulo
-------------------------------------------------------+-----------------
 Forest Gump                                           |              11
 Titanic                                               |               7
 El Padrino                                            |              10
 Gladiator                                             |               9
 El Se├▒or de los anillos: El retorno del rey          |              44
 El caballero oscuro                                   |              19
 Cadena perpetua                                       |              15
 Piratas del Caribe: La maldici├│n de la Perla Negra   |              51
 Braveheart                                            |              10
 La lista de Schindler                                 |              21
 Toy Story                                             |               9
 Eduardo Manostijeras                                  |              20
 El Se├▒or de los anillos: La comunidad del anillo     |              49
 Salvar al soldado Ryan                                |              22
 Regreso al futuro                                     |              17
 Monstruos S.A.                                        |              14
 Buscando a Nemo                                       |              15
 El Se├▒or de los anillos: Las dos torres              |              40
 Harry Potter y el Prisionero de Azkaban               |              39
 American History X                                    |              18
 300                                                   |               3
 El sexto sentido                                      |              16
 Pulp Fiction                                          |              12
 V de Vendetta                                         |              13
 El silencio de los corderos                           |              27
 Rocky                                                 |               5
 El club de la pelea                                   |              19
 E.T                                                   |               3
 Parque Jur├ísico                                      |              16
 Matrix                                                |               6
 La milla verde                                        |              14
 Ratatouille                                           |              11
 Grease                                                |               6
 El Padrino. Parte II                                  |              20
 Wall-E                                                |               6
 Iron Man                                              |               8
 El exorcista                                          |              12
 Piratas del Caribe: El cofre del hombre muerto        |              46
 Seven                                                 |               5
 Terminator 2: el juicio final                         |              29
 El resplandor                                         |              13
 Hombres de negro                                      |              16
 Spider-Man                                            |              10
 Regreso al futuro II                                  |              20
 El show de Truman                                     |              17
 Toy Story 2                                           |              11
 Pesadilla antes de navidad                            |              26
 Star Wars. Episodio IV: Una nueva esperanza           |              43
 Saw                                                   |               3
 Terminator                                            |              10
 Kill Bill Vol. 1                                      |              16
 Lo que el viento se llev├│                            |              26
 El Laberinto del Fauno                                |              22
 Los incre├¡bles                                       |              15
 El viaje de Chihiro                                   |              19
 El precio del poder                                   |              19
 King Kong                                             |               9
 Ben-Hur                                               |               7
 Indiana Jones y la ├║ltima cruzada                    |              34
 Infiltrados                                           |              11
 Entrevista con el vampiro                             |              25
 Batman Begins                                         |              13
 En busca del arca perdida                             |              25
 Star Wars. Episodio III: La venganza de los Sith      |              48
 Alien                                                 |               5
 El bueno el feo y el malo                             |              25
 Star Wars. Episodio V: El imperio contraataca         |              45
 El Padrino. Parte III                                 |              21
 Star Wars. Episodio VI: El retorno del Jedi           |              43
 Escuela de Rock                                       |              15
 El planeta de los simios                              |              24
 Rambo                                                 |               5
 Full Metal Jacket                                     |              17
 Tibur├│n                                              |               8
 El profesional                                        |              14
 American Beauty                                       |              15
 Casablanca                                            |              10
 Am├®lie                                               |               7
 Trainspotting                                         |              13
 axi driver                                            |              10
 Alguien vol├│ sobre el nido del cuco                  |              36
 Kill Bill Vol. 2                                      |              16
 Spider-Man 2                                          |              12
 X-Men 2                                               |               7
 Transformers                                          |              12
 Star Wars. Episodio I: La amenaza fantasma            |              42
 Blade Runner                                          |              12
 Apocalypse Now                                        |              14
 Mejor... imposible                                    |              18
 La vida de Brian                                      |              16
 El libro de la selva                                  |              20
 Los cazafantasmas                                     |              17
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
 Oceans Eleven                                         |              14
 Blancanieves y los siete enanitos                     |              33
 Predator                                              |               8
 Indiana Jones y el templo maldito                     |              33
 Uno de los nuestros                                   |              19
 Mouling Rouge                                         |              13
 Psicosis                                              |               8
(100 filas)


--paso 8 Consultar cual es la longitud más grande entre todos los títulos de las películas.

SELECT MAX (LENGTH(peliculas)) AS mayor_longitud FROM peliculas;

--resultado

 mayor_longitud
---------------------------
                        53
(1 fila)


--truncado de tablas, requerimiento pendiente del paso 2 

TRUNCATE TABLE peliculas CASCADE;

--resultado 

NOTICE:  truncando además la tabla «reparto»
TRUNCATE TABLE

--revisamos la tabla peliculas
movies=# SELECT * FROM peliculas;
 id | peliculas | año_estreno | director
----+-----------+-------------+----------
(0 filas)

--revisamos la tabla reparto
movies=# SELECT * FROM reparto;
 id | pelicula_id | actor
----+-------------+-------
(0 filas)

--**ambas filas fueron truncadas**

--salimos de la terminal 
\q 
