%option noyywrap
%{
    #include<stdio.h>
    #include<stdbool.h>
%}
%%
[a-zA-Z]+ {
    bool flag =true;
    printf("String : %s\n",yytext);
    for(int i=0;i<yyleng -1;i++)
    {
        for(int j=i+1;j<yyleng;j++)
        {
            if(yytext[i] >yytext[j])
            {
                flag = false;
                break;
            }
        }
        if(!flag)
        break;
    }
    if(flag)
    printf("String is in lexical order\n");
    else
    printf("String is not in lexical order\n");
}
[.\n ];
%%
int main(void){
    yylex();
}
