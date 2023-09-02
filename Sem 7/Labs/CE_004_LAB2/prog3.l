%option noyywrap
%s A B C DEAD 
%{
    #include<stdio.h>    
%}
%% 
<INITIAL>0 BEGIN A; 
<INITIAL>1 BEGIN INITIAL; 
<INITIAL>[^01\n] BEGIN DEAD; 
<INITIAL>\n BEGIN INITIAL; {printf("  Accepted\n");} 

<A>0 BEGIN B;
<A>1 BEGIN INITIAL;
<A>[^01\n] BEGIN DEAD; 
<A>\n BEGIN INITIAL; {printf("  Not Accepted\n");}

<B>1 BEGIN B;
<B>0 BEGIN B;
<B>[^01\n] BEGIN DEAD; 
<B>\n BEGIN INITIAL; {printf("Not Accepted\n");}


<C>1 BEGIN INITIAL;
<C>0 BEGIN A;
<C>[^01\n] BEGIN DEAD; 
<C>\n BEGIN INITIAL; {printf("Accepted\n");}

<DEAD>[^\n] BEGIN DEAD; 
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");}    
%%   
int main()  { 
    printf("Enter String\n"); 
    yylex(); 
    return 0; 
 }
