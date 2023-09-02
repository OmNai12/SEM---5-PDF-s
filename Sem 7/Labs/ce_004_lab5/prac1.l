/* Prince Vanani 
RollNo: CE176 */
%option noyywrap
%{
#include<stdio.h>
#include <stdlib.h>
int MAXSIZE = 100;       
char stack[100];     
int top = -1; 
int temp=1;
int isempty() {

   if(top == -1)
      return 1;
   else
      return 0;
}
   
int isfull() {

   if(top == MAXSIZE)
      return 1;
   else
      return 0;
}

char peek() {
   return stack[top];
}

char pop() {
   char data;
	
   if(!isempty()) {
      data = stack[top];
      top = top - 1;   
      return data;
   } else {
      printf("Could not retrieve data, Stack is empty.\n");
      printf("Rejected\n");
      exit(0);
   }
}

int push(char data) {

   if(!isfull()) {
      top = top + 1;   
      stack[top] = data;
   } else {
      printf("Could not insert data, Stack is full.\n");
      printf("Rejected\n");
      exit(0);
   }
}      
%}
%%
a+b+ {
    memset(stack, 0, MAXSIZE); 
    for(int i=0;i<strlen(yytext);i++)
    {
        if(yytext[i]=='a')
        {
            push(yytext[i]);
            if(yytext[i+1]=='a')
            {
                i+=1;
            }
            else if(yytext[i+1]=='b')
            {
                temp=0;
            }
        }
        else if(yytext[i]=='b')
        {
            pop();
        }
    }
    if(isempty() && temp)
    {
        printf("Accepted\n");
        exit(0);
    }
    else
    {
        printf("Rejected\n");
        exit(0);
    }
}
%%
int main(void) {
yylex();
printf("Program ends\n");
return 0;
}