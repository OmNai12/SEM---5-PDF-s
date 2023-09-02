

#include <iostream>
#include<bits/stdc++.h>
using namespace std;

bool S(string s,int Sind,int Eind){
    if( (s[Sind]=='a' || s[Sind]=='b') && Sind==Eind ){
        // cout<<"Accepted"<<endl;
        return true;
    }
    else if( (s[Sind]=='a' && s[Eind]=='a') || (s[Sind]=='b' && s[Eind]=='b') ){
        if(S(s,Sind+1,Eind-1)){
            return true;
        }else{
            return false;
        }
        
    }else{
        return false;
    }
}

int main()
{
    string s;
    cin>>s;
    cout<< (S(s,0,s.length()-1)?"Accepted":"Not Accepted")<<endl;;
}
