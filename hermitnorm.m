function [H] = hermitnorm(N,x)
% Projekt 1, zadanie 56 
% Mateusz Stawicki 333274
%
% Funkcja pomocnicza realizująca obliczanie wartości ortonormalnego 
% wielomianu Hermite'a stopnia N w punkcie x.
% WEJŚCIE
%   N   - stopień wielomianu Hermite'a
%   x   - punkt w którym obliczana jest wartość wielomianu Hermite'a
% WYJŚCIE
%   H   - wartość wielomianu Hermite'a stopnia N w punkcie x

H_0 = 1; % Warunek początkowy rekurencji
if N == 0
    H = H_0;
    H = H / sqrt(sqrt(pi)); % Normalizacja wielomianu
    return;
end
H_1 = 2 * x; % Warunek początkowy rekurencji
if N == 1
    H = H_1;
    H = H / sqrt(sqrt(pi) * 2^N * factorial(N)); % Normalizacja wielomianu
end
if N >= 2
    for k = 2:N % Rekurencyjne wyznaczanie wielomianów kolejnych stopni
        H = 2 * x * H_1 - 2 * (k-1) * H_0; 
        H_0 = H_1;
        H_1 = H;
    end
    H = H / sqrt(sqrt(pi) * 2^N * factorial(N)); % Normalizacja wielomianu
end

end % function