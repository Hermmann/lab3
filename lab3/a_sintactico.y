%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdbool.h>
    #include "y.tab.h"

    void yyerror(char *);
    int yylex(void);
    extern bool errLex;
    int errSin = 0;
%}

%token NUMBER SUM RES MUL DIV PARA PARC OR AND XOR NOT

%%

statement : expression { } // '\n'
          | error { errSin++; yyclearin; yyerrok; }
          ;


expression:  |expression SUM expression 
             |expression RES expression
             | expression MUL expression
             | expression DIV expression
             | expression OR expression
             | expression AND expression
             | expression XOR expression
             | NOT expression 
             | PARA expression PARC
             | NUMBER
            
            ;

       
%%

 
/***
expression: | expression SUM expression 
            | expression RES expression
            | expression MUL expression
            | expression DIV expression
            | expression OR expression
            | expression AND expression
            | expression XOR expression
            | NOT expression 
            | PARA expression PARC
            | NUMBER
            | error
            ;
       

%%
***/
void yyerror(char *s) {
    printf(" | %s", s);
    
}


int main(void) {
    freopen("entrada.txt", "r", stdin);
    freopen("salida.txt", "w", stdout);
    printf("Componentes Léxicos:");
    yyparse();

    printf("\n\nAnálisis Sintáctico\n");
    if(errLex){
        printf("No se ejecuta");
    }else{
        if(errSin==0){
            printf("Correcto!");
        }else{
            printf("Errores Sintácticos: %d\n", errSin);
        }
    }
    

    
}