/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD '_08/data.tsv' USING PigStorage('\t') AS (c1: chararray, c2: bag {T: tuple(t1:chararray)}, c3: map []);
B = FOREACH A generate FLATTEN(c2) as c2_flat, FLATTEN(c3) as c3_flat;
C = group B BY (c2_flat, c3_flat); 
D = FOREACH C generate group, COUNT(B);
STORE C into 'output/q8.out';
