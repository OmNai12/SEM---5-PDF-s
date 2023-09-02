%{
#include<stdio.h>
int flag=0;
%}
%%
[a-zA-Z]+ {fprintf(yyout,"%s",yytext);}
%%
int main()
{
yylex();
}
int yywrap()
{
	if(flag==0)
	{
		yyout=fopen("data.txt","r");
		return 0;
	}
	
	else if(flag==1)
	{
		yyin=fopen("data.txt","r");
		flag=2;
		return 0;
	}
	return 1;
}
