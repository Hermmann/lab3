lex a_lexico.l
bison -d -y a_sintactico.y
gcc lex.yy.c y.tab.c -o out
./out entrada.txt
echo "Analisis lexico y sintactico realizado correctamente."