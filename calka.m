function S = calka(f)
% Projekt 1, zadanie 56 
% Mateusz Stawicki, 333274
%
% Funkcja pomocnicza obliczająca wartość całki za pomocą kwadratury 
% Gaussa - Hermite'a z funkcji podcałkowej f.
% WEJŚCIE
%   f   - uchwyt do funkcji podcałkowej
% WYJŚCIE
%   S   - wartość całki

% współczynniki kwadratury Gaussa - Hermite'a
A = [
    7.6404328552326206292e-06;
    1.3436457467812326922e-03;
    3.3874394455481063136e-02;
    2.4013861108231468642e-01;
    6.1086263373532579878e-01;
    6.1086263373532579878e-01;
    2.4013861108231468642e-01;
    3.3874394455481063136e-02;
    1.3436457467812326922e-03;
    7.6404328552326206292e-06;
    ];
% węzły kwadratury Gaussa - Hermite'a
x = [
    -3.4361591188377376033e+00;
    -2.5327316742327897964e+00;
    -1.7566836492998817735e+00;
    -1.0366108297895136542e+00;
    -3.4290132722370460879e-01;
    3.4290132722370460879e-01;
    1.0366108297895136542e+00;
    1.7566836492998817735e+00;
    2.5327316742327897964e+00;
    3.4361591188377376033e+00;
    ];
n = 10; % liczba węzłów kwadratury

S = 0; % inicjalizacja wartości całki
for k = 1:n % całkowanie numeryczne
    S = S + A(k) * f(x(k)); 
end 

end % function