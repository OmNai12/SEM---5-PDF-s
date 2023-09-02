#include <iostream>
#include <bits/stdc++.h>

using namespace std;

unordered_map<char,string> rules;
unordered_map<char,set<char>> first;

/// check if current first gives epsilon
bool containsEpsilon(set<char> s){
    if(s.find('^') != s.end()){
        return true;
    }
    return false;
}

/// getting first 

void getFirst(string curr,char nonTerminal,int i, int n){
    if(i == n) return;
    stringstream ss(curr);
    string temp;
    int flag = 0;
    while(getline(ss,temp,'|')){
        int idx = 0;
        if(temp[idx] >= 65 && temp[idx] <= 90){
            getFirst(rules[temp[idx]],nonTerminal,0,rules[temp[idx]].length());
            while(containsEpsilon(first[nonTerminal])){
                first[nonTerminal].erase('^');
                flag = 1;
                idx += 2;
                if(temp[idx] >= 65 && temp[idx] <= 90){
                    getFirst(rules[temp[idx]],nonTerminal,0,rules[temp[idx]].length());
                }else{
                    first[nonTerminal].insert(temp[idx]);
                }
               
            }
        }else{
            if(temp[idx] == ' '){
                first[nonTerminal].insert(temp[idx+1]);
            }else{
                first[nonTerminal].insert(temp[idx]);
            }
            
        }
    }
    if(flag){
        first[nonTerminal].insert('^');
    }
    
}

//// for epsilon put ^ 


int main()
{
    int n;

    std::cout << "Enter number of Non Terminals " << std::endl;
    std::cin >> n;
    n++;
    
    while(n--){
        string s;
        getline(cin,s);
        if(s != ""){
            rules[s[0]] = s.substr((s.find('>')+2));
        }
        
    }
    
    for(auto i : rules){
        getFirst(i.second,i.first,0,i.second.length());
    }
    
    cout << "First set is as follows" << endl;
    for(auto i : first){
        cout << i.first << " -> { ";
        for(auto c : i.second){
            cout << c << " ";
        }
        std::cout << " }" << std::endl;
    }
    

    return 0;
}



