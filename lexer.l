%option noyywrap
%{
int num_lines = 1;
%}

IDENTIFICADOR [a-z][a-z0-9]*
DIGITO [0-9]
ASIGNACION [=]
RESERVADAS "wh"+["ile"|"en"]+
OPERADOR "+"|"-"|"*"|"/"|"++"|"--"
RELACION ">"|"<"|">="|"<="|"<>"

%%
[\0\t\b]+   /*Ignorar espacios, excepto salto de línea*/
\n  {++num_lines;}
{RESERVADAS} {printf("Palabra reservada: %s en Línea %d\n", yytext, num_lines);}
{IDENTIFICADOR} {printf("Identificador: %s en Línea %d\n", yytext, num_lines);}
{DIGITO}+ {printf("Entero: %d en Línea %d\n", atoi(yytext), num_lines);}
{DIGITO}+"."?{DIGITO}* {printf("Real: %f en Línea %d\n", atof(yytext), num_lines);}
{ASIGNACION} {printf("Asignación: %s en Línea %d\n", yytext, num_lines);}
{OPERADOR} printf("Operador: %s en Línea %d\n", yytext, num_lines);
{RELACION} printf("Relación: %s en Línea %d\n", yytext, num_lines);
. printf("¡Error! en línea %d\n", num_lines);
%%
int main(int argc, char** argv){
    ++argv, --argc;
    if(argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;
    yylex();
}
