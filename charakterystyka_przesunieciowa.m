%% Obliczanie charakterystyki dla chwytaka
% Wykreślanie charakterystyki przesunięciowej dla chwytaka
% AGH, IMIR, APiR, Roboty Przemysłowe
%
% Data utworzenia: 14.04.2024
% Data aktualizacji: 28.04.2024
% Autor: Jakub Niewiarowski, Łukasz Meler

%% Sys
close all
clear
clc

%% Dane

l1 = 100;
l2 = 124;
l3 = 50;

% x = 0:0.01:180;
x = 171:0.01:180;

%% Oś Ox

a = l1.^2 + l2.^2;
b = (l2/l3) * (x.^2 - l1.^2 - l2.^2 - l3.^2);
c = ((x.^2 - l1.^2 - l2.^2 - l3.^2) / (2*l3)) - l1.^2;

% y_positive = (l2 * (-b + sqrt(b.^2 - 4*a*c))) / (2*a);
% make_plot(x, y_positive, 'x', 'y', 'Charakterystyka przesunięciowa dla osi Ox', '+∆')

y_negative = (l2 * (-b - sqrt(b.^2 - 4*a*c))) / (2*a); % poprawne roziązanie
make_plot(x - x(1), y_negative, 'Wysuw siłownika pneumatycznego [mm]', 'Przemieszczenie chwytaka w poziomie [mm]', 'Charakterystyka przesunięciowa dla osi Ox', '-∆')

y_negative_diff = (l2.*(-(2.*l2.^2.*x.*(x.^2-l3.^2-l2.^2-l1.^2))/(l3.^2.*sqrt((l2.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l1.^2)))+(2.*(l2.^2+l1.^2).*x)/(l3.*sqrt((l2.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l1.^2)))-(2.*l2.*x)/(l3)))/(2.*(l2.^2+l1.^2));
make_plot(x - x(1), y_negative_diff, 'Wysuw siłownika pneumatycznego [mm]', 'Prędkość chwytaka w poziomie', 'Charakterystyka prędkościowa dla osi Ox', '-∆')

%% Oś Oy

a = l1.^2 + l2.^2;
b = (l1/l3) * (x.^2 - l1.^2 - l2.^2 - l3.^2);
c = ((x.^2 - l1.^2 - l2.^2 - l3.^2) / (2*l3)) - l2.^2;

y_positive = (l2 * (-b + sqrt(b.^2 - 4*a*c))) / (2*a); % poprawne roziązanie
make_plot(x - x(1), y_positive, 'Wysuw siłownika pneumatycznego [mm]', 'Przemieszczenie chwytaka w pionie [mm]', 'Charakterystyka przesunięciowa dla osi Oy', '+∆')

% y_negative = (l2 * (-b - sqrt(b.^2 - 4*a*c))) / (2*a);
% make_plot(x, y_negative, 'x', 'y', 'Charakterystyka przesunięciowa dla osi Oy', '-∆')

y_positive_diff = (l2.*(-(2.*l1.^2.*x.*(x.^2-l3.^2-l2.^2-l1.^2))/(l3.^2.*sqrt((l1.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l2.^2)))+(2.*(l2.^2+l1.^2).*x)/(l3.*sqrt((l1.^2.*((x.^2-l3.^2-l2.^2-l1.^2)).^2)/(l3.^2)-4.*(l2.^2+l1.^2).*((x.^2-l3.^2-l2.^2-l1.^2)/(2.*l3)-l2.^2)))-(2.*l1.*x)/(l3)))/(2.*(l2.^2+l1.^2));
make_plot(x - x(1), y_positive_diff, 'Wysuw siłownika pneumatycznego [mm]', 'Prędkość chwytaka w pionie', 'Charakterystyka prędkościowa dla osi Oy', '+∆')

%% Charakterystyka siłowa

%% Dane
Fch = 90;
l1 = 100;
l2 = 124;
l3 = 50;
l4 = 50;
f4 = 62;
f2 = 50;
 t = 180:1:189;
 tabela = zeros(10,1);
for i= 1:10
x = 180+i;
%% Oś Ox

a = l1.^2 + l2.^2
b = -(l2/l3) * (x.^2 - l1.^2 - l2.^2 - l3.^2)
c = ((x.^2 - l1.^2 - l2.^2 - l3.^2) / (2*l3)).^2 - l1.^2
% cosa
cos_positive =  (-b + sqrt(b.^2 - 4*a*c)) / (2*a)
sin_positive = sqrt(1-((-b + sqrt(b.^2 - 4*a*c)) / (2*a)).^2)

XO = cos_positive * l2;

%plot(x, sin_positive)


syms     R2n R2t R3n R3t; % Deklaracja zmiennych symbolicznych
sinn = sin_positive;
coss = cos_positive;
%%sin = sqrt(1-cos^2)
% Wprowadzenie równań dla członów 2 i 3 i obliczenie R2n i R2t
eq1 = R2n + 0 - coss * R3n + sinn* R3t == 0;
eq2 = 0 + -R2t + -sinn*R3n + -coss*R3t == -Fch;
eq3 = 0 - l4*R2t - 0 + -l2*R3t == Fch*l4;
eq4 = 0 + -2*l4*R2t +coss*sinn*l2*R3n + sinn*sinn*l2*R3t == 0;

% Rozwiązanie układu równań
sol = solve([eq1, eq2, eq3, eq4], [R2n, R2t, R3n, R3t]);

% Wyświetlenie rozwiązania

R2n = sol.R2n

R2t = sol.R2t
R3n = sol.R3n
R3t = sol.R3t

syms Ron Rot R5n R5t; % Deklaracja zmiennych symbolicznych

% Wprowadzenie równań dla czlonów 1 5 i obliczenie Rot i Ron
eq11 = Ron*sinn + Rot*coss - coss * R5n + sinn* R5t == R2n;
eq22 = coss*Ron + sinn*Rot - sinn*R5n  -coss*R5t== R2t;
eq33 = 0+Rot*l1+0-R5t*l2 == 0;
eq44 = l2*Ron +l1*Rot+0+0 == l2*sinn*R2n+l2*coss*R2t;

% Rozwiązanie układu równań
sol1 = solve([eq11, eq22, eq33, eq44], [Ron, Rot, R5n, R5t]);

% Wyświetlenie rozwiązania

Ron = sol1.Ron
Rot = sol1.Rot
R5n = sol1.R5n
R5t = sol1.R5t
% obliczneie wypadkochy siy Rot i Ron w kierunku Fs
cosx = (-l1*sin_positive+l2*cos_positive+l3)/x
alfa = acos(cos_positive)
ax = acos(cosx)
% stosunek sił Fch do Fs

FsFch = Fch/(Rot/cos(ax-alfa)+Ron/sin(ax-alfa));

    tabela(i) = FsFch; % Druga kolumna - obliczone wyniki;
end

make_plot(t - t(1), tabela, 'Wysuw siłownika pneumatycznego [mm]', 'Stosunek Fs do Fch', 'Charakterystyka siłowa')
