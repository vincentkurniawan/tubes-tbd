#include <bits/stdc++.h>
#include<string>  

using namespace std;

string randUser (int len) {
    char consonents[] = {'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'};
    char vowels[] = {'a','e','i','o','u'};
    string res = "";

    for (int i=0; i<len; i++){
        if (i%2 == 0){
            res += consonents[rand()%21];
        }
        else {
            res += vowels[rand()%5];
        }
    }
    return res;
}

string randNama (int len) {
    char consonents[] = {'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'};
    char vowels[] = {'a','e','i','o','u'};
    string res = "";

    for (int i=0; i<len; i++){
        if (i%2 == 0){
            res += consonents[rand()%21];
        }
        else {
            res += vowels[rand()%5];
        }
    }
    res += ' ';
    for (int i=0; i<len; i++){
        if (i%2 == 0){
            res += consonents[rand()%21];
        }
        else {
            res += vowels[rand()%5];
        }
    }
    return res;
}

string randKota () {
    string kota[] = 
    {
        "Kabul", "Kandahar", "Pretoria", "Cape Town", "Bangui",
        "Libreville", "Tirana", "Gramsh", "Washington D.C", "New York",
        "Canberra","Sydney","Riyadh","Mekkah","Buenos Aires",
        "Rosario","Wina","Baden","Amsterdam","Rotterdam",
        "Brussel","Eeklo","Brasilia","Sao Paolo","Seria",
        "Bandar Seri Begawan","Beijing","Shanghai","Kopenhagen","Aarhus",
        "Santo Domingo","Azua","San Salvador","Santa Ana","Alaminos",
        "Angeles","Helsinki","Espoo","Conakry","Kissidougou",
        "Budapest","Esztergom","Mumbai","New Delhi","jakarta",
        "Bandung","Bagdad","Basra","Isfahan","Ray",
        "Yerusalem","Tel Aviv","Roma","Venesia","Hverageroi",
        "Vik i Myrdal","Kingston","Port Royal","Tokyo","Osaka",
        "Berlin","Hamburg","Phnom Penh","Sihanoukville","Toronto",
        "Kota Quebec","Bogota","Medellin","Seoul","Busan",
        "Pyongyang","Nampo","San Jose","Alajuela","Vohemar",
        "Ambalavao","Kuala Lumpur","Kuching","Guadalajara","Zacatecas",
        "yangoon","Bago","Kathmandu","Patan","Benin City",
        "Lagos","Oslo","Bergen","Paris","Marseille",
        "Lisboa","Porto","Doha","Dukhan","Moskow",
        "Kazan","Rochor","Seletar","Bangkok","Pattaya"
    };

    return kota[rand() % 100];
}

string randTelp (int len){
    string res = "";
    char telp [] = {'0','1','2','3','4','5','6','7','8','9'};
    for (int i=0; i<len; i++){
        res += telp[rand()%10];
    }
    return res;
}

string randTanggal () {
    
}

int main () {
    ofstream myfile;
    myfile.open ("example.txt");
    for (int i=0; i<100; i++){
        // string user = randUser(4);
        // string pass = randUser(8);
        // string nama = user + " " + randUser(6);
        // string email = user + "@gmail.com";
        // myfile << "EXEC register '" << user << "', '" << pass << "', '" << nama << "', '" << email << "', '" << randTelp(12) << "', 'Jl. Juanda No. " << i << "', '" << randKota() << "'\n";
        //myfile << "EXEC member_transaksi_keanggotaan " << rand()%50+1 << ", " << rand()%2+2 << ", ";
        int idmember = rand()%50+1;
        int artikel =  rand()%100+1;
        int tanggal = rand()%20220610+20200101;
        myfile << "EXEC favorite_artikel " << idmember << ", " << artikel << ", '" << tanggal <<"'" << endl;  
    }
    myfile.close();
}