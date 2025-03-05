% Projekt 1, zadanie 56
% Mateusz Stawicki, 333274
%
% Funkcja testująca implementację funkcji hermitnorm

fprintf("-----------------------------------Test1-------------------" + ...
    "----------------\n");
fprintf("Funkcja testuje poprawność implementacji funkcji hermitnorm" + ...
    ", która oblicza\n");
fprintf("wartości znormalizowanych wielomianów Hermite'a. Ręcznie wy" + ...
    "znaczono\n" + ...
    "pierwsze 7 wielomianów Hermite'a, następnie obliczono wartość\n" + ...
    "znormalizowanego wielomianu danego stopnia w m punktach przedzi" + ...
    "ału [-a,a]\n" + ...
    "dokładnie oraz za pomocą funkcji testowanej, poprzez badanie \n" + ...
    "błędu bezwględnego, który w przypadku poprawnej implemntacji fu" + ...
    "nkcji\n" + ...
    "hermitnorm powinien być niedostrzegalny.\n\n");
% odpowiednie wyświetlanie
fprintf("[Press any key] "); pause(); fprintf("\n"); 
% struktura przechowująca funkcje testowane oraz odpowiednie ich wypisanie
ftotest = {
    @(x) 1, 'H_0 = 1';
    @(x) 2 * x, 'H_1 = 2 * x';
    @(x) 4 * x.^2 - 2, 'H_2 = 4 * x^2 - 2';
    @(x) 8 * x.^3 - 12 * x, 'H_3 = 8 * x^3 - 12 * x';
    @(x) 16 * x.^4 - 48 * x.^2 + 12, 'H_4 = 16 * x^4 - 48 * x^2 + 12';
    @(x) 32 * x.^5 - 160 * x.^3 + 120 * x, ['H_5 = 32 * x^5 - 160' ...
    ' * x^3 + 120 * x'];
    @(x) 64 * x.^6 - 480 * x.^4 + 720 * x.^2 - 120, ['H_6 = 64*x.^6 - ' ...
    '480*x.^4 + 720*x.^2 - 120'];
    };

% Parametry testu
a = 10; % Przedział [-a, a]
m = 10; % Liczba punktów testowych

% Generowanie punktów, w krórych porównywane będą wartości obliczane
% za pomocą funkcji hermitnorm oraz wyznaczone analitycznie
x_points = linspace(-a, a, m);

for k = 1:size(ftotest, 1) % iteracja przez zestaw funkcji testowych
    f = ftotest{k, 1}; % funkcja wykorzystana do testowania 
    wzor = ftotest{k, 2}; % wzór funkcji przygotowany do wypisania 
    fprintf("Wielomian testowany: %s\n", wzor);
    fprintf("|     analitycznie     |      hermitnorm      |   " + ...
        "błąd względny      |\n");
    fprintf("---------------------------------------------------" + ...
        "-------------------\n");
    for j = 1:m
        % obliczanie wartości funkcją hermitnorm
        f_approx = hermitnorm(k-1, x_points(j));
        % normalizowanie wielomianu wyznaczonego analitycznie
        f_acc = f(x_points(j))/ sqrt(sqrt(pi) * 2^(k-1) * factorial(k-1));
        fprintf("| %20.5f | %20.5f | %20.15f |\n",  f_acc, f_approx, ...
            ((f_acc-f_approx)/f_acc) ); % wypisanie tabeli pozwalającej
        % zbadanie poprawności implementacji funkcji hermitnorm
    end
    fprintf("----------------------------------------------------" + ...
        "------------------\n");
    fprintf("[Press any key] "); pause(); fprintf("\n");
end
