/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
A = LOAD 'data.tsv' USING PigStorage('\t') AS (c1:chararray, c2:chararray, c3:int);
B = ORDER A BY c1, c3;
STORE B into 'output/q2.out';
