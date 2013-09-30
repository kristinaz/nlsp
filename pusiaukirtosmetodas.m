function saknis = pusiaukirtosmetodas(func,x1,x2,filter,tol)
% Pusiaukirtos metodu surandamas funkcijos f(x) nulis intervale (x1,x2).
% IVEDIMO PARAMETRAI:
% func - funkcija, kaip m-failas arba anonimine funkcija.
% x1 < x2, intervalas kuriame ieskosime funkcijos nulio.
% filter = singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
% tol = paklaida (pagal nutylejima 0.01).
% PALEIDIMAS: saknis = pusiaukirtosmetodas($myfunc,x1,x2,filter,tol)
if nargin < 5; tol = 0.01; end
if nargin < 4; filter = 0; end
if nargin < 3 
    error('Maziausiai 3 parametrai turi buti ivesti');
    %disp('Maziausiai 3 parametrai turi buti ivesti'); 
    %saknis = NaN; 
    %return; 
end
% Patikrina ar intervalo galuose neigija 0
f1 = func(x1);
if abs(f1) < 10^(-10); saknis = x1; return; end
f2 = func(x2);
if abs(f2) < 10^(-10); saknis = x2; return; end
% Patikrina ar intervalo galuose igija priesingu zenklu reiksmes
if f1*f2 > 0;
    error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
end
% Apskaiciuoja metodo zingsniu skaiciu iki pirmojo teig. sk. suapvalinus
n = ceil(log2(abs(x2 - x1)/tol));
for i = 1:n
    % Suranda nauja vidurio taska ir apskaiciuoja jame funk. reiksme
    x3 = 0.5*(x1 + x2);
    f3 = func(x3);
    if (filter == 1) && (abs(f3) > abs(f1)) && (abs(f3) > abs(f2))
        saknis = NaN; return
    end
    if abs(f3) < 10^(-10)
        saknis = x3; return
    end
    % Tikrina, kurioje dalyje (puseje) yra sprendinys
    if f2*f3 < 0.0
        x1 = x3; f1 = f3;
    else
        x2 = x3; f2 = f3;

    end
    saknis = (x1 + x2)/2;
end
disp(['Uztruko iteraciju: ', num2str(n), '.'])