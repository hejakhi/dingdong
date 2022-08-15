Problem --1

#include<bits/stdc++.h>
using namespace std;

int total_BW = 30*1000000;
int controll_BW = 1*1000000;
int f_per_channel = 25*1000*2;

int total_channel = (total_BW / f_per_channel);
int total_controll = (controll_BW / f_per_channel);
int total_voice = (total_channel-total_controll);

void channel_distribution(double N){
    cout<<"For "<<N<<" cell reuse:"<<endl;
    cout<<"Total number of channel per cell is : "<<round(total_channel/N)<<endl;
    double voice_per_cell = total_voice / N;
    double controll_per_cell = total_controll / N;
    cout<<"Total Voice channel per cell is : "<<round(voice_per_cell)<<endl;
    cout<<"Total control channel per cell is : "<<round(controll_per_cell)<<endl<<endl;
}

main()
{
    channel_distribution(4);
    channel_distribution(7);
    channel_distribution(12);
}



Problem ----2


#include<bits/stdc++.h>

using namespace std;

void cluster_size(double n, double SNRgiven, double N)
{
    double I = 6;

    double Q = sqrt(3*N);
    double SNRdb = 10*log10((pow(Q,n))/I);
    cout<<"For n = "<<n<<endl;
    if(SNRgiven <= SNRdb)
    {
        cout<<"N = "<<N<<" can be used. "<<endl;
        cout<<"Output SNRdb for N = "<<N<<" is : "<<SNRdb<<endl;
    }
    else{
        cout<<"N = "<<N<<" can not be used. "<<endl;
    }
    cout<<endl;
}

main()
{
    //cluster_size(4, 15, 3);
    cluster_size(4, 15, 7);
    cluster_size(3, 15, 7);
    cluster_size(3, 15, 12);
}



Problem ----3



#include<bits/stdc++.h>
using namespace std;
double A(int tc){
    if(tc==1){
        return .005;
    }
    else if(tc==5){
        return 1.13;
    }
    else if(tc==10){
        return 3.96;
    }
    else if (tc==20){
        return 11.1;
    }
    else if(tc==100){
        return 80.9;
    }
}
main(){
    double Au = 0.1;
    double GOS = (.5/100);
    double C[]={1, 5, 10, 20, 100};
    for(auto it: C){
        cout<<"Total supported users for available channel C = "<<it<<" is : ";
        double U = A(it)/Au;
        cout<<U<<" \nby taking ceiling value : "<<ceil(U)<<endl;
        cout<<endl;
    }
}




Problem ----4



#include<bits/stdc++.h>
using namespace std;
double Au = (2.0*3.0)/60.0;
double GOS = (2/100);
double C[]={19, 57, 100};
double cells[]={394, 98, 49};
double A(int tc){
    if(tc==19){
        return 12.0;
    }
    else if(tc==57){
        return 45.0;
    }
    else if(tc==100){
        return 88.0;
    }
}
double total=0;
void calculate(int i){
    double U = A(C[i])/Au;
    cout<<U<<" \nby taking ceiling value : "<<ceil(U)<<endl;
    cout<<"It can support total "<<U*cells[i]<<" users"<<endl;
    cout<<"Which is "<<(U*cells[i]/2e6)*100<<"% of the total population."<<endl;
    cout<<endl;
    total+=((U*cells[i]/2e6)*100);
}
main(){
    cout<<"Total supported users for system A per cell is : ";
    calculate(0);
    cout<<"Total supported users for system B per cell is : ";
    calculate(1);
    cout<<"Total supported users for system C per cell is : ";
    calculate(2);

    cout<<"Total percentage market penetration of cellular provider is : "<<total<<endl;
}



Problem ---5.



#include<bits/stdc++.h>
#define pi 3.1416
using namespace std;

main()
{
    double c = 3e8;
    double f = 900e6;
    double D=1;

    double lemda = c/f;

    double df = 2*(pow(D,2))/lemda;
    double pl = -10*log10((pow(lemda, 2.0))/((pow((4*pi),2.0)*(pow(df, 2.0)))));

    cout<<"Path loss pl(dB) = "<<pl<<endl;

}



Problem ----6


#include<bits/stdc++.h>

using namespace std;

main()
{
    double cf = 900000000;
    double lemda = (300000000/cf);

    double v_speed = 70*(1000.0/(60*60));
    cout<<"Vehicle speed = "<<v_speed<<endl;

    cout<<"(A). When the vehicle is moving directly away from the transmitter, "<<endl;
    double recived_f = (cf+(v_speed/lemda));
    cout<<"The received frequency is : "<<setprecision(2)<<recived_f<<endl;
    cout<<endl;

    cout<<"(B). When the vehicle is moving directly toward from the transmitter, "<<endl;
    recived_f = (cf-(v_speed/lemda));
    cout<<"The received frequency is : "<<recived_f<<endl;
    cout<<endl;

    cout<<"(C). When the vehicle is moving perpendicular to the angle of arrival of the transmitted signal, "<<endl;
    recived_f = (cf);
    cout<<"The received frequency is : "<<recived_f<<endl;
}




Problem----7


#include<bits/stdc++.h>

using namespace std;


main()
{
    double Tn = 150, N = 70;
    double delT = Tn/N;
    cout<<"(a). delT = "<<delT<<endl;

    cout<<"(b)."<<endl;
    Tn=4;
    double MBW = 2/delT;
    cout<<"The maximum bandwidth that SMRCIM model can accurately represent = "<<MBW<<endl;
    delT = (Tn/N);
    cout<<"delT for SMRCIM urban microcell model is = "<<delT<<endl;

    double RFBW = (2/delT);
    cout<<"RFBW for SMRCIM urban microcell model is = "<<RFBW<<endl;

    cout<<"(c)."<<endl;
    double Exdel = 500;
    delT = Exdel/(N*1000);
    cout<<"For indoor channel delT = "<<delT<<endl;
    RFBW = (2/delT);
    cout<<"The maximum RF bandwidth for the indoor channel model is = "<<RFBW<<endl;
}




Problem -----8

#include<bits/stdc++.h>

using namespace std;

main()
{
    double Am_power = 400;
    double modulation_depth = 0.75;
    double Carrier_power = (Am_power)/(1+(pow(modulation_depth, 2))/2);

    cout<<"(a). Total power in the carrier= "<<(Carrier_power/Am_power)*100<<endl;

    double sideband_power = (Am_power - Carrier_power)*0.5;
    cout<<"(b). power in each side band = "<<sideband_power<<endl;

    cout<<"(c). Percentage of saved power = "<<(1-(sideband_power)/Am_power)*100<<endl;
}




Problem ----9

#include<bits/stdc++.h>

using namespace std;

main()
{
    double mx_value = 8;
    double slot_bit = 156.25;
    double Num_slot = 8;
    cout<<"(a).";
    double peak_deviation = 8*10;
    cout<<"Peak frequency deviation = "<<peak_deviation<<endl;

    cout<<"(b).";
    double FM_index = (peak_deviation)/4;
    cout<<"Frequency modulation index = "<<FM_index<<endl;

    cout<<"(c).";
    double PM_index = (10*8);
    cout<<"Phase modulation index = "<<PM_index<<endl;

}
