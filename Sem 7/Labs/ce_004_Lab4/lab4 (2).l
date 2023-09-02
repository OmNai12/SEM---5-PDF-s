%option noyywrap
%{
    #include<stdio.h>
    char stack[1000],top=-1;
%}
%%
<INITIAL>\{ BEGIN INITIAL; {stack[++top] = 'a';}
<INITIAL>\[ BEGIN INITIAL; {stack[++top] = 'b';}
<INITIAL>\( BEGIN INITIAL; {stack[++top] = 'c';}

<INITIAL>\} BEGIN INITIAL; {
    if(top>=0 && stack[top]=='a'){
        top--;
    }
    else{
        printf("Not Accepted\n");
        return 0;
    }
}

<INITIAL>\] BEGIN INITIAL; {
    if(top>=0 && stack[top]=='b'){
        top--;
    }
    else{
        printf("Not Accepted\n");
        return 0;
    }
}

<INITIAL>\) BEGIN INITIAL; {
    if(top>=0 && stack[top]=='c'){
        top--;
    }
    else{
        printf("Not Accepted\n");
        return 0;
    }
}

<INITIAL>\n BEGIN INITIAL; {
    if(top==-1){
        printf("Accepted\n");
        return 0;
    }
    else{
        printf("Not Accepted\n");
        return 0;
    }
}

<INITIAL>[^\(\{\[\)\}\]\n] BEGIN INITIAL; {
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