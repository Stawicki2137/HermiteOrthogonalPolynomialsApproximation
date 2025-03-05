function [delta] = blad_sredniokwadratowy(f_acc, f_aprox, x_points, m)
% Autor: Mateusz Stawicki, 333274
%
% Funkcja pomocnicza do numtest1. Oblicza błąd średniokwadratowy
% wyznaczonych przybliżeń.
%
% WEJŚCIE:
%   f_acc     - wektor wartości dokładnych funkcji
%   f_aprox   - wektor wartości aproksymacji
%   x_points  - wektor punktów, w których wartości są obliczane
%   m         - liczba punktów
% WYJŚCIE:
%   delta     - błąd średniokwadratowy 

w = exp(-x_points.^2); % Funkcja wagowa

delta = 0; % inicjalizacja sumy
for i = 1:m % Obliczanie sumy błędów ważonych
    delta = delta + w(i) * (f_acc(i) - f_aprox(i))^2;
end
delta = sqrt(delta / m);

end % function
