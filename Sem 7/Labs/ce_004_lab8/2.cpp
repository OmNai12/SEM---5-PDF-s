#include<iostream>

char l;
void E(void);
void T(void);
void F(void);

using namespace std;

void match(char t)
{
    if(t==l) l = getchar();
    else  { cout<< "Error"; exit(1) ; }        
}

int main() {
    l = getchar();
    E();
    if(l == '$') cout<< "Parsing successfull";
    return 0;        
}

void E () {
    T();
    if(l == '+')
       { match('+'); E();}
    
}
void T() {
    F();
    if(l == '*')
       { match('*'); T();}
}

void F(){
    if(l == '(')
    {
        match('(');
        E();
        match(')');
    }
    else if( l =='i')
    {match('i');}
    else {cout<<"error";exit(1);}
}

