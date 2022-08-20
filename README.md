problem ----1


#include<bits/stdc++.h>
#include<conio.h>
using namespace std;


main()
{
    cout<<"Enter the equation with a single operator. "<<endl;
    char ch;
    string st="";
    double num1=0, num2=0;
    char sign=0;
    for(ch = getch(); ch != '='; ch = getch())
    {
        cout<<ch;
        if(ch == '+' or ch == '-' or ch == '*' or ch == '/' or ch == '%'){
            sign=ch;
        }
        else if(sign){
            int x = ch - '0';
            num2 = num2*10 + x;
        }
        else{
            int x = ch - '0';
            num1 = num1*10 + x;
        }
        st+=ch;
    }
    cout<<endl;
    st+=ch;
    cout<<"Num 1 = "<<num1<<endl;
    cout<<"Num 2 = "<<num2<<endl;
    switch(sign){
    case '+':
        cout<<st<<num1+num2<<endl;
        break;
    case '-':
        cout<<st<<num1-num2<<endl;
        break;
    case '*':
        cout<<st<<num1*num2<<endl;
        break;
    case '/':
        if(num2==0)
        {
            cout<<"Invalid input."<<endl;
            break;
        }
        cout<<st<<num1/num2<<endl;
        break;
    case '%':
        if(num2==0)
        {
            cout<<"Invalid input."<<endl;
            break;
        }
        cout<<st<<(int)num1%(int)num2<<endl;
        break;
    }
}



Problem ---2



#include<bits/stdc++.h>

using namespace std;
main()
{
    int n;
    cout<<"Enter the value of n : ";
    cin>>n;
    pair<double, double> nums[n];
    for(int i=0; i<n; i++)
    {
        int a, b;
        cin>>a>>b;
        nums[i]={a, b};
    }
    char sign;
    cout<<"Enter the operator : ";
    cin>>sign;

    for(int i=0; i<n; i++)
    {
        double num1 = nums[i].first, num2 = nums[i].second;
        switch(sign){
        case '+':
            cout<<num1+num2<<endl;
            break;
        case '-':
            cout<<num1-num2<<endl;
            break;
        case '*':
            cout<<num1*num2<<endl;
            break;
        case '/':
            if(num2==0)
            {
                cout<<"Invalid input."<<endl;
                break;
            }
            cout<<num1/num2<<endl;
            break;
        case '%':
            if(num2==0)
            {
                cout<<"Invalid input."<<endl;
                break;
            }
            cout<<(int)num1%(int)num2<<endl;
            break;
        }
    }

}



Problem -----3


#include<bits/stdc++.h>

using namespace std;

main()
{
    string st;
    cout<<"Enter a string :";
    cin>>st;
    bool pali = true;
    int n=st.length();
    for(int i=0; i<st.length(); i++)
    {
        if(st[i]!=st[n-i-1])
        {
            pali = false;
            break;
        }
    }
    if(pali)
    {
        cout<<"This string is a palindrome."<<endl;
    }
    else{
        cout<<"This string is not a palindrome."<<endl;
    }
}



Problem ----5


#include<bits/stdc++.h>
using namespace std;

main()
{
    long long n;
    cout<<"Enter a number to find its factorial : ";
    cin>>n;
    long long i, ans1=1, ans2=1;

    for(i=1; i<=n; i++)
    {
        ans1 *= i;
    }
    i = n;
    while(i>0)
    {
        ans2 *= i;
        i--;
    }
    if(ans1 == ans2){
        cout<<"Both the answers are same. And factorial of "<<n<<" is : "<<ans1<<endl;
    }
    else{
        cout<<"They are different."<<endl;
    }
}


Problem------6


#include<bits/stdc++.h>

using namespace std;

double summation(double arr[], int n){
    double total = 0;
    for(int i=0; i<n; i++)
    {
        total += arr[i];
    }
    return total;
}
double average(double arr[], int n){
    double total = summation(arr, n);
    return (double)(total)/(double)n;
}

main(){
    int n;
    cout<<"Enter the size of the array : ";
    cin>>n;
    double arr[n];
    cout<<"Enter the array."<<endl;
    for(int i=0; i<n; i++)
    {
        cin>>arr[i];
    }
    double sum = 0, avg;
    int i=0;
    do{
        sum+=arr[i];
        i++;
    }while(i<n);
    cout<<"Sum using do-while loop = "<<sum<<endl;
    cout<<"Average using do-while loop = "<<sum/n<<endl;
    cout<<endl;
    sum = summation(arr, n);
    avg = average(arr, n);

    cout<<"Sum using function = "<<sum<<endl;
    cout<<"Average using function = "<<sum/n<<endl;

}




Problem -----7



package file;
import java.io.*;
import java.util.Scanner;
public class file {

    public static void main(String[] args)throws IOException {

        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a String: ");
        String data = sc.nextLine();
        byte[] buf = data.getBytes();
        //Writing it to a file using the DataOutputStream
        DataOutputStream dos = new DataOutputStream(new FileOutputStream("test.txt"));
        for (byte b:buf) {
            dos.writeChar(b);
        }
        dos.flush();
        //Reading from the above created file using readChar() method
        DataInputStream dis = new DataInputStream(new FileInputStream("test.txt"));
        while(true) {
            char ch;
            try {
                ch = dis.readChar();
                System.out.print(ch);
            } catch (EOFException e) {
                System.out.println("\nEnd of file reached");
                break;
            } catch (IOException e) {}
        }

        try {
            Class cls = Class.forName("exceptionHandeling");
            System.out.println("Class is present. and the Class is = " + cls.getName());
        }
        catch(Exception e) {
            System.out.println(e);
        }



    }

}





Problem ----8




#include<bits/stdc++.h>

typedef long long int ll;

using namespace std;

main()
{
    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
    double x;
    vector<double>nums;
    while(x!=-1)
    {
        cin>>x;
        nums.push_back(x);
    }

    for(int i=0; i<nums.size()-1; i+=2)
    {
        double num1 = nums[i], num2 = nums[i+1];

        cout<<num1<<" + "<<num2<< " = "<<num1+num2<<endl;
        cout<<num1<<" - "<<num2<< " = "<<num1-num2<<endl;
        cout<<num1<<" * "<<num2<< " = "<<num1*num2<<endl;
        if(num2==0){
            cout<<"Invalid input for division and modulation operation."<<endl;
        }
        else{
            cout<<num1<<" / "<<num2<< " = "<<num1/num2<<endl;
        }
        if(num2==0){
            cout<<"Invalid input."<<endl;
        }
        else{
            cout<<num1<<" % "<<num2<< " = "<<(int)num1%(int)num2<<endl;
        }
        cout<<endl;
    }
    return 0;
}


