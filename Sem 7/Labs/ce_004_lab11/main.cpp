
#include <iostream>
#include<bits/stdc++.h>

using namespace std;


int prec(char c)
{
    if (c == '^')
        return 3;
    else if (c == '/' || c == '*')
        return 2;
    else if (c == '+' || c == '-')
        return 1;
    else
        return -1;
}
string infixToPostfix(string s)
{
 
    stack<char> st; // For stack operations, we are using
                    // C++ built in stack
    string result;
 
    for (int i = 0; i < s.length(); i++) {
        char c = s[i];
 
        // If the scanned character is
        // an operand, add it to output string.
        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
            || (c >= '0' && c <= '9'))
            result += c;
 
        // If the scanned character is an
        // ‘(‘, push it to the stack.
        else if (c == '(')
            st.push('(');
 
        // If the scanned character is an ‘)’,
        // pop and to output string from the stack
        // until an ‘(‘ is encountered.
        else if (c == ')') {
            while (st.top() != '(') {
                result += st.top();
                st.pop();
            }
            st.pop();
        }
 
        // If an operator is scanned
        else {
            while (!st.empty()
                   && prec(s[i]) <= prec(st.top())) {
                result += st.top();
                st.pop();
            }
            st.push(c);
        }
    }
 
    // Pop all the remaining elements from the stack
    while (!st.empty()) {
        result += st.top();
        st.pop();
    }
 
    return result;
}

void generateIntermediateCode(string expr,vector<vector<char>>& res){
    //convert to postfix
    expr=infixToPostfix(expr);
    
    stack<char> st;
    char r='1';
    
    for(int i=0;i<expr.size();i++){
        // || (expr[i]>='0' && expr[i]<='9')
        if( (expr[i]>='a' && expr[i]<='z')  ){
            st.push(expr[i]);
        }else{
            char op1,op2;
            op1=st.top();
            st.pop();
            op2=st.top();
            st.pop();
            
            vector<char> temp;
            temp.push_back(expr[i]);
            temp.push_back(op1);
            temp.push_back(op2);
            temp.push_back(r);
            r++;
            res.push_back(temp);
            
            st.push(r-1);
        }
    }
    
    
}

int main()
{
    string expr;
    cin>>expr;
    
    std::vector<vector<char>> result;
    
    generateIntermediateCode(expr,result);
    
    //Printing result
    cout<<"operator  Operand1  Operand2  Result"<<endl;
    for(auto it:result){
        for(auto i:it){
            cout<<i<<"         ";
        }
        cout<<endl;
    }
    
    return 0;
}




