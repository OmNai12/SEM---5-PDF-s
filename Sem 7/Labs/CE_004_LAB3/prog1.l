%option noyywrap
%{
#include<stdio.h>
int flag=0;
%}
%%
(.*a.*e.*i.*o.*u.*) {ECHO;flag=1;}
[\n] {if(flag)
	printf(" true\n");	
      else
      	printf(" false\n");
      flag=0;
}
%%
int main()
{
yylex();
}

