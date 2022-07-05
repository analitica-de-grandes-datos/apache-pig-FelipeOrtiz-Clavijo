/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
A = LOAD '_14/data.csv' USING PigStorage(',') AS (id:int, firstname:chararray, lastname:chararray, birthday:chararray, color:chararray, level:int);
B = FILTER A BY NOT color MATCHES 'b.*';
C = FOREACH B generate color;
STORE C into 'output/q14.out';
