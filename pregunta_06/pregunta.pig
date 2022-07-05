/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_06/data.tsv' USING PigStorage('\t') AS (c1: chararray, c2: bag {T: tuple(t1:chararray)}, c3: map []);
B = FOREACH A generate FLATTEN(c3) as c3_flat;
C = GROUP B by c3_flat;
D = FOREACH C generate group, COUNT(B);
STORE D into 'output/q6.out';
