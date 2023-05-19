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


expression:  NUMBER                       
            | expression SUM expression  
            | expression RES expression  
            | expression MUL expression  
            | expression DIV expression  
            | PARA expression PARC       

            | expression OR expression   
            | expression AND expression  
            | expression XOR expression  
            | NOT expression             

            ;
       
%%

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