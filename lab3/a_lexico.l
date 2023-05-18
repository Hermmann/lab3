%{
    #include "y.tab.h"
    #include <stdbool.h> 
    #include <stdlib.h>
    void yyerror(char *);
    int num_count = 0;
    bool errLex = false;
%}

%%

[0-1]+      { yylval = atoi(yytext); printf("\nnum%d = %s", ++num_count, yytext); return NUMBER; }
"+"         {yylval = *yytext - 'a'; printf("\nop-sum = +"); return SUM;}
"-"         {yylval = *yytext - 'a'; printf("\nop-menos = -"); return RES;}
"*"         {yylval = *yytext - 'a'; printf("\nop-mult = *"); return MUL;}
"/"         {yylval = *yytext - 'a'; printf("\nop-div = /"); return DIV;}
"("         {yylval = *yytext - 'a'; printf("\npar-a = ("); return PARA;}
")"         {yylval = *yytext - 'a'; printf("\npar-c = )"); return PARC;}

"or"        {yylval = *yytext - 'a'; printf("\nop-or = or"); return OR;}
"and"       {yylval = *yytext - 'a'; printf("\nop-and = and"); return AND;}
"xor"       {yylval = *yytext - 'a'; printf("\nop-xor = xor"); return XOR;}
"not"       {yylval = *yytext - 'a'; printf("\nop-not = not"); return NOT;}

[ \t]       ;/* ignorar espacios y tabuladores */
[\r\n]      ;/* ignorar saltos de línea */

.           {errLex = true; printf("\nERROR Léxico!!");}

%%

int yywrap(void) {
    return 1;
}