%option noyywrap
%{

    #include <stdio.h>
    #include <string.h>

    char enc[100000];
    int k=4;
    char c;
    int tmp;

%}

%%
[a-zA-Z] {
    
    if(yyleng ==1)
    {tmp = ((int)yytext[0] -65 +k )%26;
    c=tmp+26;
    strcat(enc,&c);

    }

}
[.\n ];
%%

int main(void)
{
    yyin= fopen("x.txt","r");
    yylex();
    printf("Encrypted : %s\n",enc);
}