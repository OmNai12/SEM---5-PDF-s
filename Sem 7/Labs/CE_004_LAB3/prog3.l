%{
    #include<stdio.h>
    char found[]="old";
    char replace[]="new";    
%}
%% 
[a-zA-Z]+ {
        if(strcmp(yytext, found)==0)
            fprintf(yyout,"%s",replace);
        else
            fprintf(yyout,"%s",yytext);
    }
%%
int yywrap()
{
    return 1;
}

int main()  { 
    yyin=fopen("input.txt", "r");
    yyout=fopen("output.txt", "w");
    yylex(); 
    return 0; 
 }

