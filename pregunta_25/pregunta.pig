/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_25/data.csv' USING PigStorage(',') AS (id:int, firstname:chararray, lastname:chararray, dob:chararray, color:chararray, level:int);
B = FOREACH A generate INDEXOF(firstname, 'a', 1);
STORE C into 'output/q25.out';
