%{
int num_lines = 0;
int num_chars = 0;
%}

%%
\n	++num_lines; ++num_chars;
.	++num_chars;

%%

int main(){
	yylex();
	printf("Total de lineas = %d\nTotal de caracteres = %d\n ", num_lines, num_chars);
}
