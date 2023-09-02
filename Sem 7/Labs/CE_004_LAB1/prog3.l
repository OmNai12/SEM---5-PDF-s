%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>

    char a[]="a";
    char an[]="an";
    char the[]="the";
    int c1=0,c2=0,c3=0;
%}
%% 
[a-zA-Z]+ {
    if(strcmp(yytext,a)==0)
     c1++;
     else if(strcmp(yytext,an)==0)
     c2++;
     else if(strcmp(yytext,the)==0)
     c3++;
        }
[.\n ];

%%

int main(void){
    yyin =fopen("x.txt","r");
    yylex();
    printf("Count of a %d\n",c1);
    printf("Count of an %d\n",c2);
    printf("Count of the %d\n",c3);


}