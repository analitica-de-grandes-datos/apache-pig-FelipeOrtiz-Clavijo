/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_05/data.tsv' USING PigStorage('\t') AS (c1: chararray, c2: bag {T: tuple(t1:chararray)}, c3: map []);
B = FOREACH A generate FLATTEN(c2) as c2_flat;
C = GROUP B by c2_flat;
D = FOREACH C generate group, COUNT(B);
STORE D into 'output/q5.out';
