/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD 'data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:chararray, c3:int);
B = ORDER A BY c3;
C = FOREACH B generate c3;
D = LIMIT C 3;
STORE D into 'output/q3.out';
