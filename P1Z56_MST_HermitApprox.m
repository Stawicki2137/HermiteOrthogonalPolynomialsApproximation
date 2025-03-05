function [c] = P1Z56_MST_HermitApprox(f,N)
% Projekt 1, zadanie 56
% Mateusz Stawicki, 333274
%
% Funkcja korzystając z rozwiązania układu równań normalnych, uproszczonego 
% dzięki wykorzystaniu bazy wielomianów ortonormalnych Hermite'a,
% zastosowaniu całkowania 10 punktową kwadraturą Gaussa - Hermite'a do
% obliczania iloczynu skalarnego oraz wyznaczania wartości wielomianów
% Hermite'a przy użyciu zależności rekurencyjnej, wyznacza współczynniki
% aproksymacji średniokwadratowej ciągłej w bazie wielomianów Hermite'a 
% o maksymalnym stopniu N podanym na wejściu dla podanej funkcji f.
% WEJŚCIE
%   f   - uchwyt do funkcji aproksymowanej
%   N   - najwyższy stopień wielomianu w bazie Hermite'a
% WYJŚCIE
%   c   - wektor współczynników aproksymacyjnych

c = ones(N+1,1); % inicjalizacja wektora współczynników aproksymacyjnych

for j = 0:N % iteracja przez bazę N+1 wielomianów o stopniach od 0 do N
    h = @(x) hermitnorm(j,x); % znormalizowany wielomian Hermite'a stopnia
    % j zmiennej x 
    c(j+1) = calka(@(x) f(x)*h(x)); % obliczanie j-tego współczynnika 
    % aproksymacji
end

end % function