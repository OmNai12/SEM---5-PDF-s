%{
#include<stdio.h>
int flag=0;
%}
%%
[a-z]+ {ECHO;}
%%
int main()
{
yylex();
}
int yywrap()
{
if(flag==0)
{
	yyin=fopen("data.txt","r");
	flag=1;
	return 0;
}
return 1;
}
