

albums existentes* -> 16,17 y 19. ordenamientos posibles** -> genero, anio, banda, album, nombre e id.

1)http://localhost/tp2web2/api/songs -> GET a la lista entera de canciones, por default ordenadas ascendentemente.

2)http://localhost/tp2web2/api/songs/:ID-> GET a una cancion puntual (). Ej: http://localhost/tp2web2/api/songs/31

3)El formato para agregar elementos a la db mediante POST es: { "genero": "genero", "anio": "anio", "banda": "banda", "album": 16,17 o 19, "nombre": "nombre". }

4)http://localhost/tp2web2/api/songs?orden="orden"&tipo=(asc o desc). Con este endpoint más cualquiera de los ordenamientos posibles** y tipos obtenemos nuevamente la lista completa de canciones, ordenadas de distintas maneras, según se desee. Aclaración: el TIPO de ordenamiento es obligatorio. Ej: http://localhost/tp2web2/api/songs?orden=id&tipo=asc
