/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_10/data.csv' USING PigStorage(',') AS (id:int, firstname:chararray, lastname:chararray, birthday:chararray, color:chararray, level:int);
B = FOREACH A generate lastname,SIZE(lastname) as len_lastname;
C = ORDER B BY len_lastname DESC, lastname;
D = LIMIT C 5;
STORE D into 'output/q10.out';
