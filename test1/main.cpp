#include <iostream>

using namespace std;

int main()
/*
{
    int given[8] = {1, 2, 3, 5, 7, 8, 9, 9};
    int n = 10;

    int i=0;
    int j=0;
    for (i=0;i <8;i++){
        for(j=i+1;j<8;j++){
            if((given[i] + given[j]) == n){
               cout<<"["<<given[i]<<","<<given[j]<<"]"<<",";
            }
        }
    }
    return 0;
}
*/
{
    cout<<"����������ĳ��ȣ�";
    int n;
    cin>>n;
    int a[n];
    int i=0;
    cout<<"��һ�����������и�ֵ��";
    for(i=0;i<n;i++){
        int m;
        cin>>m;
        a[i]=m;
    }
    cout<<"���������Եĺ�";
    int sum;
    cin>>sum;
    int p=0;
    int q=0;
    for(p=0;p<n;p++){
        for(q=p;q<n;q++){
            if((a[p]+a[q])==sum){
               cout<<"["<<a[p]<<","<<a[q]<<"]"<<",";
            }
        }
    }
    //����Ϊɸѡ��ֵ�Եĺ�����aΪ���飬nΪ�����С��sum��ʾ��Ҫ��������Եĺ�
    /*int calcu(int *a,int n, int sum){
        int i=0;
        int j=0;
        for (i=0;i <n;i++){
            for(j=i+1;j<n;j++){
                if((given[i] + given[j]) == sum){
                    cout<<"["<<given[i]<<","<<given[j]<<"]"<<",";
                }
            }
        }
        return 0;
    };

    return 0;*/
}
