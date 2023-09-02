#include <iostream>

using namespace std;
int n = 0;

bool EP(string s, int idx){
    if(idx == n){
        return true;
    }
    if(s[idx] == '+'){
        idx++;
        if(idx <= n-1 && s[idx] == 'i'){
            return EP(s,idx+1);
        }else if(s[idx] != 'i') return false;
        else if(idx == n) return true;
        
    }else{
        return false;
    }
    return true;
    
}

bool E(string s, int idx){
    if(s[idx] == 'i'){
        return EP(s,idx+1);
    }
    return false;
}

int main()
{
    
    cout<<"Enter a string" << endl;
    string input;
    std::cin >> input;
    
    n = input.length();
    
    cout << (E(input,0) ? "String is valid" : "String is not valid") << endl;

    return 0;
}
