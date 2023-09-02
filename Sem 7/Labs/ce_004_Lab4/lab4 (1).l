%option noyywrap
%s A 
%{
    #include<stdio.h>
    #include<stdlib.h>
    char stack[1000];
    int top=-1;
%}
%%
<INITIAL>a BEGIN INITIAL; {stack[++top]='a';}
<INITIAL>b BEGIN INITIAL; {stack[++top]='b';}
<INITIAL>c BEGIN A;
<INITIAL>\n BEGIN INITIAL; {
    printf("Middle Point c not present\n");
    return 0;
}
<INITIAL>[^abc\n] BEGIN INITIAL; {
    printf("Invalid Input\n");
    return 0;
}

<A>a BEGIN A; {
    if(top>=0 && stack[top]=='a'){
        top--;
    }
    else{
        printf("Not Palindrom\n");
        return 0;
    }
}
<A>b BEGIN A; {
    if(top>=0 && stack[top]=='b'){
        top--;
    }
    else{
        printf("Not Palindrom\n");
        return 0;
    }
}
<A>\n BEGIN INITIAL; {
    if(top==-1){
        printf("Palindrom\n");
        return 0;
    }
    else{
        printf("Not Palindrom\n");
        return 0;
    }
}
<A>[^ab\n] BEGIN INITIAL; {
    printf("Invalid Input\n");
    return 0;
}

%%
int main()
{
    printf("Enter String\n");
    yylex();
    return 0;
}
