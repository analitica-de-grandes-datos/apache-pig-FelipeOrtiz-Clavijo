/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD 'data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:chararray, c3:int);
B = GROUP A BY c1;
C = FOREACH B GENERATE group, COUNT(A);
STORE C into 'output/q1.out';
