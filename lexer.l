/*Reglas para el lexer
    - Reconocer identificadores
*/
IDENTIFIER [a-z][a-z0-9]*

%%
{IDENTIFIER}    printf("Identificador: %s\n", yytext);
