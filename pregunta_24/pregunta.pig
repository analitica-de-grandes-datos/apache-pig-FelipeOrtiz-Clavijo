/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_24/data.csv' USING PigStorage(',') AS (id:int, firstname:chararray, lastname:chararray, birthday:chararray, color:chararray, level:int);
B = FOREACH A generate REGEX_EXTRACT(birthday, '(\\d+)-(\\d+)-(\\d+)', 2);
STORE B into 'output/q24.out';

