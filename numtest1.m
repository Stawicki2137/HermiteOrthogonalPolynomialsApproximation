function numtest1()
% Projekt 1, zadanie 56
% Mateusz Stawicki 333274
%
% Funkcja testująca własności numeryczne zaimplementowanej metody.

fprintf(['----------------------------------NUMTEST1---------------' ...
    '------------------\n']);
fprintf("Funkcja testowa numtest1 tablicuje funkcję aproksymowaną" + ...
    ", przybliżenie oraz \n" + ...
    "błąd w m punktach przedziału [-a , a] dla funkcji, których d" + ...
    "okładne \n" + ...
    "wartości łatwo wyznaczyć. Obliczany błąd jest błędem względn" + ...
    "ym.\n" + ...
    "Współczynniki aproksymacji są wyznaczane w bazie wielomianów \n" + ...
    "ortonormalnych Hermite'a stopnia podanego w specyfikacji dan" + ...
    "ej części \n" + ...
    "testu za pomocą N. Test numeryczny bada jak dokładna metoda " + ...
    "jest dla\n" + ...
    "obserwowanych przedziałów oraz wartości N. Podczas testów p" + ...
    "ewne części\n" + ...
    "kodu takie jak funkcje w tablicach, wyświetlanie tabeli były\n" + ...
    "wykomentowywane dla łatwiejszej analizy testów. Zmieniane ró" + ...
    "wnież były\n" + ...
    "paramtetry a N oraz m w celu obserwacji i wyciągania wniosków.\n")
fprintf("Schemat odczytywania testów:\n" + ...
    "------------------------wzór funkcji aproksymowanej------------" + ...
    "------------\n" + ...
    "Informacja o wartości parametrów a, m oraz N.\n" + ...
    "Wyświetla się tablica z kolumnami kolejno: argumenty, dokład" + ...
    "na wartość,\n" + ...
    "przybliżenie, błąd względny a pod tablicą znajduje się inform" + ...
    "acja o błędzie\n" + ...
    "średniokwadratowym.\n" + ...
    "\n")
fprintf("-----------------------------------------------------------" + ...
    "---------------\n")
fprintf("[Press any key] "); pause(); fprintf("\n");
ftotest = {
    @(x) x.^2,        ['-----------------------------------x^2------' ...
    '------------------------------'],1, 10;
    @(x) x.^9,        ['-----------------------------------x^9------' ...
    '------------------------------'],5, 10;
    @(x) x.^5 - 2*x.^4 - 9*x.^3 + 8*x.^2 + 24*x,['----------------' ...
    '----x^5 - 2*x^4 - 9*x^3 + 8*x^2 + 24*x--------------------'], 50, 10;
    @(x) cos(x),      ['----------------------------------cos(x)--' ...
    '--------------------------------'], pi/2,  10;
    @(x) exp(-x.^2),  ['--------------------------------exp(-x^2)-' ...
    '--------------------------------'], 2,   10;
    @(x) abs(x),      ['----------------------------------abs(x)--' ...
    '--------------------------------'], 10,  10;
    @(x) tan(x),      ['----------------------------------tan(x)-' ...
    '---------------------------------'], pi/3,  10;
    };

for k = 1:size(ftotest,1)
    f = ftotest{k,1};
    a = ftotest{k,3};
    m = ftotest{k,4};
    x_points = linspace(-a,a,m);
    f_acc = f(x_points);
    for N = 0:15
        alphas = P1Z56_MST_HermitApprox(f,N);
        f_aprox = zeros(1,m);
        for j = 1:m
            for i = 1:N + 1
                f_aprox(j)=f_aprox(j) + alphas(i) * ...
                hermitnorm(i-1,x_points(j));
            end
        end
        error = abs((f_acc - f_aprox)./f_acc);
        fprintf('%s\n', ftotest{k,2});
        fprintf("Parametry testu: a = %d, m = %d, N = %d\n", a, m, N);
        fprintf("----------------------------------------------" + ...
            "-----------------------------\n");
        fprintf("   Argumenty   |  Dokładna wartość  |   Przyb" + ...
            "liżenie   |       Błąd       \n");
        fprintf("----------------------------------------------" + ...
            "-----------------------------\n");

        for j = 1:m
            fprintf("%14.3f | %18.5f | %16.5f | %16.8e\n", ...
                x_points(j), f_acc(j), f_aprox(j), error(j));
        end

        fprintf("--------------------------------------" + ...
            "-------------------------------------\n");
        fprintf("Błąd średniokwadratowy: %e\n", ...
            blad_sredniokwadratowy(f_acc,f_aprox,x_points,m));
        fprintf("\n");
        fprintf("[Press any key] ");pause(); fprintf("\n");
    end
end

end % function




