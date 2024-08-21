%option noyywrap
IDENTIFICADOR [a-z][a-z0-9]*
DIGITO [0-9]
ASIGNACION [=]
RESERVADAS "wh"+["ile"|"en"]+
OPERADOR "+"|"-"|"*"|"/"|"++"|"--"
RELACION ">"|"<"|">="|"<="|"<>"

%%
{RESERVADAS} {printf("Palabra reservada: %s\n", yytext);}
{IDENTIFICADOR} {printf("Identificador: %s\n", yytext);}
{DIGITO}+ {printf("Entero: %d\n", atoi(yytext));}
{DIGITO}+"."+{DIGITO}* {printf("Real: %.2f\n", atof(yytext));}
{ASIGNACION} {printf("Asignación: %s\n", yytext);}
{OPERADOR} printf("Operador: %s\n", yytext);
{RELACION} printf("Relación: %s\n", yytext);

%%
int main(int argc, char** argv){
    ++argv, --argc;
    if(argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;
    yylex();
}
