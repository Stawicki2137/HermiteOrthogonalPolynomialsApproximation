function test2()
% Projekt 1, zadanie 56
% Mateusz Stawicki, 333274
%
% Funkcja testująca poprawność implementacji funkcji calka

fprintf(['-----------------------------------TEST2------------------' ...
    '-----------------\n']);
fprintf("Funkcja testuje poprawność obliczeń funkcji calka, która r" + ...
    "ealizuje\n" + ...
    "całkowanie z wagą e^(-x^2) za pomocą kwadratury Gaussa-Hermite" + ...
    "'a.\n" + ...
    "Wybrane są funkcje testowe, które mają znane rozwiązania anali" + ...
    "tyczne\n" + ...
    "w przestrzeni wagowej. Obliczane są wyniki numeryczne za pomoc" + ...
    "ą funkcji\n" + ...
    "calka oraz porównywane z wynikami analitycznymi. Wyświetlany b" + ...
    "łąd\n" + ...
    "bezwględny umożliwia ocenę poprawności implementacji funkcji " + ...
    "calka.\n" + ...
    "Niewielkie błędy oznaczają, że funkcja została poprawnie\n" + ...
    "zaimplementowana.\n");

% Każdy wiersz zawiera: funkcję testową, wynik analityczny całki oraz
% funkcję przygotowaną do wypisania na ekran
ftotest = {
    @(x) 1, sqrt(pi), '1*e^(-x^2)'; % Całka z 1 * e^(-x^2)
    @(x) x.^1, 0, 'x*e^(-x^2)'; % Całka z x^1 * e^(-x^2)
    @(x) x.^2, sqrt(pi)/2,'x^2*e^(-x^2)'; % Całka z x^2 * e^(-x^2)
    @(x) x.^3, 0, 'x^3*e^(-x^2)'; % Całka z x^3 * e^(-x^2)
    @(x) x.^4, 3*sqrt(pi)/4, 'x^4*e^(-x^2)'; % Całka z x^4 * e^(-x^2)
    @(x) x.^6, 15*sqrt(pi)/8, 'x^6*e^(-x^2)'; % Całka z x^6 * e^(-x^2)
    @(x) sin(x), 0, 'sin(x)*e^(-x^2)'; % Całka z sin(x) * e^(-x^2)
    };

for i = 1:size(ftotest, 1)
    f = ftotest{i, 1}; % Funkcja testowa
    a_ans = ftotest{i, 2}; % Wynik analityczny
    n_ans = calka(f);  % Obliczenie numeryczne za pomocą calka
    error = abs((a_ans - n_ans)); % Wyznaczenie błędu bezwzględnego
    % Wyświetlanie wyników testów
    fprintf("---------------------------------------------------" + ...
        "------------------------\n");
    fprintf('Funkcja: %s\n', ftotest{i,3});
    fprintf('Wynik analityczny: %.6f\n', a_ans);
    fprintf('Wynik numeryczny: %.6f\n', n_ans);
    fprintf('Błąd bezwzględny: %.2e\n', error);
    fprintf("---------------------------------------------------" + ...
        "------------------------\n");
    if i == 1 || i == 4
        fprintf("[Press any key] ");pause(); fprintf("\n");
    end
end
end
