/* Prince Vanani 
RollNo: CE176 */
%option noyywrap
%{
#include<stdio.h>
#include <string.h>
int a,b,i=0;
int value(char r)
{
    if (r == 'I')
        return 1;
    if (r == 'V')
        return 5;
    if (r == 'X')
        return 10;
    if (r == 'L')
        return 50;
    if (r == 'C')
        return 100;
    if (r == 'D')
        return 500;
    if (r == 'M')
        return 1000;
    return -1;
}
int romanToDecimal(char str[])
{
    int res = 0;
    for (int i = 0; i < strlen(str); i++)
    {
        int s1 = value(str[i]);
        if (i + 1 < strlen(str))
        {
            int s2 = value(str[i + 1]);
            if (s1 >= s2)
            {
                res = res + s1;
            }
            else
            {
                res = res + s2 - s1;
                i++;
            }
        }
        else {
            res = res + s1;
        }
    }
    return res;
}
%}
%%
[IVXLCDM]+ {
    if(i==0)
    {
        a=romanToDecimal(yytext);
    }
    else
    {
        b=romanToDecimal(yytext);
        printf("%d\n",a+b);
    }
}
" " {
   i=1;
}
\n {
    i=0;
}
%%
int main(void) {
yylex();
printf("Program ends\n");
return 0;
}
