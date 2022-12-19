%Studentas:	Valdas Mikenas		
%Kryptis (grupė):	Dirbtinio intelekto sistemos (DISfm-22)		
%Classification using perceptron

clc; 
clear all; 
close all;


%% 1 Pradiniai duomenys - sukurimas (per matlab toolbox'o komandas)
%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');

%POZYMIAI
%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color               <--spalvos pozymis (funkcija - 1 vienos spalvos)
metric_A1=apvalumas_roundness(A1); %roundness       <--formos pozymis (funkcija)
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness     
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2

x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];

P=[x1;x2];  %pozymiu duomenu priskyrimas matricai

%POZYMIU ATSAKAS
%Desired output vector
%+1 priklauso pirmai klasei (obuoliai), -1 priklauso antrai klasei (kriauses)
d=[1;1;1;-1;-1];

%% 2. Atsistiktines pozymiu reiksmes generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1)

%Stebejimas random tieses
xx2=-w1*x1/w2-b/w2
plot(x1,xx2)



%% 3. PASVERTOS SUMOS SKAICIAVIMAS klasifikavimui
% calculate wieghted sum with randomly generated parameters
%v1 = <...>; % write your code here
v1=x1(1)*w1+x2(1)*w2 + b
v2=x1(2)*w1+x2(2)*w2 + b
v3=x1(3)*w1+x2(3)*w2 + b
v4=x1(4)*w1+x2(4)*w2 + b
v5=x1(5)*w1+x2(5)*w2 + b

%% 4. tikriname atsakus
% calculate 'y1', ..., 'y5'  jei pasverta suma >0 - 1 klase (obuoliai), <0
% - 2 klase (kriauses)

if v1 > 0
	y1 = 1;
else
	y1 = -1;
end

if v2 > 0
	y2 = 1;
else
	y2 = -1;
end

if v3 > 0
	y3 = 1;
else
	y3 = -1;
end

if v4 > 0
	y4 = 1;
else
	y4 = -1;
end

if v5 > 0
	y5 = 1;
else
	y5 = -1;
end

%% 5. Sakiciuojame klaidas
% calculate the error, jei e1 = -2  - klaida, jie 0 - y=d - atitinka zinoma klase
e1 = d(1) - y1;
e2 = d(2) - y2;
e3 = d(3) - y3;
e4 = d(4) - y4;
e5 = d(5) - y5;

%Bendras erroru modulis
    E = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5) % 2 calculate the total error for these 5 inputs - turi buti lygu 0

%% 6. %Atnaujiname rysiu svorius ir bios atnaujinimas kol prei w1, w2 ir b - klaidos visada 0
%train single perceptron with two inputs and one output

%mokymo zingsnis
n=0.1        %galima paderinti rankiniu budu

while E~=0 %atnaujiname rysiu svorius kol E bus ~=0

    w1=w1+n*e1*x1(1)
    w2=w2+n*e1*x2(1)
    b=b+n*e1

    w1=w1+n*e2*x1(2)
    w2=w2+n*e2*x2(2)
    b=b+n*e2   

    w1=w1+n*e3*x1(3)
    w2=w2+n*e3*x2(3)
    b=b+n*e3

    w1=w1+n*e4*x1(4)
    w2=w2+n*e4*x2(4)
    b=b+n*e4

    w1=w1+n*e5*x1(5)
    w2=w2+n*e5*x2(5)
    b=b+n*e5

%kartojame
v1=x1(1)*w1+x2(1)*w2 + b
v2=x1(2)*w1+x2(2)*w2 + b
v3=x1(3)*w1+x2(3)*w2 + b
v4=x1(4)*w1+x2(4)*w2 + b
v5=x1(5)*w1+x2(5)*w2 + b

%kartojame
if v1 > 0
	y1 = 1;
else
	y1 = -1;
end

if v2 > 0
	y2 = 1;
else
	y2 = -1;
end

if v3 > 0
	y3 = 1;
else
	y3 = -1;
end

if v4 > 0
	y4 = 1;
else
	y4 = -1;
end

if v5 > 0
	y5 = 1;
else
	y5 = -1;
end

%kartojame
e1 = d(1) - y1;
e2 = d(2) - y2;
e3 = d(3) - y3;
e4 = d(4) - y4;
e5 = d(5) - y5;
E = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5) 


    if E==0
    figure(1)
    plot(x1(1),x2(1),'xb',x1(2),x2(2),'xb',x1(3),x2(3),'xb', x1(4),x2(4),'ob', x1(5),x2(5),'ob')
    title('Visi pozymiai grafike suklasifikuoti per tiese (su atnaujintais svoriais):')
    xlabel('Spalvos pozymis')
    ylabel('Apvalumo (formos) pozymis')
    grid on
    hold on
    
    %Stebejimas grafiskai (po apmokymo)
    xx2=-w1*x1/w2-b/w2
    plot(x1,xx2)
    
    end
end

%% Papildoma uzduotis (nepadaryta)
%Naive Bayes classifier

P1=x1  %<--pozimis/tikimybe spalvos vektoriaus
P2=x2  %<--pozimis/tikimybe apvalumo vektoriaus

PN=3/5

ATSN1=PN*x1(1)*x1(2)       %tikrai spalva ok
ATSN2=PN*x2(1)*x2(2)       %tikrai spalva ok


PS=2/5

ATSS=PS*x2(1)*x2(2)       %tikrai apvalus