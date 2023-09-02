%option noyywrap
%{
  #include<stdio.h>
%}
%%
.    { yymore(); ECHO; putchar('\n'); }
%%
int main(){
yylex();
return 0;
}
