/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
A = LOAD '_16/data.csv' USING PigStorage(',') AS (id:int, firstname:chararray, lastname:chararray, birthday:chararray, color:chararray, level:int);
B = FILTER A BY color == 'blue' OR firstname MATCHES 'K.*';
C = FOREACH B generate firstname, color;
STORE C into 'output/q16.out';
