function [ p,a ] = CRC( m,q,d )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% ���� ������� ��������� deg(q(x))=r
xr=0;
for i=length(q):-1:1
    if q(1,i)==1
        if i>xr
        xr=i-1;
        else
       break;
        end
    end
end
%% 
%% ������� � ����������� ��� � , ��� �������
q1=zeros(1,d);
for i=1:1:d
    if i>length(q)
        q1(1,i)=0;
    else
 q1(1,i)=mod(q(1,i)+q1(1,i),2);

    end
end

%% m(x)*x^r
a=zeros(1,d);
for i=1:1:length(m)
    if m(1,i)==1
        a(1,i+xr)=1;
    end
end
p=a;



n=d;%��� ����������� ���� ������� ��� ����������
sdvig=d;%��� ��� ��� � ��������
 for i=d:-1:1
       
       if sdvig~=0%���� ������� m(x)*x^r � ������� ���������� �� ����� �����, �� ��� �� ������� ����
           
        if a(1,i)==1%��������� ������ ������ 
            deg_a=i;%������� �������
                     while q1(1,n)~=1
                         n=n-1;
                     end
               deg_q=n;%��������� ������� � ������������
               sdvig=deg_a-deg_q;%������� ����� �� ��� ��� �� �������� �� ��� ������� ����� �������� ��������� ����� ����� ������� � ��������
               if sdvig>=0
               b=zeros(1,d);%������������� �������
               
        for j=1:1:length(q1)
            if q1(1,j)==1
                b(1,j+sdvig)=1;%��� ��� �� ��� ���������� ����� ������� ��������� �� ������� ��������, � ��� ����� ����� �������� ��������
            
            end
        end  
          a=mod(a+b,2);%��� ������� �������� �� ��� ����� ��������� � ��� ��� ����� ������ �� �����������
               end
        end
       %����� ��� ������� ��������� � ��� ������� �� � ����� ����� ��
       else
           break;
       end
 end
  
a1=mod(p+a,2);
end



