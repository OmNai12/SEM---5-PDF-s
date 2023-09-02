%option noyywrap
%{
%}

%%

^((00|11)(0|1)*|(0|1)*(00|11))$ {printf("Correct !!");}

%%
int main(void) {
yylex();
printf("Program ends\n");
return 0;
}