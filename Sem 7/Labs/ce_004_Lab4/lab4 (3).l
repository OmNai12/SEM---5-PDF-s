%option noyywrap
%s A B
%{
    #include<stdio.h>
    int countx=0,county=0;
%}
%%
<INITIAL>a BEGIN A; {countx++;}
<INITIAL>b BEGIN A; {countx++;}
<INITIAL>c BEGIN B; {}
<INITIAL>\n BEGIN INITIAL; {
    if(countx==county){
        printf("Accepted\n");
        return 0;
    }
    else{
        printf("Not Accepted\n");
        return 0;
    }
}
<INITIAL>[^abc\n] BEGIN INITIAL; {
    printf("Not Accepted\n");
    return 0;
}

<A>a BEGIN A;{countx++;}
<A>b BEGIN A;{countx++;}
<A>c BEGIN B;{}
<A>\n BEGIN INITIAL; {
    if(countx==county){
        printf("Accepted\n");
        return 0;
    }
    else{
        printf("Not Accepted\n");
        return 0;
    }
}
<A>[^abc\n] BEGIN INITIAL; {
    printf("Not Accepted\n");
    return 0;
}

<B>a BEGIN B;{county++;}
<B>b BEGIN B;{county++;}
<B>\n BEGIN INITIAL; {
    if(countx==county){
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
