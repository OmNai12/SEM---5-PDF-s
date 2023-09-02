%option noyywrap
%s A B
%{
    #include<stdio.h>
    int counta=0,countb=0;
%}
%%
<INITIAL>a BEGIN A; {counta++;}
<INITIAL>b BEGIN A; {countb++;}
<INITIAL>c BEGIN B; {}
<INITIAL>[^abc\n] BEGIN INITIAL; {
    printf("Not Accepted\n");
    return 0;
}

<A>a BEGIN A; {counta++;}
<A>b BEGIN A; {countb++;}
<A>c BEGIN B; {}
<A>\n BEGIN INITIAL; {
    printf("Middle Element c is not present\n");
    return 0;
}
<A>[^abc\n] BEGIN INITIAL; {
    printf("Not Accepted\n");
    return 0;
}

<B>a BEGIN B; {counta++;}
<B>b BEGIN B; {countb++;}
<B>c BEGIN B; {
    printf("Not Accepted\n");
    return 0;
}
<B>\n BEGIN INITIAL; {
    if(counta==countb){
        printf("Accepted\n");
        return 0;
    }
    else{
        printf("Not Accepted\n");
        return 0;
    }
}
<B>[^abc\n] BEGIN INITIAL; {
    printf("Not Accepted\n");
    return 0;
}

%%
int main()
{
    printf("Enter String\n");
    yylex();
    return 0;
}
