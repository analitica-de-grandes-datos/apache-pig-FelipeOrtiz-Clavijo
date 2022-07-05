/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       LOCATE('ia', firstname) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_27/data.csv' USING PigStorage(',') AS (c1:int, c2:chararray, c3:chararray, c4:chararray, c5:chararray, c6:int);
B = FOREACH A generate INDEXOF(c2, 'ia', 0) as loc;
STORE B into 'output/q27.out';
