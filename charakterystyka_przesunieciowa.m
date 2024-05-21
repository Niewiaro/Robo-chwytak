%% Obliczanie charakterystyki dla chwytaka
% Wykreślanie charakterystyki przesunięciowej dla chwytaka
% AGH, IMIR, APiR, Roboty Przemysłowe
%
% Data utworzenia: 14.04.2024
% Data aktualizacji: 28.04.2024
% Autor: Jakub Niewiarowski

%% Sys
close all
clear
clc

%% Dane

l1 = 100;
l2 = 124;
l3 = 50;

% x = 0:0.01:180;
offset = 9;
x = 165.6+offset:0.01:171.8+offset;

%% Oś Ox

a = l1.^2 + l2.^2;
b = (l2/l3) * (x.^2 - l1.^2 - l2.^2 - l3.^2);
c = ((x.^2 - l1.^2 - l2.^2 - l3.^2) / (2*l3)) - l1.^2;

% y_positive = (l2 * (-b + sqrt(b.^2 - 4*a*c))) / (2*a);
% make_plot(x, y_positive, 'x', 'y', 'Charakterystyka przesunięciowa dla osi Ox', '+∆')

y_negative = (l2 * (-b - sqrt(b.^2 - 4*a*c))) / (2*a); % poprawne roziązanie
make_plot(x - x(1), y_negative, 'x', 'y', 'Charakterystyka przesunięciowa dla osi Ox', '-∆')

y_negative_diff = (l2.*(-(2.*l2.^2.*x.*(x.^2-l3.^2-l2.^2-l1.^2))/(l3.^2.*sqrt((l2.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l1.^2)))+(2.*(l2.^2+l1.^2).*x)/(l3.*sqrt((l2.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l1.^2)))-(2.*l2.*x)/(l3)))/(2.*(l2.^2+l1.^2));
make_plot(x - x(1), y_negative_diff, 'x', 'y', 'Charakterystyka prędkościowa dla osi Ox', '-∆')

%% Oś Oy

a = l1.^2 + l2.^2;
b = (l1/l3) * (x.^2 - l1.^2 - l2.^2 - l3.^2);
c = ((x.^2 - l1.^2 - l2.^2 - l3.^2) / (2*l3)) - l2.^2;

y_positive = (l2 * (-b + sqrt(b.^2 - 4*a*c))) / (2*a); % poprawne roziązanie
make_plot(x - x(1), y_positive, 'x', 'y', 'Charakterystyka przesunięciowa dla osi Oy', '+∆')

% y_negative = (l2 * (-b - sqrt(b.^2 - 4*a*c))) / (2*a);
% make_plot(x, y_negative, 'x', 'y', 'Charakterystyka przesunięciowa dla osi Oy', '-∆')

y_positive_diff = (l2.*(-(2.*l1.^2.*x.*(x.^2-l3.^2-l2.^2-l1.^2))/(l3.^2.*sqrt((l1.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l2.^2)))+(2.*(l2.^2+l1.^2).*x)/(l3.*sqrt((l1.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l2.^2)))-(2.*l1.*x)/(l3)))/(2.*(l2.^2+l1.^2));
make_plot(x - x(1), y_positive_diff, 'x', 'y', 'Charakterystyka prędkościowa dla osi Oy', '+∆')
