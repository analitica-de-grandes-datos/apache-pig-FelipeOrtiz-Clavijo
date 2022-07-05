/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_31/data.csv' USING PigStorage(',') AS (c1:int, c2:chararray, c3:chararray, c4:chararray, c5:chararray, c6:int);
B = FOREACH A generate GetYear(ToDate(c4,'yyyy-MM-dd')) as year, c2;
C = GROUP B BY year;
D = FOREACH C GENERATE group, COUNT(B);
STORE D into 'output/q31.out';
