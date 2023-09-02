%option noyywrap
%{
%}
letter (00(0|1)*(00)|(11(0|1)*11))
%%

{letter}+ {printf("Correct !!");}

%%
int main(void) {
yylex();
printf("Program ends\n");
return 0;
}