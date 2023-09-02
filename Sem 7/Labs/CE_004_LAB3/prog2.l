%option noyywrap
%{
#include<stdio.h>
int num;
%}
%%
[01]* {
	num=atoi(yytext); 
	int dec_value = 0;

	int base = 1;

	int temp = num;
	while (temp) {
		int last_digit = temp % 10;
		temp = temp / 10;

		dec_value += last_digit * base;

		base = base * 2;
	}

	printf("The Number is : %d",dec_value);
}

[^01\n]* {printf("Invalid Input");}
%%
int main()
{
yylex();
}
