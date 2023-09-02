
#include <iostream>
#include<bits/stdc++.h>
using namespace std;

bool C(string s,int Sind,int Eind);
bool B(string s,int Sind,int Eind);

bool A(string s,int Sind,int Eind){
    if( (s[Sind]=='a' && s[Eind]=='b') ){
        return A(s,Sind+1,Eind-1);
    }else{
        return C(s,Sind,Eind);
    }
}

bool B(string s,int Sind,int Eind){
    if(s[Sind]=='d'){
        return true;
    }
    if(s[Sind]=='c'){
        return B(s,Sind+1,Eind);
    }
    return false;
}

bool C(string s,int Sind,int Eind){
    if(s[Sind]=='f'){
        return true;
    }
    if(s[Sind]=='e'){
        return C(s,Sind+1,Eind);
    }
    return false;
}


int findAind(string s,int Sind,int Eind){
    bool flagB=false,flagF=false;
    int Find=-1,Bind=0;
    for(int i=Sind;i<=Eind;i++){
        if(s[i]=='f' && !flagF ){
            Find=i;
            flagF=true;
        }
        if(s[i]=='b'){
            Bind=i;
            flagB=true;
        }
    }
    if(flagB)return Bind;
    else return Find;
}

int findBindex(string s,int Sind,int Eind){
    for(int i=Sind;i<=Eind;i++){
        if(s[i]=='d')return i;
    }
    return -1;
}

bool S(string s,int Sind,int Eind){
    int AEND=findAind(s,0,Eind);
    int BEND=findBindex(s,AEND,Eind);
    if(AEND==-1 || BEND==-1)return false;
    // cout<<"A(0,"<<AEND<<")"<<"B("<<AEND<<","<<BEND<<")C("<<BEND<<","<<Eind<<")"<<endl;
    return A(s,0,AEND) && B(s,AEND+1,BEND) && C(s,BEND+1,Eind);
}

int main()
{
    string s;
    cin>>s;
    cout<< (S(s,0,s.length()-1)?"Accepted":"Not Accepted")<<endl;;
}
