/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_28/data.csv' USING PigStorage(',') AS (c1:int, c2:chararray, c3:chararray, c4:chararray, c5:chararray, c6:int);
B = FOREACH A generate GetYear(ToDate(c4,'yyyy-MM-dd')) as yyyy, ToString(ToDate(c4,'yyyy-MM-dd'), 'YY') as yy;
STORE B into 'output/q28.out';
