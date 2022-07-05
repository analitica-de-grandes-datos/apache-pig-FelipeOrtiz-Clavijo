/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_05/data.tsv' USING PigStorage('\t') AS (c1: chararray, c2: bag {T: tuple(t1:chararray)}, c3: map []);
B = FOREACH A generate c1, SIZE(c2) as c2, SIZE(c3) as c3;
C = ORDER B BY c1, c2, c3;
STORE C into 'output/q7.out';
